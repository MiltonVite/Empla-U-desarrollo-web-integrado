<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <c:choose>
            <c:when test="${not empty empresas}">
                <c:forEach var="empresa" items="${empresas}">
                    <h1><strong>Nombre de marca de empresa:</strong> ${empresa.nombre_emp} </h1>
                </c:forEach>
            </c:when>
        </c:choose>

    </body>
</html>
