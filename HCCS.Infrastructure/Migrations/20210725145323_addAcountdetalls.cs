using Microsoft.EntityFrameworkCore.Migrations;

namespace HCCS.Infrastructure.Migrations
{
    public partial class addAcountdetalls : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "AccountingAccountId",
                table: "ResultStatusDetails",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "AccountingAccountNumber",
                table: "ResultStatusDetails",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "AccountingAccountId",
                table: "ResultStatusDetails");

            migrationBuilder.DropColumn(
                name: "AccountingAccountNumber",
                table: "ResultStatusDetails");
        }
    }
}
