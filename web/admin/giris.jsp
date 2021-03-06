<%-- 
    Document   : login
    Created on : Jul 2, 2015, 11:39:33 AM
    Author     : Java1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <jsp:useBean id="yetenek" class="admin.AdminBean" scope="request">

        <jsp:setProperty name="yetenek" property="*"/>
        <jsp:setProperty name="yetenek" property="remember"/> 
        <jsp:getProperty name="yetenek" property="email"/>
        <jsp:getProperty name="yetenek" property="sifre"/>

    </jsp:useBean>

    <%
        yetenek.login();
        session.setAttribute("adminId", yetenek.encode(yetenek.getAdminId()));
        out.print(yetenek.getRemember());
        if (yetenek.getRemember() != null) {
            Cookie cerez = new Cookie("adminId", yetenek.encode(yetenek.getAdminId()));
            cerez.setMaxAge(60 * 60 * 24);
            response.addCookie(cerez);
        }
        response.sendRedirect(yetenek.getGitURL());
    %>

</html>
