using ListopiaParser;
using ListopiaParser.Configs;
using ListopiaParser.Services;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;


var builder = Host.CreateApplicationBuilder();

var env = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT");
builder.Configuration
    .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
    .AddJsonFile($"appsettings.{env}.json", true, true)
    .AddUserSecrets<Program>(true, true)
    .AddEnvironmentVariables();

builder.Services.Configure<ListopiaOptions>(builder.Configuration.GetSection("ListopiaOptions"));
builder.Services.Configure<HardcoverOptions>(builder.Configuration.GetSection("HardcoverOptions"));
builder.Services.Configure<HardcoverOptions>(builder.Configuration.GetSection("Howdy"));
builder.Services.AddHttpClient<ListopiaService>();
builder.Services.AddHttpClient<HardcoverService>();
builder.Services.AddHostedService<ListopiaParserRunner>();

var host = builder.Build();
await host.RunAsync();