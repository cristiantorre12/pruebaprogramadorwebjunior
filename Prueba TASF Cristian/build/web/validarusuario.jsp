<%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    String userid = request.getParameter("usuario");    
    String pwd = request.getParameter("clave");
    int rps=0;
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pruebacristian",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("SELECT COUNT(ID) AS cantidad FROM `usuarios` WHERE Usuario='"+userid+"' AND Contraseña='"+pwd+"'");
    while(rs.next()){
            rps=rs.getInt("cantidad");
        }
    if (rps!=0) {
         response.sendRedirect("ventas.jsp");
    } else {
       response.sendRedirect("index.jsp");
    }
%>
    </body>
</html>
