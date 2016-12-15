<%--
    Document   : home1
    Created on : 13/12/2016, 01:27:33
    Author     : Desenvolvedor
--%>

<%@page import="java.sql.*"%>
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="WEB-INF/jspf/header.jspf" %>
        <h1 align="center">Verficando DB</h1>
        <%!
            public class Usuarios {

                String URL = "jdbc:derby://localhost:1527/DB";
                String USERNAME = "app";
                String PASSWORD = "app";

                Connection con = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                public Usuarios() {
                    try {
                        con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                        stmt = con.prepareStatement("SELECT * FROM APP.USUARIO");
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                public ResultSet getUsuario() {
                    try {
                        rs = stmt.executeQuery();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } 
                    return rs;
                }
            }
        %>

        <%
            Usuarios user = new Usuarios();
            ResultSet users = user.getUsuario();

            int count = 0;
            while (users.next()) {

                if (users.getString("EMAIL").equals(request.getParameter("email")) && users.getString("SENHA").equals(request.getParameter("senha"))) {
        %>
        <h1 align="center">Bem Vindo, <%= users.getString("NOME")%></h1>
        <form class="form" name="verificacaoform" action="painel.jsp" method="POST">
            <table border="0" align="center">                
                <tbody>
                    <tr>
                        <td><input class="btn btn-success" type="submit" value="Continuar" name="continuar" align="center"/></td>
                    </tr>
                </tbody>
            </table> 
        </form>
        <% count++;
                }
            }
            if (count == 0) {%>
        <h1 align="center" >Email ou Senha Inválida!</h1>
        <h3 align="center">Volte e tente novamente.</h3>

        <%
            }
        %>
        <form name="verificacaoform2" action="index.jsp" method="POST">
            <input class="btn btn-info" type="submit" value="Voltar" name="voltar" align="center" />
        </form>
        <form name="verificacaoform2" action="cadastro.jsp" method="POST">
            <table border="0" align="center">                
                <tbody>
                    <tr>
                        <td><input class="btn btn-info" type="submit" value="Registrar" name="registrar2" /></td>
                    </tr>
                </tbody>
            </table>            
        </form>

        <%
        %>
<%@include file="WEB-INF/jspf/footer.jspf" %>