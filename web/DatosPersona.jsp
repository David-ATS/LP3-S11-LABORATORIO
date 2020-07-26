<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Persona</title>
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
            String s_idpersona;
            String s_nombre;
            String s_dni;
            String s_fecha_nac;
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
                s_idpersona = request.getParameter("f_idpersona");
                
                if(s_accion!=null && s_accion.equals("M1")){
                    consulta = "    select nombre, dni, fecha_nac, estado  "
                                + " from persona "
                                + " where"
                                + " idpersona = " + s_idpersona + "; ";
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
        %>
    <!---------------------------- EDITAR ---------------------------->
    <div id="cuadro2" align="center"><font face="calibri"> 
        <form name="EditarPersonaForm" action="DatosPersona.jsp" method="GET">
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Editar Persona</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" name="f_nombre" value="<% out.print(rs.getString(1)); %>" maxlength="30" size="20" /></td>
                    </tr>
                    <tr>
                        <td>DNI: </td>
                        <td><input type="text" name="f_dni" value="<% out.print(rs.getString(2)); %>" maxlength="8" size="8" /></td>
                    </tr>
                    <tr>
                        <td>Fecha_nac: </td>
                        <td><input type="text" name="f_fecha_nac" value="<% out.print(rs.getString(3)); %>" maxlength="8" size="8"/></td>
                    </tr>
                    <tr>
                        <td>Estado</td>
                        <td><input type="text" name="f_estado" value="<% out.print(rs.getString(4)); %>" maxlength="1" size="1"/></td>
                    </tr>
                    
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Editar" name="f_editar" />
                            <input type="hidden" name="f_accion" value="M2" />
                            <input type="hidden" name="f_idpersona" value="<% out.print(s_idpersona); %>" />
                        </td>
                    </tr>
            </table>

        </form>
                        <form action="DatosPersona.jsp">
                            <input type="submit" value="Cancelar" />  
                        </form>        
    </font></div>
        <%
                }
            }else{
        %>
    <!---------------------------- AGREGAR ---------------------------->
    <div id="cuadro2" align="center"><font face="calibri"> 
        <form name="AgregarPersonaForm" action="DatosPersona.jsp" method="GET">
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Persona</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" name="f_nombre" value="" maxlength="30" size="20" /></td>
                    </tr>
                    <tr>
                        <td>DNI: </td>
                        <td><input type="text" name="f_dni" value="" maxlength="8" size="8" /></td>
                    </tr>
                    <tr>
                        <td>Fecha_nac: </td>
                        <td><input type="text" name="f_fecha_nac" value="" maxlength="8" size="8"/></td>
                    </tr>
                    <tr>
                        <td>Estado</td>
                        <td><input type="text" name="f_estado" value="" maxlength="1" size="1"/></td>
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
                    <th colspan="8">Datos Persona</th>
                </tr>
                <tr>
                    <th>N°</th>
                    <th>Nombre</th>
                    <th>DNI</th>
                    <th>Fecha_nac</th>
                    <th>Estado</th>
                    <th colspan="2">Acción</th>
                </tr>
            </thead>
            <tbody align = "center">
        <%
                if (s_accion!=null) {
                    if (s_accion.equals("E")) {
                        consulta =  "   delete from persona "
                                    + " where "
                                    + " idpersona = " + s_idpersona + "; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                            
                    }else if (s_accion.equals("C")) {
                        s_nombre = request.getParameter("f_nombre");
                        s_dni = request.getParameter("f_dni");
                        s_fecha_nac = request.getParameter("f_fecha_nac");
                        s_estado = request.getParameter("f_estado");
                        consulta =  "   insert into "
                                    + " persona(nombre, dni, fecha_nac, estado) "
                                    + " values ('"+ s_nombre +"','"+ s_dni +"','"+ s_fecha_nac +"','"+ s_estado +"')";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }else if (s_accion.equals("M2")) {
                        s_nombre = request.getParameter("f_nombre");
                       
                        s_dni = request.getParameter("f_dni");
                        s_fecha_nac = request.getParameter("f_fecha_nac");
                        s_estado = request.getParameter("f_estado");
                        consulta = " update  persona  "
                                + "  set  "
                                + "  nombre = '"+ s_nombre +"',"
                                + "  dni = '"+ s_dni +"', "
                                + "  fecha_nac = '"+ s_fecha_nac +"', "
                                + "  estado = '"+ s_estado +"' "
                                + "  where "
                                + "  idpersona = "+ s_idpersona +"; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }
                }
                consulta= " Select idpersona, nombre, dni, fecha_nac, estado "
                        + " from persona ";
                //out.print(consulta);
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                int num = 0;
                String ide;
                while (rs.next()) {  
                    
                    ide = rs.getString(1);
                    consulta1 = " select idpersona  "
                                + " from sugerencias "
                                + " where"
                                + " idpersona = " + ide + "; ";
                    pst1 = cn.prepareStatement(consulta1);
                    rs1 = pst1.executeQuery();
                    num++;
 
                    %>
                    <tr>
                        
                        <td><%out.print(num);%></td>
                        <td><%out.print(rs.getString(2));%></td>
                        <td><%out.print(rs.getString(3));%></td>
                        <td><%out.print(rs.getString(4));%></td>
                        <td><%out.print(rs.getString(5));%></td>
                        
                    <%
                    if (rs1.next()) {
                    %>
                        <td><font color="red"><i class="fas fa-trash-alt"></i></font></td>                             
                    <%   }else{
                    %>
                        <td><a href="DatosPersona.jsp?f_accion=E&f_idpersona=<%out.print(ide);%>"><font color="white"><i class="fas fa-trash-alt"></i></font></a></td>
                    <%   }
                    %>    
                        <td><a href="DatosPersona.jsp?f_accion=M1&f_idpersona=<%out.print(ide);%>"><font color="white"><i class="fas fa-edit"></i></font></a></td>
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