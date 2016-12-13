<%-- 
    Document   : cadastro
    Created on : 13/12/2016, 02:40:13
    Author     : Desenvolvedor
--%>

<%@page import="java.sql.*"%>
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
    </head>
    <body onload="mostraResult()">
        <h1 align="center">Cadastro de Usuário</h1>
        <%!
            public class Usuarios {

                String URL = "jdbc:derby://localhost:1527/DB";
                String USERNAME = "app";
                String PASSWORD = "app";

                Connection con = null;
                PreparedStatement cadUser = null;
                ResultSet rs = null;

                public Usuarios() {
                    try {
                        con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                        cadUser = con.prepareStatement(
                                "INSERT INTO USUARIO(NOME, EMAIL, SENHA)"
                                + " VALUES (?,?,?)");
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                public int setUser(String nom, String em, String sen) {
                    int result = 0;

                    try {
                        cadUser.setString(1, nom);
                        cadUser.setString(2, em);
                        cadUser.setString(3, sen);
                        result = cadUser.executeUpdate();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return result;
                }
            }
        %>

        <%
            int result = 0;

            if (request.getParameter("cadastrar") != null) {
                String nome = new String();
                String email = new String();
                String senha = new String();

                if (request.getParameter("nome") != null) {
                    nome = request.getParameter("nome");
                }
                if (request.getParameter("email") != null) {
                    email = request.getParameter("email");
                }
                if (request.getParameter("senha") != null) {
                    senha = request.getParameter("senha");
                }

                Usuarios user = new Usuarios();
                result = user.setUser(nome, email, senha);
            }
        %>
        <form name="cadastroForm" method="POST" action="cadastro.jsp"> 
            <table border="1" align="center">
                <tbody>
                    <tr>
                        <td>Nome:</td>
                        <td><input type="text" name="nome" value="" size="100" /></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="email" value="" size="100" /></td>
                    </tr>
                    <tr>
                        <td>Senha</td>
                        <td><input type="password" name="senha" value="" size="100" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="hidden" name="hidden" value="<%= result%>" />
            <input type="submit" value="Cadastrar" name="cadastrar" />
            <input type="reset" value="Limpar" name="limpar" />

        </form>

        <%
            if (result != 0) {%>
        <h1>Cadastro bem sucedido!</h1>
        <h1 align="center">Bem Vindo, </h1>
        <form name="verificacaoform" action="painel.jsp" method="POST">
            <table border="0" align="center">                
                <tbody>
                    <tr>
                        <td><input type="submit" value="Continuar" name="continuar" align="center"/></td>
                    </tr>
                </tbody>
            </table> 
        </form>
        <%
            }
        %>


    </body>
</html>
