<%
    if (session.getAttribute("logeado") != "OK") {
        response.sendRedirect("login.jsp");
    }
%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <title>Punto de venta</title>
    </head>
    <body>
        <div class="container">
            <h1>Ventas</h1>
            <jsp:include page="WEB-INF/menu.jsp">
                <jsp:param name="opcion" value="ventas"/>
            </jsp:include>
            <br>
            <a href="VentaControlador?action=add" class="btn btn-primary btn-lg "><i class="fa-sharp fa-solid fa-circle-plus"></i> Nuevo </a>
            
            <table class="table table-striped">
                <tr>
                    <th>Id</th>
                    <th>Nombre de cliente</th>
                    <th>Producto</th>
                    <th>Fecha</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="item" items="${ventas}">
                    <tr>
                    <td>${item.id}</td>
                    <td>${item.cliente}</td>
                    <td>${item.producto}</td>
                    <td>${item.fecha}</td>
                    <td><a href="VentaControlador?action=edit&id=${item.id}"><i class="fa-sharp fa-solid fa-pen-to-square"></i></a></td>
                    <td><a href="VentaControlador?action=delete&id=${item.id}" onclick="return(confirm('Está seguro ???'))"><i class="fa-sharp fa-solid fa-trash"></i></a></td>
                </tr>
                </c:forEach>
                
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </body>
</html>

