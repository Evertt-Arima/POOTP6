
<%@page import="java.sql.*"%>
<% Class.forName("org.apache.derby.jdbc.ClientDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/header.jspf" %>
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
                %>
        <form class="form" name="quiz" action="painel.jsp" method="GET">
            <% while (respostas.next()) { %>
            <div class="col-xs-12 questao" id="<%=questao%>">
                        <h2><%= questao%>. <%= respostas.getString("PERG")%></h2>
                            <input type="radio" name="respo<%= questao%>" value="<%= respostas.getString("ALT1")%>" /><%= respostas.getString("ALT1")%><br/>
                            <input type="radio" name="respo<%= questao%>" value="<%= respostas.getString("ALT2")%>" /><%= respostas.getString("ALT2")%><br/>
                            <input type="radio" name="respo<%= questao%>" value="<%= respostas.getString("ALT3")%>" /><%= respostas.getString("ALT3")%><br/>
                            <input type="radio" name="respo<%= questao%>" value="<%= respostas.getString("ALT4")%>" /><%= respostas.getString("ALT4")%><br/>
                            <input type="radio" name="respo<%= questao%>" value="<%= respostas.getString("ALT5")%>" /><%= respostas.getString("ALT5")%><br/>
                            <% if (questao < 10) { %>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <button class="btn btn-info proximo">Próxima pergunta</button>
                                    </div>
                                </div>
                            <% } else { %>
                            <div class="row">
                                    <div class="col-xs-12">
                                        <input class="btn btn-success" type="submit" value="Enviar Respostas" name="responder" />
                                </div>
                            </div>
                            <% } %>
            </div>
                    <%
                            questao++;
                        }
                    %>

                        
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
            <% if (request.getParameter("respo"+i).equals(respostas.getString("RESP"))) {
            acertos++;}
            i++;
            }
        %>
        <h1 align="center">Você acertou <%= acertos%> / 10</h1>
        <a href="home1.jsp" class="btn btn-success">Voltar</a>
        <%
            }
%>
<script>
    $(document).ready(function () {
        for (i = 2; i <= 10; i++) {
            $('#' + i).addClass('hidden');
        }

        $('.proximo').click(function () {
            id = $(this).closest('div.questao').attr('id');
            proximoid = parseInt(id) + 1;
            inputname = parseInt(id) - 1;
            if ($('[name="respo' + id + '"]').is(':checked')) {
                if (id < 10) {
                    $('#' + id).addClass('hidden');
                    $('#' + proximoid).removeClass('hidden');
                }
            } else {
                $(this).addClass('animated');
                $(this).addClass('shake');
            }
            return false;
        });
    });
</script>
<%@include file="WEB-INF/jspf/footer.jspf" %>
