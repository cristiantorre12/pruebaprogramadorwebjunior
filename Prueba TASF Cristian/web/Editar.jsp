<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Edición de productos:</title>
        <script>
    function multiplicar(){
	m1 = document.getElementById("cantidad").value;
	m2 = document.getElementById("precio").value;
	r = m1*m2;
	document.getElementById("total").value = r;
	}
</script>
    </head>
    <body>
        <%
       //CONECTANOD A LA BASE DE DATOS:
       Connection con;
       String url = "jdbc:mysql://sql9.freemysqlhosting.net:3306/sql9573156";
       String Driver = "com.mysql.jdbc.Driver";
       String user = "sql9573156";
       String clave = "6cxBYe9P1T";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       PreparedStatement ps;
       ResultSet rs;
       int producto=Integer.parseInt(request.getParameter("Id_producto"));
       ps=con.prepareStatement("select * from ventas where Id_producto="+producto);
       rs=ps.executeQuery();
       while(rs.next()){
                         %>
        <div class="container">
            <h1>Modificar Pedido de Producto:</h1>
            <hr>
            <form action="actualizarproducto.jsp" method="post" class="form-control" style="width: 500px; height: 400px" id="multiplicar">
                Folio de Venta:
                <input type="text" name="folio" readonly="" class="form-control" value="<%= rs.getInt("Folio_venta")%>"/>
                Numero:
                <input type="text" name="numero" class="form-control" value="<%= rs.getInt("Numero")%>" readonly=""/><br>
                ID Producto:
                <input type="text" name="id" class="form-control" value="<%= rs.getInt("Id_producto")%>" readonly=""/><br>
                Producto:
                <input type="text" name="producto" class="form-control" value="<%= rs.getString("Producto")%>"/>
                Cantidad:
                <input type="text" name="cantidad" class="form-control" value="<%= rs.getInt("Cantidad")%>" id="cantidad" onChange="multiplicar();"/>
                Precio Unitario:
                <input type="text" name="precio" class="form-control" value="<%= rs.getInt("Precio_unitario")%>" id="precio" onChange="multiplicar();"/>
                Total:
                <input type="text" name="total" class="form-control" value="<%= rs.getInt("Total")%>" id="total"/>
                <br>
                <input type="submit" name="submit"value="Guardar" class="btn btn-primary btn-lg"/>
                <a href="ventas.jsp">Regresar</a>
            </form>
            <%}%>
        </div>
    </body>
</html>