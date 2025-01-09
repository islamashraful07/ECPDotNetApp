using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using ECPDotNetApp.Models;

namespace ECPDotNetApp.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        var joke = new
        {
            Question = "Why did the DevOps engineer bring a pillow to work?",
            Answer = "Because the ECP took over their job, and now they just nap all day!"
        };

        return View(joke);
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
