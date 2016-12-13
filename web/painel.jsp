
<%@page import="java.sql.*"%>
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz</title>
    </head>
    <body>
        <h1 ALIGN="CENTER">Quiz Final</h1>
        <%!
            public class Quiz {

                String URL = "jdbc:derby://localhost:1527/DB";
                String USERNAME = "app";
                String PASSWORD = "app";

                Connection con = null;
                PreparedStatement stmt2 = null;
                ResultSet rs2 = null;

                public Quiz() {
                    try {
                        con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                        stmt2 = con.prepareStatement("SELECT * FROM APP.QUIZ");
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                public ResultSet getPergunta() {
                    try {
                        rs2 = stmt2.executeQuery();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return rs2;
                }
            }
        %>

        <%
            int acertos = 0;
            Quiz resposta = new Quiz();
            ResultSet respostas = resposta.getPergunta();
            int questao = 1;
            if (request.getParameter("responder") == null) {

                while (respostas.next()) {%>
        <form name="quiz" action="painel.jsp" method="GET">
            <table border="0" ALIGN="CENTER">
                <tbody>
                    <tr>
                        <td><strong><%= questao%>. <%= respostas.getString("PERG")%></strong></td>
                    </tr>
                    <tr ALIGN="CENTER">
                        <td>
                            <input type="radio" name="respo<%= questao%>" value="<%= respostas.getString("ALT1")%>" /><%= respostas.getString("ALT1")%>
                            <input type="radio" name="respo<%= questao%>" value="<%= respostas.getString("ALT2")%>" /><%= respostas.getString("ALT2")%>
                            <input type="radio" name="respo<%= questao%>" value="<%= respostas.getString("ALT3")%>" /><%= respostas.getString("ALT3")%>
                            <input type="radio" name="respo<%= questao%>" value="<%= respostas.getString("ALT4")%>" /><%= respostas.getString("ALT4")%>
                            <input type="radio" name="respo<%= questao%>" value="<%= respostas.getString("ALT5")%>" /><%= respostas.getString("ALT5")%>
                        </td>
                    </tr>

                    <%
                            questao++;
                        }
                    %>

                    <tr align="center">
                        <td><input type="submit" value="Enviar Respostas" name="responder" /></td>
                    </tr>
                </tbody>
            </table> 
        </form>
        <% } else {
            String r1 = request.getParameter("respo1");
            String r2 = request.getParameter("respo2");
            String r3 = request.getParameter("respo3");
            String r4 = request.getParameter("respo4");
            String r5 = request.getParameter("respo5");
            String r6 = request.getParameter("respo6");
            String r7 = request.getParameter("respo7");
            String r8 = request.getParameter("respo8");
            String r9 = request.getParameter("respo9");
            String r10 = request.getParameter("respo10");

            int i = 1;
            while (respostas.next()) {%>


        <h1 align="center"><%= 'r' + i%> / <%= respostas.getString("RESP")%></h1>

        <%i++;
            }
        %>
        <h1 align="center">Você acertou <%= acertos%> / 10</h1>
        <%
            }
        %>
    </body>
</html>
