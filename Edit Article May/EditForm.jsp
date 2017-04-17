.<%-- 
   Document   : EditForm
   Created on : Apr 16, 2017, 12:40:27 PM
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


        <title>Edit Artical</title>
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
        <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>


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
                    <%= session.getAttribute("Login_ID")%>
                    <% String Article_ID = (String) session.getAttribute("Article_ID");%>
                    <%= session.getAttribute("Article_ID")%><br>

                    <!-- Navigation bar-->
                    <nav class="navbar navbar-custom navbar-fixed-top">
                        <div class="container-fluid">
                            <div class="navbar-brand" style="width:10%;">
                                <a class="navbar-header" href="indexOrg.html">
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
                        select User.User_ID , Article.Date_Time , Article.Article_ID , Article.Article_Name , Article.Content , Article.Map from User JOIN Article Using (User_ID) Where Article_ID = ?
                        <sql:param value="${param.id}"/>
                    </sql:query>

                    <!--LEFT MENU-->
                    <div class="collapse navbar-collapse navbar-ex1-collapse">
                        <ul class="nav navbar-nav side-nav"><br>

                            <!--Menu-->
                            <li class="active">
                            <li><a href="Adminpanel.jsp"><i class="fa fa-fw fa-book"></i> All Article</a></li>
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
                                <i class="fa fa-edit"></i> Edit Article  <a class="btn btn-primary btn-xl" href="summernote.html" >+ Add Artical</a>
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-book"></i>  <a href="Adminpanel.jsp">All Article</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-edit"></i> Edit Article
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->

                        <form action="EditFormServlet" method="POST" name="EditFormServlet" id="ddddd">
                    <c:forEach var="row" items="${user.rows}">
                            
                            <!--<input type="hidden" name="Article_ID" value="${param.id}">-->
                            <input class="form-control input-lg" type="text" name="Article_Name" value="${row.Article_Name}"><br>
                            <input type="hidden" name="Map" value="${row.Map}">
                            <h4><b>Write a content</b></h4>

                            <div id="summernote">${row.Content}
                            
                            </div>
                                <textarea name="summerNoteText" style="display:none;"></textarea>

                                <!-- Button Save & View -->
                                <div class=".col-md-3 .col-md-offset-3 text-right">
                                    <input type="submit" class="btn btn-info" id="submit" name="btn" value="Save"></input>
                                    <button class="btn btn-success" name="btn" value="view">View Article</button></div>
                               
                    </c:forEach>
                    <script>
                        $(document).ready(function () {
                            $('#summernote').summernote({
                            height: 300, // set editor height
                            minHeight: null, // set minimum height of editor
                            maxHeight: null, // set maximum height of editor
                            focus: true                  // set focus to editable area after initializing summernote
                            });
                            $('#myForm').submit(function () {
                                $('textarea[name=summerNoteText]').val($('#summernote').summernote('code'));
                            });
                        });
                    </script>
                    
                        </form>
                    </body>
                    </html>