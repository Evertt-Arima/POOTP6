
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mensagem</title>
    </head>
    <body>
        <%  String nome1 = request.getParameter("nome1");
            String email1 = request.getParameter("email1");
            String senha1= request.getParameter("senha1");
        %>
        <%!

            public static void main(String[] args) {

                String sql = null;
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;

                sql = "insert into APP.USUARIO('NOME', 'EMAIL', 'SENHA') VALUES ('" + nome1 + "','" + email1 + "','" + senha1 + ")";

                try {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    con = DriverManager.getConnection("jdbc:derby://localhost:1527/DB", "app", "app");
                    stmt = con.createStatement();
                    rs = stmt.executeQuery(sql);                    
                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                } finally {
                    try {
                        rs.close();
                    } catch (Exception ex) {
                    }
                    try {
                        stmt.close();
                    } catch (Exception ex) {
                    }
                    try {
                        con.close();
                    } catch (Exception ex) {
                    }
                }
        %>



    </body>
</html>
