<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventas:</title>
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
            smt = con.createStatement();
            rs = smt.executeQuery("select * from ventas");    
        %>
        <div class="container">
            <h1>Consulta de ventas:</h1>
                <form class="form" action="" method="post">
                    <h2>Folio de venta:</h2>
                <input type="text" class="form-control" value="" name="txtbuscar">
                <br>
                <input class="btn btn" type="submit" value="Buscar">
                </form>
            <br>
            <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Agregar nuevo producto</button>
            </div>
            <%
                String nombuscar=request.getParameter("txtbuscar");
                if(nombuscar!=null){
                    smt=con.createStatement();
                    rs=smt.executeQuery("select * from ventas where Folio_venta LIKE"+"'%"+nombuscar+"%'");
                }else{
                    System.err.print("Error");
                }
                %>
        </div>  
              
        <br>
        <div class="container">               
            <!--<a  class="btn btn-success" href="Agregar.jsp">Nuevo Registro</a> Esto es Cuando se Crea un nuevo Archivo Agregar.jsp -->         
            <h1>Listado de productos:</h1> 
            <table class="table table-bordered"  id="tablaDatos">
                    <thead>
                        <tr>
                            <th class="text-center">No:</th>
                            <th class="text-center">Producto:</th>
                            <th class="hidden">ID Producto:</th>
                            <th class="text-center">Cantidad:</th>
                            <th class="text-center">Precio Unitario:</th>
                            <th class="text-center">Total:</th>
                            <th class="text-center">Acciones:</th>
                        </tr>
                    </thead>
                    <tbody id="tbodys">
                        <%
                            while (rs.next()) {
                        %>
                        <tr>
                            <td class="text-center"><%= rs.getInt("Numero")%></td>
                            <td class="text-center"><%= rs.getString("Producto")%></td>
                            <td class="hidden"><%= rs.getInt("Id_producto")%></td>
                            <td class="text-center"><%= rs.getInt("Cantidad")%></td>
                            <td class="text-center"><%= rs.getInt("Precio_unitario")%></td>
                            <td class="text-center"><%= rs.getInt("Total")%></td>
                            <td class="text-center">
                                
                                <!-- <input type="hidden" value="<//%= rs.getString("Id_producto")%>" id="Editar"/>
                                <input type="submit" class="btn btn-warning" data-toggle="modal" data-target="#myModal1" value="Editar"/>  -->
                                <a href="Editar.jsp?Id_producto=<%= rs.getString("Id_producto")%>" class="btn btn-primary">Editar</a>
                                <a href="Borrar.jsp?Id_producto=<%= rs.getString("Id_producto")%>" class="btn btn-danger">Borrar</a>
                            </td>
                        </tr>
                        <%}%>
                        <tr>
                            <td></td>
                            <td class="text-right">Total de productos:</td>
                            <%
                                Statement st = con.createStatement();
                                rs = st.executeQuery("SELECT SUM(Cantidad) AS cantidad FROM ventas where Folio_venta LIKE"+"'%"+request.getParameter("txtbuscar")+"%'");
                                while(rs.next()){
                                    rs.getInt("cantidad");
                            %>
                            <td class="text-center">
                                <%out.print(rs.getInt("cantidad"));%>  
                            </td>
                            <%}%>
                            <td class="text-right">Total de venta:</td>
                            <%
                                rs = st.executeQuery("SELECT SUM(Total) AS total FROM ventas where Folio_venta LIKE"+"'%"+request.getParameter("txtbuscar")+"%'");
                                while(rs.next()){
                                    rs.getInt("total");
                            %>
                            <td class="text-right">
                                <%out.print("$ "+rs.getInt("total"));%>
                            </td>
                            <%}%>
                        </tr>
                </table>
            </div>        
        <div class="container">          
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                    <div class="modal-content">
                        <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Agregar producto:</h4>
                        </div>
                        <div class="modal-body">
                            <form action="agregarproducto.jsp" method="post" id="multiplicar">
                                <label>Folio de Venta:</label> 
                                <input type="number" name="folio" class="form-control" required/><br>
                                <label>Número:</label> 
                                <input type="number" name="numero" class="form-control" required/><br>
                                <label>Id Producto:</label> 
                                <input type="number" name="id" class="form-control" required/><br>
                                <label>Producto:</label> 
                                <input type="text" name="producto" class="form-control" required/><br>
                                <label>Cantidad:</label> 
                                <input type="number" name="cantidad" id="cantidad" class="form-control" required onChange="multiplicar();"/><br>
                                <label>Precio Unitario:</label> 
                                <input type="number" name="precio" id="precio" class="form-control" required onChange="multiplicar();"/><br>
                                <label>Total:</label> 
                                <input type="number" name="total" id="total" class="form-control" required/><br>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>                            
                                    <input type="submit" value="Agregar producto" name="submit" class="btn btn-primary"/>
                                </div>
                            </form>
                        </div>
                    </div>                    
                </div>
            </div>
        </div>               
        <script src="js/jquery.js" type="text/javascript"></script>             
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
