<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Area</title>
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
        <%!
            String consulta;
            String consulta1;
            Connection cn;
            PreparedStatement pst;
            PreparedStatement pst1;
            ResultSet rs;
            ResultSet rs1;
            String s_accion;
            String s_idarea;
            String s_nombre;
            String s_estado;
        %>
    </head>
    
    <!-- TABLA DEL MENÚ SUPERIOR -->
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
    

    <body align = "center">
        <%
            try{
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                
                s_accion = request.getParameter("f_accion");
                s_idarea = request.getParameter("f_idarea");
                
                if(s_accion!=null && s_accion.equals("M1")){
                    consulta = "select nombre, estado"
                                + " from area"
                                + " where"
                                + " idarea= " + s_idarea + "; ";
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
        %>
    <!---------------------------- EDITAR ---------------------------->
    <div id="cuadro2" align="center"><font face="calibri"> 
        <form name="EditarAreaForm" action="DatosArea.jsp" method="GET">
            <table border="0" align="center">
                
                <thead>
                    <tr>
                        <th colspan="2">Editar Area</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" name="f_nombre" value="<% out.print(rs.getString(1)); %>" maxlength="30" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="<% out.print(rs.getString(2)); %>" maxlength="1" size="2"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Editar" name="f_editar" />
                            <input type="hidden" name="f_accion" value="M2" />
                            <input type="hidden" name="f_idarea" value="<% out.print(s_idarea); %>" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
                        <form name="Cancelar" action="DatosArea.jsp">
                            <input type="submit" value="Cancelar" />
                        </form>
    </font></div>
        <%
                }
            }else{
        %>
    <!---------------------------- AGREGAR ---------------------------->
    <div id="cuadro2" align="center"><font face="calibri"> 
        <form name="AgregarAreaForm" action="DatosArea.jsp" method="GET">
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Area</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" name="f_nombre" value="" maxlength="30" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="" maxlength="1" size="2"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Agregar" name="f_agregar" />
                            <input type="hidden" name="f_accion" value="C" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        </font></div>
        <%
        }
        %>
    <div id="cuadro2" align="center">
        <body align = "center"><font face="calibri"> 
        <table border="1" cellspacing="1" cellpadding="1" align = "center">
            <thead>
                <tr>
                    <th colspan="8">Areas</th>
                </tr>
                <tr>
                    <th>N°</th>
                    <th>Nombre</th>
                    <th>Estado</th>
                    <th colspan="2">Acción</th>
                </tr>
            </thead>
            <tbody align = "center">
        <%
                if (s_accion!=null) {
                    if (s_accion.equals("E")) {
                        consulta =  "   delete from area "
                                    + " where "
                                    + " idarea = " + s_idarea + "; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                            
                    }else if (s_accion.equals("C")) {
                        s_nombre = request.getParameter("f_nombre");
                        s_estado = request.getParameter("f_estado");
                        consulta =  "   insert into "
                                    + " area(nombre, estado) "
                                    + " values ('"+ s_nombre +"','"+ s_estado +"')";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }else if (s_accion.equals("M2")) {
                        s_nombre = request.getParameter("f_nombre");
                        s_estado = request.getParameter("f_estado");
                        consulta = " update  area  "
                                + "  set  "
                                + "  nombre = '"+ s_nombre +"',"
                                + "  estado = '"+ s_estado +"' "
                                + "  where "
                                + "  idarea = "+ s_idarea +"; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }
                }
                consulta= " Select idarea, nombre, estado "
                        + " from area ";
                //out.print(consulta);
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                int num = 0;
                String ide;
                while (rs.next()) {  
                    ide = rs.getString(1);
                    
                    consulta1 = " select idarea  "
                                + " from sugerencias "
                                + " where"
                                + " idarea = " + ide + "; ";
                    pst1 = cn.prepareStatement(consulta1);
                    rs1 = pst1.executeQuery();
                    num++;

                    %>
                    <tr>
                        <td><%out.print(num);%></td>
                        <td><%out.print(rs.getString(2));%></td>
                        <td><%out.print(rs.getString(3));%></td>
                        
                        <%
                    if (rs1.next()) {
                    %>
                        <td><font color="red"><i class="fas fa-trash-alt"></i></font></td>                             
                    <%   }else{
                    %>
                        <td><a href="DatosArea.jsp?f_accion=E&f_idarea=<%out.print(ide);%>"><font color="white"><i class="fas fa-trash-alt"></i></font></a></td>
                    <%   }
                    %>    
                        <td><a href="DatosArea.jsp?f_accion=M1&f_idarea=<%out.print(ide);%>"><font color="white"><i class="fas fa-edit"></i></font></a></td>
                    </tr>                    
                    <%
                    }
            }catch(Exception e){
                out.print("Error SQL");
            }
        %>
        </tbody>
        </table>
    </font></body></div>
    </body>
</html>