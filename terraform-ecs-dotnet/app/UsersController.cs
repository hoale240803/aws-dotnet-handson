
using System.Data;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using Npgsql;

[ApiController]
[Route("users")]
public class UsersController : ControllerBase
{
    private readonly string _connectionString = string.Empty;
    private readonly IConfiguration _config;

    public UsersController(IConfiguration config)
    {
        _config = config;
        _connectionString = _config.GetConnectionString("RDS");
    }
    [HttpGet]
    public async Task<IActionResult> GetUsers()
    {
        using IDbConnection db = new NpgsqlConnection(_connectionString); // switch to SqlConnection for SQL Server

        var users = await db.QueryAsync<User>("SELECT id, name, email FROM users");
        return Ok(users);
    }
}

public class User
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string Email { get; set; }
}