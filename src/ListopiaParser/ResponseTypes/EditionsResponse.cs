namespace ListopiaParser.ResponseTypes;

public class EditionsResponse
{
    public required List<Edition> Editions { get; set; }
}

public class Edition
{
    public required int Id  { get; set; }
    public required string Isbn_13  { get; set; }
    public required EditionImage Image { get; set; }
}

public class EditionImage
{
    public required string Url { get; set; }
}