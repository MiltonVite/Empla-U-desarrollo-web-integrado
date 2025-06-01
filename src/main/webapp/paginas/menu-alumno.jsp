

<link rel="stylesheet" href="css/style-perfil-alumno.css"/>
<link rel="stylesheet" href="css/bootstrap.min.css"/>


<!-- 
<header>
    <h1><span class="logo">Emplea</span><span class="logo-accent">U</span></h1>
    <nav>
        <button>Empresas</button>
        <button>Postulaciones</button>
        <form action="${pageContext.request.contextPath}/CerrarSesion" method="POST">
            <button>Cerrar Sesion</button>
        </form>
    </nav>
</header>
comment -->

<header>
    <nav class="navbar bg-dark p-3 ">
        <div class="container">
            <a class="navbar-brand text-light fs-1">Emplea<span class="text-danger">U</span></a>
            <form class="d-flex" method="POST" action="${pageContext.request.contextPath}/CerrarSesion">
                <a href="${pageContext.request.contextPath}/Empresa" class="btn btn-secondary me-4 p-3 fs-5">Empresas</a>
                <a href="#" class="btn btn-secondary me-4 p-3 fs-5">Mis Postulaciones</a>

                <button type="submit" class="btn btn-danger p-3 fs-5">Cerrar Sesión</button>
            </form>

        </div>
    </nav>
</header>