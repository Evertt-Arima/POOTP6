<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<% Class.forName("org.apache.derby.jdbc.ClientDriver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <h1>Verificando dados</h1>

        <%
            String cmd = request.getParameter("registrar");
        
            if (cmd.equals("Logar")) {
        %> 

        <HR />

        <h2>Registro de Usuário</h2>
        <form name="cadastro" action="resultado.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Nome:</td>
                        <td><input type="text" name="name1" value="" size="100" /></td>
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
            
            
        } else if (cmd.equals("Registrar")) {
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

        %>

        <h1></h1>

        <%}%>


    </body>
</html>
