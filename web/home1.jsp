<%--
    Document   : home1
    Created on : 13/12/2016, 01:27:33
    Author     : Desenvolvedor
--%>

<%@page import="java.sql.*"%>
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verificando DB</title>
    </head>
    <body>
        <h1>Verficando DB</h1>
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
                        stmt = con.prepareStatement("SELECT EMAIL, SENHA FROM APP.USUARIO");
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
        %>

    </body>
</html>