using Microsoft.EntityFrameworkCore.Migrations;

namespace HCCS.Infrastructure.Migrations
{
    public partial class addInsitucion : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ResultStatus_BranchOffice_BranchOfficeId",
                table: "ResultStatus");

            migrationBuilder.DropIndex(
                name: "IX_ResultStatus_BranchOfficeId",
                table: "ResultStatus");

            migrationBuilder.AddColumn<string>(
                name: "Institution",
                table: "ResultStatus",
                type: "nvarchar(max)",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Institution",
                table: "ResultStatus");

            migrationBuilder.CreateIndex(
                name: "IX_ResultStatus_BranchOfficeId",
                table: "ResultStatus",
                column: "BranchOfficeId");

            migrationBuilder.AddForeignKey(
                name: "FK_ResultStatus_BranchOffice_BranchOfficeId",
                table: "ResultStatus",
                column: "BranchOfficeId",
                principalTable: "BranchOffice",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
