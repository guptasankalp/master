<%-- 
    Document   : sci
    Created on : 24 Jun, 2016, 8:24:36 PM
    Author     : root
--%>

<%@page import="org.scilab.modules.javasci.Scilab"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.scilab.modules.javasci.Scilab.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>trial</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        Scilab sci=new Scilab();
        sci.open();
        sci.close();
        %>
        
        
    </body>
</html>
