

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Bem Vindo!!!</h1>
        <h2>Faça o Login para entrar ou Registre-se!</h2>

        <form name="login" action="home.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="email" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Senha:</td>
                        <td><input type="password" name="senha" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Logar" name="registrar" /></td>
                        <td><input type="submit" value="Registrar" name="registrar" /></td>
                    </tr>
                </tbody>
            </table>

        </form>

    </body>
</html>
