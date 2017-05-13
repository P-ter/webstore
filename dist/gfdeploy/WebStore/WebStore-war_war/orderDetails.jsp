<%-- 
    Document   : orderDetails
    Created on : Nov 29, 2016, 10:27:55 PM
    Author     : FPT
--%>
<%@page import="java.util.Date"%>
<%
    String username = (String) session.getAttribute("username");
    String orderId = request.getParameter("orderId");
    if(username == null || orderId == null){
        response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Details</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
            
        </script><meta name="viewport" content="width=device-width, initial-scale=1">
        
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">APP WebStore</a>
                </div>
                <div class="collapse navbar-collapse" id="navbar">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">Home</a></li>
                        <li class="active"><a href="checkout.jsp">Check Out</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li role="presentation" class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                <span class="glyphicon glyphicon-user"></span><%=username%><span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="UserOps?logout=true">Logout</a></li>
                            </ul>
                        </li>
                    
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="well">
                <h1>Thank you,<%= username%> , for using our service</h1>
            </div>
            <h2>Order Details</h2>
            <strong>Your order has been successfully processed, please print a copy of this page for your records.</strong>
            <br/>
            Welcome, <%= username %> <br/>
            Date/time of order completion: <%= new Date() %>

            <jsp:useBean id="printer" class="net.helper.CheckOutPageHelper"></jsp:useBean>
            <%= printer.printOrderDetail(Integer.parseInt(orderId)) %>
            <a href="main.jsp">Back to WebStore</a>
        </div>
    </body>
</html>
