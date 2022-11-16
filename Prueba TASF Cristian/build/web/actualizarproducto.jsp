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
       ResultSet rs;
                String pr;
                int id, f,n,c,p,t;
                f = Integer.parseInt(request.getParameter("folio"));
                n = Integer.parseInt(request.getParameter("numero"));
                id = Integer.parseInt(request.getParameter("id"));
                pr = request.getParameter("producto");
                c = Integer.parseInt(request.getParameter("cantidad"));
                p = Integer.parseInt(request.getParameter("precio"));
                t = Integer.parseInt(request.getParameter("total"));
       if (f != 0 && n != 0 && pr != null && id != 0 && c != 0 && p != 0 && t != 0) {
           ps=con.prepareStatement("update ventas set Producto='"+pr+"', Cantidad='"+c+"',Precio_unitario='"+p+"',Total='"+t+"' where Id_producto="+id);
           ps.executeUpdate();
           response.sendRedirect("ventas.jsp");
       }
%>
    </body>
</html>
