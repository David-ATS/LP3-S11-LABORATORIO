<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Sugerencia</title>
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
            String consulta5;
            String consulta6;
            String consulta;
            Connection cn;
            PreparedStatement pst5;
            PreparedStatement pst3;
            PreparedStatement pst2;
            PreparedStatement pst1;
            PreparedStatement pst;
            ResultSet rs;
            ResultSet rs5;
            ResultSet rs3;
            ResultSet rs2;
            ResultSet rs1;
            String s_idsugerencia;
            String s_mensaje;
            String s_idpersona;
            String s_idarea;
            String s_idrol;
            String s_estado;
            String s_accion;
            String s_persona;
            String s_rol;
            String s_area;
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
                s_idsugerencia = request.getParameter("f_idsugerencia");
                
                if(s_accion!=null && s_accion.equals("M1")){
                    consulta = "select  mensaje,idpersona,idarea,idrol,estado"
                                + " from sugerencias"
                                + " where"
                                + " idsugerencia= " + s_idsugerencia + "; ";
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
        %>
    <!---------------------------- EDITAR ---------------------------->
    <div id="cuadro2" align="center"><font face="calibri"> 
        <form name="EditarSugerenciaForm" action="DatosSugerencia.jsp" method="GET">
           
            <table border="0" align="center">
                
                <thead>
                    <tr>
                        <th colspan="2">Editar Sugerencia</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Mensaje: </td>
                        <td><input type="text" name="f_mensaje_e" value="<% out.print(rs.getString(1)); %>" maxlength="30" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Persona: </td>
                        <td>
                        <select name="f_persona_e" >
                            <%
                                try {
                                    //ConectaBd bd = new ConectaBd();
                                    cn = bd.getConnection();
                                    consulta5 = "select nombre from persona";
                                    pst5 = cn.prepareStatement(consulta5);
                                    rs5 =pst5.executeQuery();
                                        while (rs5.next()) {   
                                        %>     
                                        <option><%out.println(rs5.getString(1));%></option>
                                        <%
                                        }
                                    } catch (Exception e) {
                                    out.println("Error sql...");
                                    }
                            %>    
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Área: </td>
                        <td>
                        <select name="f_area_e" >
                            <%
                                try {
                                    //ConectaBd bd = new ConectaBd();
                                    cn = bd.getConnection();
                                    consulta5 = "select nombre from area";
                                    pst5 = cn.prepareStatement(consulta5);
                                    rs5 =pst5.executeQuery();
                                        while (rs5.next()) {   
                                        %>     
                                        <option><%out.println(rs5.getString(1));%></option>
                                        <%
                                        }
                                    } catch (Exception e) {
                                    out.println("Error sql...");
                                    }
                            %>    
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Rol: </td>
                        <td>
                        <select name="f_rol_e" >
                            <%
                                try {
                                    //ConectaBd bd = new ConectaBd();
                                    cn = bd.getConnection();
                                    consulta5 = "select nombre from rol";
                                    pst5 = cn.prepareStatement(consulta5);
                                    rs5 =pst5.executeQuery();
                                        while (rs5.next()) {   
                                        %>     
                                        <option><%out.println(rs5.getString(1));%></option>
                                        <%
                                        }
                                    } catch (Exception e) {
                                    out.println("Error sql...");
                                    }
                            %>    
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado_e" value="<% out.print(rs.getString(5)); %>" maxlength="1" size="2"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Editar" name="f_editar"/>
                            
                            <input type="hidden" name="f_accion" value="M2"/>
                            <input type="hidden" name="f_idsugerencia" value="<% out.print(s_idsugerencia); %>"/>
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
                        <form action="DatosSugerencia.jsp">
                            <input type="submit" value="Cancelar" name="f_cancelar"/>
                        </form>               
    </font></div>
        <%
                }
            }else{
        %>
    <!---------------------------- AGREGAR ---------------------------->
    <div id="cuadro2" align="center"><font face="calibri"> 
        <form name="AgregarSugerenciaForm" action="DatosSugerencia.jsp" method="GET">
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Sugerencia</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Mensaje: </td>
                        <td><input type="text" name="f_mensaje_a" value="" maxlength="50" size="50" /></td>
                    </tr>
                        <tr>
                            <td>Persona: </td>
                            <td>
                        <select name="f_persona_a" >
                            <%
                                try {
                                    //ConectaBd bd = new ConectaBd();
                                    cn = bd.getConnection();
                                    consulta5 = "select nombre from persona";
                                    pst5 = cn.prepareStatement(consulta5);
                                    rs5 =pst5.executeQuery();
                                        while (rs5.next()) {   

                                        %>     
                                        <option><%out.println(rs5.getString(1));%></option>
                                        <%
                                        }
                                    } catch (Exception e) {
                                    out.println("Error sql...");
                                    }
                            %>    
                        </select>
                        </td>   
                        </tr>
                    
                        <tr>
                            <td>Area: </td>
                            <td>
                        <select name="f_area_a" >
                            <%
                                try {
                                    //ConectaBd bd = new ConectaBd();
                                    cn = bd.getConnection();
                                    consulta5 = "select nombre from area";
                                    pst5 = cn.prepareStatement(consulta5);
                                    rs5 =pst5.executeQuery();
                                        while (rs5.next()) {   
                                        %>     
                                        <option><%out.println(rs5.getString(1));%></option>
                                        <%
                                        }
                                    } catch (Exception e) {
                                    out.println("Error sql...");
                                    }
                            %>    
                        </select>
                        </td>   
                        </tr>
                        
                        <tr>
                            <td>Rol: </td>
                            <td>
                        <select name="f_rol_a" >
                            <%
                                try {
                                    //ConectaBd bd = new ConectaBd();
                                    cn = bd.getConnection();
                                    consulta5 = "select nombre from rol";
                                    pst5 = cn.prepareStatement(consulta5);
                                    rs5 =pst5.executeQuery();
                                        while (rs5.next()) {   
                                        %>     
                                        <option><%out.println(rs5.getString(1));%></option>
                                        <%
                                        }
                                    } catch (Exception e) {
                                    out.println("Error sql...");
                                    }
                            %>    
                        </select>
                        </td>   
                        </tr>

                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado_a" value="" maxlength="1" size="2"/></td>
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
                    <th colspan="8">Datos Sugerencia</th>
                </tr>
                <tr>
                    <th>N°</th>
                    <th>Mensaje</th>
                    <th>Persona</th>
                    <th>Área</th>
                    <th>Rol</th>
                    <th>Estado</th>
                    <th colspan="2">Acción</th>
                </tr>
            </thead>
         <tbody align = "center">
        <%
                if (s_accion!=null) {
                    if (s_accion.equals("E")) {
                        consulta =  " delete from sugerencias "
                                    + " where "
                                    + " idsugerencia = " + s_idsugerencia + "; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                            
                    }else if (s_accion.equals("C")) {
                        s_mensaje = request.getParameter("f_mensaje_a");
                        s_persona = request.getParameter("f_persona_a");
                        s_area = request.getParameter("f_area_a");
                        s_rol = request.getParameter("f_rol_a");
                        
                        pst5 = cn.prepareStatement("select idpersona from persona where nombre='"+s_persona+"';");
                        rs5 =pst5.executeQuery();
                                        while (rs5.next()) {   
                                            s_idpersona=rs5.getString(1);
                                        }
                        pst5 = cn.prepareStatement("select idarea from area where nombre='"+s_area+"';");
                        rs5 =pst5.executeQuery();
                                        while (rs5.next()) {   
                                            s_idarea=rs5.getString(1);
                                        }
                        pst5 = cn.prepareStatement("select idrol from rol where nombre='"+s_rol+"';");
                        rs5 =pst5.executeQuery();
                                        while (rs5.next()) {   
                                            s_idrol=rs5.getString(1);
                                        }
                       
                        s_estado = request.getParameter("f_estado_a");
                        
                        consulta = " insert into sugerencias(mensaje,idpersona,idarea,idrol,estado)"
                                + " values ('"+ s_mensaje +"','"+ s_idpersona +"','"+ s_idarea +"','"+ s_idrol +"','"+ s_estado +"')";
                        //out.println(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }else if (s_accion.equals("M2")) {
                        s_mensaje= request.getParameter("f_mensaje_e");
                        s_persona= request.getParameter("f_persona_e");
                        s_area= request.getParameter("f_area_e");
                        s_rol= request.getParameter("f_rol_e");
                        s_estado = request.getParameter("f_estado_e");
                        
                        pst5 = cn.prepareStatement("select idpersona from persona where nombre='"+s_persona+"';");
                        rs5 =pst5.executeQuery();
                                        while (rs5.next()) {   
                                            s_idpersona=rs5.getString(1);
                                        }
                        pst5 = cn.prepareStatement("select idarea from area where nombre='"+s_area+"';");
                        rs5 =pst5.executeQuery();
                                        while (rs5.next()) {   
                                            s_idarea=rs5.getString(1);
                                        }
                        pst5 = cn.prepareStatement("select idrol from rol where nombre='"+s_rol+"';");
                        rs5 =pst5.executeQuery();
                                        while (rs5.next()) {   
                                            s_idrol=rs5.getString(1);
                                        }
                       
                        s_estado = request.getParameter("f_estado_e");
                        consulta = " update sugerencias  "
                                + "  set  "
                                + "  mensaje = '"+ s_mensaje +"', "
                                + "  idpersona = '"+ s_idpersona +"', "
                                + "  idarea = '"+ s_idarea +"', "
                                + "  idrol = '"+ s_idrol +"', "
                                + "  estado = '"+ s_estado +"' "
                                + "  where "
                                + "  idsugerencia = '"+ s_idsugerencia +"'; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }
                }
                consulta= " Select idsugerencia, mensaje,idpersona, idarea, idrol, estado "
                        + " from sugerencias ";
                //out.print(consulta);
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                int num = 0;
                String ide;
            
                while (rs.next()) {  
                    ide = rs.getString(1);
                    num++;

                    %>
                    <tr>
                        <td><%out.print(num);%></td>
                        <td><%out.print(rs.getString(2));%></td>
                        <%
                        pst5 = cn.prepareStatement("select nombre from persona where idpersona='"+rs.getString(3)+"';");
                        rs5 =pst5.executeQuery();
                                        while (rs5.next()) {
                                            %>
                                            <td><%out.print(rs5.getString(1));%></td>
                                            <%
                                        }
                        %>
                        <%
                        pst5 = cn.prepareStatement("select nombre from area where idarea='"+rs.getString(4)+"';");
                        rs5 =pst5.executeQuery();
                                        while (rs5.next()) {
                                            %>
                                            <td><%out.print(rs5.getString(1));%></td>
                                            <%
                                        }
                        %>
                        <%
                        pst5 = cn.prepareStatement("select nombre from rol where idrol='"+rs.getString(5)+"';");
                        rs5 =pst5.executeQuery();
                                        while (rs5.next()) {
                                            %>
                                            <td><%out.print(rs5.getString(1));%></td>
                                            <%
                                        }
                        %>
                       
                        <td><%out.print(rs.getString(6));%></td>
                        <td><a href="DatosSugerencia.jsp?f_accion=E&f_idsugerencia=<%out.print(ide);%>"><font color="white"><i class="fas fa-trash-alt"></i></font></a></td>
                        <td><a href="DatosSugerencia.jsp?f_accion=M1&f_idsugerencia=<%out.print(ide);%>"><font color="white"><i class="fas fa-edit"></i></font></a></td>
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