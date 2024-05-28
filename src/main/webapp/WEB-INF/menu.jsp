<%
    String opcion = request.getParameter("opcion");
%>
<header data-bs-theme="dark">
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Punto de venta</a>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
                    <li class="nav-item">
                        <a class="nav-link <%= (opcion.equals("productos") ? "active" : "")%>" href="ProductoControlador">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%= (opcion.equals("clientes") ? "active" : "")%>" href="ClienteControlador">Clientes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%= (opcion.equals("ventas") ? "active" : "")%>" href="VentaControlador">Ventas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%= (opcion.equals("usuarios") ? "active" : "")%>" href="UsuarioControlador">Usuarios</a>
                    </li>
                </ul>
                <a href="LoginControlador?action=logout" class="btn btn-outline-danger">Cerrar Sesion</a>
            </div>
        </div>
    </nav>
</header>

