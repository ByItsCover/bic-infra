using ListopiaParser.ResponseTypes;

namespace ListopiaParser.Interfaces;

public interface IEmbedService
{
    public Task<IEnumerable<Cover>> GetCoverEmbeddings(List<Edition> editionList,
        CancellationToken cancellationToken);
}