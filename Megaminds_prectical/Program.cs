using Megaminds_prectical.BLL;
using Megaminds_prectical.BLL.Interface;
using Megaminds_prectical.Model;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllersWithViews();
Common.ConnectionString = builder.Configuration.GetSection("ConnectionStrings:conn").Value;
DependencyResolver(builder.Services);
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();


app.MapControllerRoute(
    name: "default",
    pattern: "{controller}/{action=Index}/{id?}");

app.MapFallbackToFile("index.html");

app.Run();

void DependencyResolver(IServiceCollection service)
{
    service.AddScoped<IUser, UserService>();
}