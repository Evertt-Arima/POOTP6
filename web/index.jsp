<%@include file="WEB-INF/jspf/header.jspf" %>
        <h1 align="center">Bem Vindo!!!</h1>
        <h2 align="center">Faça o Login para entrar!</h2>

        <form class="form" name="login" action="home1.jsp" method="POST">
            <table border="0" align="center">
                <tbody>
                    <tr>
                        <td>Email:</td>
                        <td><input class="form-control" type="text" name="email" value="" maxlength="50" /></td>
                    </tr>
                    <tr>
                        <td>Senha:</td>
                        <td><input class="form-control" type="password" name="senha" value="" maxlength="50" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <a href="home1.jsp"><input class="btn btn-success" type="submit" value="Logar" name="registrar" /></a>
                        </td>
                    </tr>
                </tbody>
            </table>  
        </form>
        <h2 align="center">ou Registre-se!</h2>
        <form class="form" name="registra" action="cadastro.jsp" method="POST">
            <table border="0" align="center">                
                <tbody>
                    <tr>
                        <td><input class="btn btn-info" type="submit" value="Registrar" name="registrar1" style="width: 100%"/></td>
                    </tr>
                </tbody>
            </table>            
        </form>

<%@include file="WEB-INF/jspf/footer.jspf" %>
