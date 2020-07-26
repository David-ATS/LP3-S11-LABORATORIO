<%-- 
    Document   : Menu
    Created on : 25/07/2020, 14:39:09 PM
    Author     : Taipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú</title>
        <link rel="stylesheet" href="CSS/estilo2.css" type="text/css"/>
        <script src="https://kit.fontawesome.com/f04f120a82.js" crossorigin="anonymous"></script>
        <style type="text/css">
            *{
                margin: 0px;
                padding: 0px;
            }
            #header{
                margin:auto;
                width:auto;
                font-family: Arial,Helvetica, sans-serif;  
                padding: 5px 5px 70px 5px;
                opacity: 0.8;
            }
            ul, ol {
                list-style:none;
            }
            .nav li a {
                background-color:#000;
                color:#fff;
                text-decoration:none;
                padding:33px 106px;
                display: block;
            }
            .nav li a:hover{
                background-color: #434343;
            }
            .nav > li {
                float: left;
            }
            .nav2 li a {
                background-color:#000;
                color:#fff;
                text-decoration:none;
                padding:15px 50px;
                display: block;
            }
            .nav2 > li {
                float: left;
            }
            .nav3 li a {
                background-color:#000;
                color:#fff;
                text-decoration:none;
                padding:15px 50px;
                display: block;
            }
            .nav3 li a:hover{
                background-color: #434343;
            }
            .nav3 > li {
                float: left;
            }
        </style>
    </head>
    <div id="header" >
        <ul class="nav2">
            <li><a><font size="10" color="white"><i class="fas fa-mail-bulk"></i></font></a></li>
        </ul>
        <ul class="nav">
            <li><a href="DatosPersona.jsp">Persona</a></li>
            <li><a href="DatosArea.jsp">Area</a></li>
            <li><a href="DatosRol.jsp">Rol</a></li>
            <li><a href="DatosSugerencia.jsp">Sugerencia</a></li>
        </ul>
                <ul class="nav3">
            <li><a href="Login.jsp"><font size="10" color="red"><i class="fas fa-sign-out-alt"></i></font></a></li>
        </ul>
    </div>
</html>
