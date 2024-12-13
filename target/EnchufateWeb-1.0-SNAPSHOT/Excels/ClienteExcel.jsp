<%@ page import="java.sql.*" %>
<%@ page import="org.apache.poi.hssf.usermodel.*" %>
<%@ page import="org.apache.poi.ss.usermodel.*" %>
<%@ page import="org.apache.poi.util.IOUtils" %>
<%@ page import="java.io.*" %>

<%
response.setContentType("application/vnd.ms-excel");
response.setHeader("Content-Disposition", "attachment; filename=categorias_habitacion.xls");

// Conexi�n a la base de datos
String url = "jdbc:mysql://localhost:3306/enchufate?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&characterEncoding=UTF-8";
String username = "root";
String password = "";
Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

OutputStream outputStream = response.getOutputStream(); // Cambio de nombre de la variable

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, username, password);

    // Consulta SQL para obtener datos de la tabla Cliente
    String sql = "SELECT * FROM cliente";
    stmt = conn.prepareStatement(sql);
    rs = stmt.executeQuery();

    // Crear el libro de Excel
    HSSFWorkbook workbook = new HSSFWorkbook();
    HSSFSheet sheet = workbook.createSheet("Clientes");

    // Agregar logo
    InputStream inputStream = new FileInputStream(application.getRealPath("/resources/img/AdmNav/Logo.png"));
    byte[] bytes = IOUtils.toByteArray(inputStream);
    int pictureIdx = workbook.addPicture(bytes, Workbook.PICTURE_TYPE_PNG);
    inputStream.close();

    CreationHelper helper = workbook.getCreationHelper();
    Drawing<?> drawing = sheet.createDrawingPatriarch();
    ClientAnchor anchor = helper.createClientAnchor();
    anchor.setCol1(0);
    anchor.setRow1(0);
    Picture pict = drawing.createPicture(anchor, pictureIdx);
    pict.resize();

    // Crear la fila de encabezado, desplazada una fila hacia abajo debido a la imagen
    HSSFRow headerRow = sheet.createRow(8);
    headerRow.createCell(0).setCellValue("ID");
    headerRow.createCell(1).setCellValue("Nombres");
    headerRow.createCell(2).setCellValue("Apellido Paterno");
    headerRow.createCell(3).setCellValue("Apellido Materno");
    headerRow.createCell(4).setCellValue("DNI");
    headerRow.createCell(5).setCellValue("Fecha de Nacimiento");
    headerRow.createCell(6).setCellValue("Usuario");
    headerRow.createCell(7).setCellValue("Correo");
    headerRow.createCell(8).setCellValue("Contrase�a");

    // Llenar el libro con los datos de la base de datos
    int rowNum = 9; // Empezar despu�s de la fila de encabezado
    while (rs.next()) {
        HSSFRow row = sheet.createRow(rowNum++);
        row.createCell(0).setCellValue(rs.getString("CodCliente"));
        row.createCell(1).setCellValue(rs.getString("Nombres"));
        row.createCell(2).setCellValue(rs.getString("ApePaterno"));
        row.createCell(3).setCellValue(rs.getString("ApeMaterno"));
        row.createCell(4).setCellValue(rs.getString("DNI"));
        row.createCell(5).setCellValue(rs.getString("FechaNacimiento"));
        row.createCell(6).setCellValue(rs.getString("Usuario"));
        row.createCell(7).setCellValue(rs.getString("Correo"));
        row.createCell(8).setCellValue(rs.getString("Contrase�a"));
    }

    // Escribir el libro en el flujo de salida
    workbook.write(outputStream);
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
