<%-- 
    Document   : Login
    Created on : 25/07/2020, 14:39:09 PM
    Author     : Taipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="CSS/estilo2.css" type="text/css"/>
        <script src="https://kit.fontawesome.com/f04f120a82.js" crossorigin="anonymous"></script>
    </head>
    <body>
        
        <form name="f_validar" action="Validar.jsp">
            <div id="cuadro" align="center" >
            <table border="0" align="center" align ="center">
                <thead>
                    <tr align="center">
                        <td colspan="2"><font size="100"><i class="fas fa-user-circle"></i></font></td>
                    </tr>
                </thead>
                <tbody>
                    <tr align="center">
                        <td align="center" id="subtitulo1"><i class="far fa-user"></i></td>
                        <td><input type="text" name="f_usuario" value="" placeholder="Usuario"/></td>
                    </tr>
                    <tr align="center">
                        <td align="center" id="subtitulo1"><i class="fas fa-key"></i></td>
                        <td><input type="password" name="f_contraseña" value="" placeholder="Contraseña"/></td>
                    </tr>
                    <tr>
                        <td>Tipo: </td>
                        <td>
                            <form>
                        <select style="text-align:center" name="f_tipo"  >
                          <option>Laboratorio</option>
                        </select>
                        </div>
                        </form>
                            </td>
                    </tr>
                    <tr align="center">
                        <td colspan="2"><input type="submit" value="Ingresar" name="f_ingresar" /></td>
                    </tr>
                </tbody>
            </table>
                </div>
        </form>
    </body>
</html>
