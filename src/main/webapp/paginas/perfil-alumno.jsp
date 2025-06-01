<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil Alumno</title>
    </head>
    <body>

        <%
            HttpSession existe = request.getSession(false);

            if (existe == null || existe.getAttribute("usuario") == null) {
                response.sendRedirect(request.getContextPath() + "/paginas/iniciar_sesion.jsp");
                return;
            }

            String rol = (String) existe.getAttribute("rol");

            if (!"estudiante".equals(rol)) {
                response.sendRedirect(request.getContextPath() + "/paginas/iniciar_sesion.jsp");
                return;
            }
        %>


        <%@include file="menu-alumno.jsp" %>


        <section class="vh-100" style="background-color: #f4f5f7;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-lg-6 mb-4 mb-lg-0">
                        <div class="card mb-3" style="border-radius: .5rem;">
                            <div class="row g-0">
                                <div class="col-md-4 gradient-custom text-center text-white"
                                     style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                                    <img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSOb8r7spESjC00_J-W5YEdEYhBg_7HggdfLPbgqf0ivA3vqbHt"
                                         alt="Avatar" class="img-fluid my-5" style="width: 80px;" />
                                    <h5>${alumno.nombre} ${alumno.apellido}</h5>
                                    <p>${alumno.dni}</p>
                                    <br>
                                    <h6>Habilidades</h6>
                                    <p>${alumno.habilidades}</p>
                                    <br>
                                    <button class="btn btn-success">Editar</button>
                                    <i class="far fa-edit mb-5"></i>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body p-4">
                                        <h6>Informacion</h6>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Email</h6>
                                                <p class="text-muted">${alumno.email}</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Telefono</h6>
                                                <p class="text-muted">${alumno.telefono}</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Carera</h6>
                                                <p class="text-muted">${alumno.carrera}</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Ciclo academico:</h6>
                                                <p class="text-muted">${alumno.ciclo}</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Universidad</h6>
                                                <p class="text-muted">${alumno.universidad}</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Genero</h6>
                                                <p class="text-muted">${alumno.genero}</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Fecha de nacimiento</h6>
                                                <p class="text-muted">${alumno.fecha_nacimiento}</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Ubicacion</h6>
                                                <p class="text-muted">${alumno.ubicacion}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>



        <!-- comment 
        <main>
            <section class="perfil card animate">
                <img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSOb8r7spESjC00_J-W5YEdEYhBg_7HggdfLPbgqf0ivA3vqbHt" alt="Perfil" class="perfil-img">
                <h2>${alumno.nombre} ${alumno.apellido}</h2>
                <p class="sub">Datos personales</p>
                <hr />
                <p><strong>Dni:</strong>${alumno.dni}</p>
                <p><strong>Carrera:</strong>${alumno.carrera}</p>
                <p><strong>Ciclo:</strong>${alumno.ciclo}</p>
                <p><strong>Correo:</strong>${alumno.email}</p>
                <div class="botones">
                    <form action="${pageContext.request.contextPath}/CerrarSesion" method="POST">
                        <button class="cerrar">Cerrar sesión</button>
                    </form>
                </div>
            </section>

        -->

        <!-- Esto es un comentario en HTML
    <section class="formacion card animate">
        <h2>Formación académica</h2>
        <hr />
        <ul>
            <li>Administración de empresas</li>
            <li>Universidad Tecnológica del Perú</li>
            <li>Universitario - En Curso</li>
        </ul>
        <div class="acciones">
            <p><strong>Objetivo</strong> <a href="#">➤ Agregar un objetivo.</a></p>
            <p><strong>Discapacidad</strong> <a href="#">➤ Agregar una discapacidad.</a></p>
        </div>
        <p class="nota">
            Si tienes alguna discapacidad, no es obligatorio que la declares. Pero si lo haces, te ayudará a encontrar puestos que mejor se adapten a tus necesidades.
        </p>
        <button class="btn-full">Agregar conocimientos y habilidades</button>
    </section>
        -->


</body>
</html>
