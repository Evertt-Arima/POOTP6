

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <h1>Home</h1>

        <%
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            String cmd1 = request.getParameter("registrar");
            int cmd = 0;

            if (cmd1.equals("Logar")) {
                cmd = 2;
            } else if (cmd1.equals("Registrar")) {
                cmd = 1;
            }
            if (cmd == 1) {
        %> 

        <HR />

        <h2>Registro de Usuário</h2>
        <form name="cadastro" action="resultado.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Nome:</td>
                        <td><input type="text" name="nome1" value="" size="100" /></td>
                    </tr>
                    <tr>
                        <td>E-mail:</td>
                        <td><input type="text" name="email1" value="" size="100" /></td>
                    </tr>
                    <tr>
                        <td>Senha:</td>
                        <td><input type="password" name="senha1" value="" size="100" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Cadastrar" name="cadastrar" /></td>
                        <td><input type="reset" value="Limpar" name="limpar" /></td>
                    </tr>
                </tbody>
            </table> 
        </form>

        <%

        } else if (cmd == 2) {

        %>

        <h1></h1>

        <%}%>


    </body>
</html>
