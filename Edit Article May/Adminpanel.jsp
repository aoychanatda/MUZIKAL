ช;N
<%-- 
    Document   : Adminpanel
    Created on : Apr 16, 2017, 1:45:45 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">


        <title>Admin</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/sb-admin.css" rel="stylesheet">
        <link href="css/plugins/morris.css" rel="stylesheet">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>

        <div id="wrapper2">
            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <!--NAV BAR -->
                <body class="colorful3">
                    <% String Login_ID = (String) session.getAttribute("Login_ID");%>
                    <%= session.getAttribute("Login_ID")%><br>

                    <!-- Navigation bar-->
                    <nav class="navbar navbar-custom navbar-fixed-top">
                        <div class="container-fluid">
                            <div class="navbar-brand" style="width:10%;">
                                <a class="navbar-header" href="indexAd.html">
                                    <img src="img/muzikal1logo-invert.png" style="width:130%; height:130%;">
                                </a>
                            </div>
                            <ul class="nav navbar-nav navbar-right" style="padding-right:10px;">
                                <form action="" class="navbar-nav search-form" style="margin:10px;">
                                    <div class="navbar-nav form-group has-feedback">
                                        <input type="text" autocomplete="off"class="form-control" name="search" id="search" placeholder="Search your concert...">
                                        <span style="color:white" class="glyphicon glyphicon-search form-control-feedback"></span>
                                    </div>
                                </form>
                                <!--Start Button dropdown after sign in -->
                                <div class="btn-group navbar-nav navbar-btn">

                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color:black; color:white;">
                                        <img src="img/test2.jpg" class="navbar-nav" style="width:35px; height:35px; border-radius:24px; margin-right:5px">
                                        Oliveoil <span class="caret"></span>
                                    </button>

                                    <ul class="dropdown-menu" style="background-color:black; color:white; border-radius:10px;">
                                        <li><a href="ProfileAdmin.jsp" style="color:white;">My Profile</a></li>
                                        <li><a href="Adminpanel.jsp" style="color:white;">My Artical</a></li>
                                        <li><a href="index.jsp" style="color:white;">Sign out</a></li>
                                    </ul>
                                </div>
                            </ul>
                        </div>
                    </nav><br>
                    <sql:setDataSource var="it58070053_webp" driver="com.mysql.jdbc.Driver" 
                                       url="jdbc:mysql://ihost.it.kmitl.ac.th:3306/it58070053_webp" 
                                       user="it58070053_webp" password="utKavVnZ79"/>

                    <sql:query var="user" dataSource="${it58070053_webp}">
                        select Article.Article_ID , User.User_ID, Article.Date_Time , Article.Article_Name , Article.Content , Article.Map from User JOIN Article Using (User_ID) Where User_ID = ?;
                        <sql:param value="${Login_ID}"/>
                        <%--<sql:param value="${Article_ID}"/>--%>
                    </sql:query>

                    <!--LEFT MENU-->
                    <div class="collapse navbar-collapse navbar-ex1-collapse">
                        <ul class="nav navbar-nav side-nav"><br>

                            <!--Menu-->
                            <li class="active">
                                <a class="btn btn-primary btn-xl" href="summernote.html" >+ Create Artical</a>
                            <li><a href="Adminpanel.jsp"><i class="fa fa-fw fa-book"></i> All Artical</a></li>
                            <li><a href="allre.html"><i class="fa fa-fw fa-envelope"></i> Concert Request</a></li>

                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
            </nav>

            <div id="page-wrapper">

                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">
                                All Artical
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-book"></i>  <a href="Adminpanel.jsp">All Artical</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->

                    <!--tab-->

                    <div class=".col-md-3 .col-md-offset-3 text-right"><a class="btn btn-info" href="summernote.html">+ Create Artical</a></div>


                    <table id="allre1-dt" class="table table-striped" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th>Writer</th>
                                <th>Date</th>
                                <th></th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="row" items="${user.rows}">

                            <form action="EditFormServlet" method="POST">
                                <%--<% String Article_ID = (String) session.getAttribute("Article_ID");%>
                                <%= session.getAttribute("Article_ID")%><br>--%>
                                <tr>
                                    <td><a href="data-concert.html">${row.Article_Name}</a></td>
                                    <td>${row.User_ID}</td>
                                    <td>${row.Date_Time}</td>
                                    <td><a class="btn btn-default" href="EditForm.jsp?id=${row.Article_ID}" name="Edit" value="editform" >Edit</a>
                                        <a class="btn btn-success" href="Artical.html" >View Artical</a></td>


                                </tr>

                            </form>

                        </c:forEach>
                        </tbody>
                    </table>

                </div>


                </script>

                </body>
                </html>
