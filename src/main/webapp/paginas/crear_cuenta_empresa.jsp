<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Empresa</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style-crear-cuenta-empresa.css">
    </head>

    <body>
        <%@include file="menu.jsp" %>

        <main class="body">
            <div class="contenido">

                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show text-center" role="alert" id="alerta">
                        ${error}
                    </div>
                    <script>
                        setTimeout(() => {
                            const alert = document.getElementById("alerta")
                            if (alert) {
                                alert.remove();
                            }
                        }, 5000);
                    </script>
                </c:if>


                <div class="titulo">
                    <h2>Crea una cuenta</h2>
                    <p>Podrás publicar tu oferta laboral en un instante.</p>
                </div>
                <form action="${pageContext.request.contextPath}/RegistrarUsuario" method="POST" autocomplete="off">
                    <hr>
                    <input type="hidden" name="accion" value="crearCuentaEmpresa">

                    <div class="row">
                        <input type="text" name="nombre_emp"placeholder="Nombre de la marca" value="${param.nombre_emp}" required />
                        <input type="text" name="razonSocial"placeholder="Razon social" value="${param.razonSocial}" required />
                    </div>
                    <input type="text" name="ruc" pattern="\d{11}" maxlength="11" placeholder="Escribe el RUC de empresa" value="${param.ruc}" required>          

                    <input type="text" name="sector" placeholder="Escribe el sector dirigido al que va dirigido su empresa" value="${param.sector}" required>

                    <input type="text" name="ubicacion"placeholder="Escribe en donde esta ubicada su empresa" value="${param.ubicacion}" required>  

                    <textarea name="descripcion" placeholder="Escriba una breve descripcion de su empresa" >${param.descripcion}</textarea>

                    <input type="email" name="email" placeholder="Email" value="${param.email}" autocomplete="off" required><br>
                    <input type="password" name="contrasena" placeholder="Escribe tu contraseña" autocomplete="off" required><br>
                    <input type="password" name="confirmarContrasena" placeholder="Confirma tu contraseña" autocomplete="off" required><br>

                    <button type="submit">Registrarte</button>

                    <div class="login-link">
                        <a href="iniciar_sesion.jsp">¿Ya tienes una cuenta?</a>
                    </div>
                </form>
            </div>
        </main>






        <!-- comment 
            <main class="body">
                <div class="contenido">

                    <h2>Registro de empresas</h2>

        <c:if test="${not empty error}">
            <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
            ${error}
        </div>
            <c:remove var="error" scope="session"/>
        </c:if>
        
        <form action="../RegistrarUsuario" method="POST">
        
            <input type="hidden" name="accion" value="crearCuentaEmpresa">
        
            <input type="text" name="nombre_emp" placeholder="Escriba el nombre de la empresa"
                required><br>
                
            <input type="text" name="ruc" pattern="\d{11}" maxlength="11"
                placeholder="Escriba el RUC de la empresa" required><br>
        
            <input type="text" name="razonSocial" placeholder="Escriba la razón social" required><br>
        
            <input type="text" name="sector" placeholder="Escriba su sector empresarial" required><br>
        
            <input type="text" name="direccion" placeholder="Escriba la direccion de la empresa"
                required><br>
        
            <textarea name="descripcion" placeholder="Escriba su descripcion" required></textarea><br>
        
            <textarea name="mision"></textarea>
        
            <textarea name="vision"></textarea>
        
            <input type="email" name="email" placeholder="Escriba su email" required><br>
        
            <input type="password" name="contrasena" placeholder="Escriba su contraseña" required><br>
        
            <input type="password" name="confirmarContrasena" placeholder="Confirme su contraseña"
                required><br>
        
            <button type="submit">Registrar Empresa</button>
        </form>
        <div class="redirect-login">
            <p>Si ya tienes cuenta, <a href="paginas/iniciar_sesion.jsp">inicia sesión aquí</a>.</p>
        </div>
        </div>
        </main>
        -->

    </body>

</html>