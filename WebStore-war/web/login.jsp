<%-- 
    Document   : login
    Created on : Nov 27, 2016, 12:50:54 AM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String message= request.getParameter("message"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    
        <title>Login</title>
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
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> Register</a></li>
                        <li class="active"><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div clas="row">
                <div class="col-sm-4 col-xs-0"></div>
                <div class="col-lg-4 col-sm-4 well">
                <form class="form-signin" action="UserOps" method="POST">
                    <h1 style="text-align: center" class="form-signin-heading">Login</h1>
                    <%=(message == null? "": "<div class='alert alert-danger'>" +message +"</div>")%>
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <input class="form-control" id="username" type="text" name="username" autofocus>
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input class="form-control" id="password" type="password" name="password"> <br/>
                    </div>
                    <input class="btn btn-primary form-control" type="submit" name="login" value="Login">
                    <input class="btn btn-default form-control" type="button" onclick="location.href='index.jsp';" value="Back" />
                </form>
                </div>
            </div>
        </div>
    </body>
</html>
