<%-- 
    Document   : DatosRol
    Created on : 26/07/2020, 12:18:33 AM
    Author     : WIN10
--%>
<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Rol</title>
        <link rel="stylesheet" href="CSS/estilo2.css" type="text/css"/>
        <script src="https://kit.fontawesome.com/f04f120a82.js" crossorigin="anonymous"></script>
        <%!
            String consulta;
            String consulta1;
            Connection cn;
            PreparedStatement pst;
            PreparedStatement pst1;
            ResultSet rs;
            ResultSet rs1;
            String s_accion;
            String s_idrol;
            String s_nombre;
            String s_estado;
        %>
    </head>
    
      <!-- TABLA DEL MENÚ SUPERIOR -->
      <div id="cuadro2" align="center">
        <table width="500" border="3" align="center" cellspacing="0" bgcolor="#D0D0D0">
            <thead>
                <tr>
                    <th colspan="4"><font face ="fantasy" size="4" color="black">MENÚ PRINCIPAL</font></th>
                </tr>
            </thead>
            <tbody id="subtitulo1" align="center" >
                <tr>
                    <td><font size="3"><a href="DatosPersona.jsp">Datos Persona</a></font></td>
                    <td><font size="3"><a href="DatosArea.jsp">Datos Area</a></font></td>
                    <td><font size="3"><a href="DatosRol.jsp">Datos Rol</a></font></td>
                </tr>
                </tbody>
        </table>
    </div>
    

    <body align = "center">
        <%
            try{
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                
                s_accion = request.getParameter("f_accion");
                s_idrol = request.getParameter("f_idrol");
                
                if(s_accion!=null && s_accion.equals("M1")){
                    consulta = "select nombre,estado"
                                + " from rol"
                                + " where"
                                + " idrol= " + s_idrol + "; ";
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
        %>
    <!---------------------------- EDITAR ---------------------------->
    <div id="cuadro2" align="center"><font face="calibri"> 
        <form name="EditarRolForm" action="DatosRol.jsp" method="GET">
           
            <table border="0" align="center">
                
                <thead>
                    <tr>
                        <th colspan="2">Editar Rol</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Rol: </td>
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
                            <input type="hidden" name="f_idrol" value="<% out.print(s_idrol); %>" />
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
                        <form name="Cancelar" action="DatosRol.jsp">
                            <input type="submit" value="Cancelar" /> 
                        </form>         
    </font></div>
        <%
                }
            }else{
        %>
    <!---------------------------- AGREGAR ---------------------------->
    <div id="cuadro2" align="center"><font face="calibri"> 
        <form name="AgregarRolForm" action="DatosRol.jsp" method="GET">
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Roles</th>
                        
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
                    <th colspan="8">Datos Rol</th>
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
                        consulta =  "   delete from rol "
                                    + " where "
                                    + " idrol = " + s_idrol + "; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                            
                    }else if (s_accion.equals("C")) {
                        s_nombre = request.getParameter("f_nombre");
                        s_estado = request.getParameter("f_estado");
                        consulta =  "   insert into "
                                    + " rol(nombre, estado) "
                                    + " values ('"+ s_nombre +"','"+ s_estado +"')";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }else if (s_accion.equals("M2")) {
                        s_nombre = request.getParameter("f_nombre");
                        s_estado = request.getParameter("f_estado");
                        consulta = " update rol  "
                                + "  set  "
                                + "  nombre = '"+ s_nombre +"',"
                                + "  estado = '"+ s_estado +"' "
                                + "  where "
                                + "  idrol = "+ s_idrol +"; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }
                }
                consulta= " Select idrol, nombre, estado "
                        + " from rol ";
                //out.print(consulta);
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                int num = 0;
                String ide;
                while (rs.next()) {  
                    ide = rs.getString(1);
                    consulta1 = " select idrol  "
                                + " from sugerencias "
                                + " where"
                                + " idrol = " + ide + "; ";
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
                        <td><a href="DatosRol.jsp?f_accion=E&f_idrol=<%out.print(ide);%>"><font color="white"><i class="fas fa-trash-alt"></i></font></a></td>
                    <%   }
                    %>    
                        <td><a href="DatosRol.jsp?f_accion=M1&f_idrol=<%out.print(ide);%>"><font color="white"><i class="fas fa-edit"></i></font></a></td>
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

