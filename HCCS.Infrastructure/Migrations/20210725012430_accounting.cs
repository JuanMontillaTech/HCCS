using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace HCCS.Infrastructure.Migrations
{
    public partial class accounting : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "TypeAcountingAcount",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Debit = table.Column<bool>(type: "bit", nullable: false),
                    Credit = table.Column<bool>(type: "bit", nullable: false),
                    LastModifiedBy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedBy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LastModifiedDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Enable = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TypeAcountingAcount", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AccountingAccount",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TypeAcountingAcountId = table.Column<int>(type: "int", nullable: false),
                    ReadOnly = table.Column<bool>(type: "bit", nullable: false),
                    AccountNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    AccountName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LastModifiedBy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedBy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LastModifiedDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Enable = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AccountingAccount", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AccountingAccount_TypeAcountingAcount_TypeAcountingAcountId",
                        column: x => x.TypeAcountingAcountId,
                        principalTable: "TypeAcountingAcount",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "TypeAcountingAcount",
                columns: new[] { "Id", "CreatedBy", "CreatedDate", "Credit", "Debit", "Description", "Enable", "LastModifiedBy", "LastModifiedDate" },
                values: new object[,]
                {
                    { 1, null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, false, "Activo", false, null, null },
                    { 2, null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, true, "Pasivo", false, null, null },
                    { 3, null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, true, "Patrimonio o Capital", false, null, null },
                    { 4, null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, true, "Ingreso", false, null, null },
                    { 5, null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, false, "Costos", false, null, null },
                    { 6, null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, false, "Gastos", false, null, null }
                });

            migrationBuilder.InsertData(
                table: "AccountingAccount",
                columns: new[] { "Id", "AccountName", "AccountNumber", "CreatedBy", "CreatedDate", "Enable", "LastModifiedBy", "LastModifiedDate", "ReadOnly", "TypeAcountingAcountId" },
                values: new object[,]
                {
                    { 1, "Caja", "1010", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 1 },
                    { 64, "10 % caja general", "6144", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 63, "Obtención y legalización de documentos", "6143", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 62, "Actividades culturales", "6142", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 61, "Gastos de becas", "6141", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 60, "Gastos de representación", "6140", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 59, "Útiles de aseo personal", "6139", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 58, "Vacaciones y diversiones", "6138", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 57, "Otros gastos (utensilios)", "6137", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 65, "Tercera parte saldo anual", "6145", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 56, "Vestidos", "6136", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 54, "Jardinería y embellecimiento", "6134", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 53, "Taller de costura", "6133", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 52, "Donación y obsequios", "6132", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 51, "Alimentación", "6131", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 50, "Impuestos", "6130", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 49, "Material de oficina", "6129", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 48, "Formación(Noviciado-Postulando-Juniorado)", "6128", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 47, "Gastos financieros", "6127", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 55, "Inscripciones", "6135", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 46, "Mantenimiento de muebles y equipos de oficinas", "6126", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 66, "Seguro retiro hermanas", "6146", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 68, "Canonización", "6148", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 86, "Reembolsos", "6188", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 85, "Asamblea y evaluaciones", "6185", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 84, "Ayudada a otras comunidades", "6182", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 83, "Seguro de vehículo", "6174", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 82, "Promociones vocacional", "6169", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 81, "Fondos operacionales", "6163", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 80, "Cuota cóndor y escuelas católicas", "6162", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 79, "Capitulo general", "6160", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 67, "Casa madre amadora, hermanas mayores", "6147", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 78, "Cambio de cheques", "6159", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 76, "Préstamos", "6156", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 75, "Cambio de divisas", "6155", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 74, "Alimento de animales", "6154", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 73, "Publicidad y propaganda", "6153", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 72, "Sistema de cómputos", "6152", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 71, "Consignaciones bancarias", "6151", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 70, "publicidad y propaganda", "6150", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 69, "Gastos funerales", "6149", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 77, "Construcción", "6157", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 }
                });

            migrationBuilder.InsertData(
                table: "AccountingAccount",
                columns: new[] { "Id", "AccountName", "AccountNumber", "CreatedBy", "CreatedDate", "Enable", "LastModifiedBy", "LastModifiedDate", "ReadOnly", "TypeAcountingAcountId" },
                values: new object[,]
                {
                    { 45, "Mantenimiento de equipos", "6125", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 44, "Médicos y medicinas", "6124", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 43, "Obras de apostolado y fundación", "6123", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 19, "Taller de costura", "4211", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 4 },
                    { 18, "Otros ingresos", "4206", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 4 },
                    { 17, "Comisiones", "4205", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 4 },
                    { 16, "Subsidios", "4204", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 4 },
                    { 15, "Donaciones", "4203", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 4 },
                    { 14, "Intereses bancarios", "4202", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 4 },
                    { 13, "Recargo de mora", "4120", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 4 },
                    { 12, "Certificados, sellos y record", "4119", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 4 },
                    { 20, "Egresos", "61", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 11, "Venta de camiseta", "4118", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 4 },
                    { 9, "Cobro prestamos", "4116", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 4 },
                    { 8, "Cambio de divisas", "4114", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 4 },
                    { 7, "Cafetería", "4111", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 4 },
                    { 6, "Aporte por trabajo hermanas", "4110", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 4 },
                    { 5, "Becas", "4109", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 4 },
                    { 4, "Ventas", "4108", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 4 },
                    { 3, "Cuotas Estudiantiles", "4107", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 4 },
                    { 2, "Inscripciones", "4106", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 4 },
                    { 10, "Pre- Matricula", "4117", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 4 },
                    { 21, "Templo y culto ", "6101", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 22, "Sueldo personal", "6102", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 23, "Prestaciones laborales", "6103", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 42, "Regalos y fiestas", "6122", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 41, "Otras Ayudas", "6121", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 40, "Ayuda a familiares", "6120", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 39, "Viajes Extranjero y viáticos", "6119", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 38, "Viajes nacionales y viáticos", "6118", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 37, "Mantenimiento edificio y reparaciones", "6117", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 36, "Combustible y lubricantes", "6116", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 35, "Mantenimiento equipo de transporte", "6115", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 34, "Utensilios de limpieza", "6114", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 33, "suscripciones y compra de libros", "6113", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 32, "material didáctico", "6112", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 31, "refrigerios", "6111", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 30, "Teléfonos y comunicaciones", "6110", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 29, "Electricidad", "6109", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 28, "Agua, basura y alcantarillado", "6108", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 27, "Cursillos y retiros espirituales", "6107", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 26, "Capacitación al personal", "6106", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 }
                });

            migrationBuilder.InsertData(
                table: "AccountingAccount",
                columns: new[] { "Id", "AccountName", "AccountNumber", "CreatedBy", "CreatedDate", "Enable", "LastModifiedBy", "LastModifiedDate", "ReadOnly", "TypeAcountingAcountId" },
                values: new object[,]
                {
                    { 25, "Seguro medico", "6105", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 24, "Seguro social", "6104", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 87, "Honorarios profesionales", "6196", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 },
                    { 88, "Regalía pascual", "6197", null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), false, null, null, false, 6 }
                });

            migrationBuilder.CreateIndex(
                name: "IX_AccountingAccount_TypeAcountingAcountId",
                table: "AccountingAccount",
                column: "TypeAcountingAcountId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AccountingAccount");

            migrationBuilder.DropTable(
                name: "TypeAcountingAcount");
        }
    }
}
