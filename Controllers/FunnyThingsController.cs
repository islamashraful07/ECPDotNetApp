using Microsoft.AspNetCore.Mvc;

public class FunnyThingsController : Controller
{
    public IActionResult Index()
    {
        var joke = new
        {
            Question = "Why did the DevOps engineer bring a pillow to work?",
            Answer = "Because the ECP took over their job, and now they just nap all day!"
        };

        return View(joke);
    }
}
