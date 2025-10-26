from PIL import Image
import io
import torch
from torch import Tensor
import clip

import json
import asyncio
import aiohttp
from aiohttp import ClientSession

from typing import List
from litserve import Request
import litserve as ls


class ClipServer(ls.LitAPI):
    def setup(self, device):
        self.model_name = "ViT-B/32"
        self.device = device
        self.clip_model, self.preprocess = clip.load(self.model_name, device=self.device)
    
    def decode_request(self, request: Request):
        image_urls: List[str] = request["image_urls"]
        images_tensor = asyncio.run(self._retrieve_images(image_urls))
        
        return images_tensor
    
    def predict(self, images_tensor: Tensor):
        with torch.no_grad():
            image_embeddings = self.clip_model.encode_image(images_tensor).cpu().numpy()
        
        return {"image_embeddings": json.dumps(image_embeddings.tolist())}
    
    
    async def _retrieve_images(self, urls: List[str]):
        async with aiohttp.ClientSession() as session:
            ret = await asyncio.gather(*(self._get_image(url, session) for url in urls))
        print(f"Got {len(ret)} images. First image: {ret[0]}")
        
        return torch.cat([image for image in ret if image is not None], dim=0)
    
    async def _get_image(self, url: str, session: ClientSession):
        try:
            async with session.get(url=url) as response:
                res = await response.read()
                image = self.preprocess(Image.open(io.BytesIO(res))).unsqueeze(0).to(self.device)
                
                return image
        except Exception as e:
            print(f"Unable to process image url {url} due to {e.__class__}.")

if __name__ == "__main__":
    server = ls.LitServer(ClipServer())
    server.run(port=8000, generate_client_file=False)
