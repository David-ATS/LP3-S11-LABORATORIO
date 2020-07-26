<%-- 
    Document   : Validar
    Created on : 25/07/2020, 14:39:09 PM
    Author     : Taipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%!
            String s_usuario;
            String s_contraseña;
            String s_tipo;
        %>
    </head>
    <body>
        <%
            
            s_tipo = request.getParameter("f_tipo");
            s_usuario = request.getParameter("f_usuario");
            s_contraseña = request.getParameter("f_contraseña");
            if (s_usuario.equals("grupo") && s_contraseña.equals("123")&& s_tipo.equals("Laboratorio")) {
                response.sendRedirect("Menu.jsp");
            } else {
                response.sendRedirect("Login.jsp");
            }
        %>
    </body>
</html>
