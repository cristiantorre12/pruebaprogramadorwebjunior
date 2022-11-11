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
            String url = "jdbc:mysql://localhost:3306/pruebacristian";
            String Driver = "com.mysql.jdbc.Driver";
            String user = "root";
            String clave = "";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user, clave);
            PreparedStatement ps;
            Statement smt;
            ResultSet rs;    
                String producto;
                int id, f,n,c,p,t;
                f = Integer.parseInt(request.getParameter("folio"));
                n = Integer.parseInt(request.getParameter("numero"));
                id = Integer.parseInt(request.getParameter("id"));
                producto = request.getParameter("producto");
                c = Integer.parseInt(request.getParameter("cantidad"));
                p = Integer.parseInt(request.getParameter("precio"));
                t = Integer.parseInt(request.getParameter("total"));
                
                if (f != 0 && n != 0 && producto != null && id != 0 && c != 0 && p != 0 && t != 0) {
                    ps = con.prepareStatement("insert into ventas(Folio_venta, Numero, Id_Producto, Producto, Cantidad, Precio_unitario, Total)values('" + f + "','" + n + "','"+ id + "','"+producto+"','"+c+"','"+p+"','"+t+"')");
                    ps.executeUpdate();
                    response.sendRedirect("ventas.jsp");
                }
            %> 
    </body>
</html>
