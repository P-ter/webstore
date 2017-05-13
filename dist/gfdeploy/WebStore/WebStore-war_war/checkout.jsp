<%-- 
    Document   : checkout
    Created on : Nov 29, 2016, 12:04:35 AM
    Author     : FPT
--%>

<%@page import="com.stateful.CartSFSB"%>
<% 
    String username = (String)session.getAttribute("username");
    if(username == null){
        response.sendRedirect("index.jsp");
    }
    String message = request.getParameter("message");
    String error = request.getParameter("error");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check out</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    
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
                <h1>WebStore Checkout</h1>
                Welcome, <%= username %>
            </div>
            <div class="row">
                <div class="container">
                    <h3>Cart Contents</h3>
                </div>
            </div>
            <div class="row">
                <div class="container">
                <%=(message == null? "": "<div class='alert alert-success alert-dismissible'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +message +"</div>")%>
                <%=(error == null? "": "<div class='alert alert-danger alert-dismissible'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +error +"</div>")%>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-9 col-xs-12">
                    <jsp:useBean id="printer" class="net.helper.CheckOutPageHelper"></jsp:useBean>
                    <%= printer.printCheckout((CartSFSB)session.getAttribute("cart")) %>
                </div>
            </div>
        </div>
    </body>
</html>
