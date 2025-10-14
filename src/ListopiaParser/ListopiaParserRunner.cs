using ListopiaParser.ResponseTypes;
using ListopiaParser.Services;
using Microsoft.Extensions.Hosting;

namespace ListopiaParser;

public class ListopiaParserRunner : BackgroundService
{
    private readonly ListopiaService _listopiaService;
    private readonly HardcoverService _hardcoverService;
    private const int Pages = 2;

    public ListopiaParserRunner(ListopiaService listopiaService,  HardcoverService hardcoverService)
    {
        _listopiaService = listopiaService;
        _hardcoverService = hardcoverService;
    }
    
    protected override async Task ExecuteAsync(CancellationToken cancellationToken)
    {
        Console.WriteLine("Howdy");

        var pages = Enumerable.Range(1, Pages);
        var hardcoverTasks = new List<Task<List<Edition>>>();

        var isbnsTaskList = pages.Select(x => _listopiaService.GetListopiaIsbns(x, cancellationToken));

        await foreach (var isbnsTask in Task.WhenEach(isbnsTaskList))
        {
            var editionsTask = _hardcoverService.GetBookEditions(await isbnsTask, cancellationToken);
            hardcoverTasks.Add(editionsTask);
        }
        
        var editionsList = (await Task.WhenAll(hardcoverTasks)).SelectMany(x => x).ToList();
        
        Console.WriteLine("Number of books: " + editionsList.Count);
    }
}