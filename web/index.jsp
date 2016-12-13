
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1 align="center">Bem Vindo!!!</h1>
        <h2 align="center">Faça o Login para entrar!</h2>

        <form name="login" action="home1.jsp" method="POST">
            <table border="0" align="center">
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
                        <td colspan="2" align="center">
                            <a href="home1.jsp"><input type="submit" value="Logar" name="registrar" /></a>
                        </td>
                    </tr>
                </tbody>
            </table>  
        </form>
        <h2 align="center">ou Registre-se!</h2>
        <form name="registra" action="cadastro.jsp" method="POST">
            <table border="0" align="center">                
                <tbody>
                    <tr>
                        <td><input type="submit" value="Registrar" name="registrar1" /></td>
                    </tr>
                </tbody>
            </table>            
        </form>



    </body>
</html>
