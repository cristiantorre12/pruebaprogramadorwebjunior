<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
       Connection con;       
       String url = "jdbc:mysql://sql9.freemysqlhosting.net:3306/sql9573156";
       String Driver = "com.mysql.jdbc.Driver";
       String user = "sql9573156";
       String clave = "6cxBYe9P1T";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       PreparedStatement ps;
       int numero=Integer.parseInt(request.getParameter("Id_producto"));
       ps=con.prepareStatement("delete from ventas where Id_producto="+numero);
       ps.executeUpdate();
       response.sendRedirect("ventas.jsp");
       %>
    </body>
</html>
