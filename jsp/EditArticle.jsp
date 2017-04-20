<%-- 
    Document   : CreatArticle
    Created on : Apr 17, 2017, 9:53:43 AM
    Author     : test
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">


        <title>Edit Article</title>

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
    <% String checkRoleS = (String)session.getAttribute("checkRoleS"); %>
    <sql:setDataSource var="it58070053_webp" driver="com.mysql.jdbc.Driver" 
                       url="jdbc:mysql://ihost.it.kmitl.ac.th:3306/it58070053_webp" 
                       user="it58070053_webp" password="utKavVnZ79"/>

    <sql:query var = "Concert" dataSource="${it58070053_webp}">
        select Concert_ID, Concert_Name from Concert Where Status = 'PUBLISHED';
    </sql:query>

    <div id="wrapper2">
        <!-- Navigation -->
        <nav class="navbar navbar-custom navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-brand" style="width:10%;">
                    <a class="navbar-header" href="index.jsp">
                        <img src="img/muzikal1logo-invert.png" style="width:130%; height:130%;">
                    </a>
                </div>
                <%= request.getAttribute("Login_ID")%>
                <ul class="nav navbar-nav navbar-right" style="padding-right:10px;">
                    <form action="" class="navbar-nav search-form" style="margin:10px;">
                        <div class="navbar-nav form-group has-feedback">
                            <input type="text" autocomplete="off"class="form-control" name="search" id="search" placeholder="Search your concert...">
                            <span style="color:white" class="glyphicon glyphicon-search form-control-feedback"></span>
                        </div>
                    </form>
                    <% if (checkRoleS.equals("MEM")) { %>
                    <!--Start Button dropdown after sign in -->
                    <div class="btn-group navbar-nav navbar-btn">

                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color:black; color:white;">
                            <img src="img/test2.jpg" class="navbar-nav" style="width:35px; height:35px; border-radius:24px; margin-right:5px">
                            Oliveoil <span class="caret"></span>
                        </button>

                        <ul class="dropdown-menu" style="background-color:black; color:white; border-radius:10px;">
                            <li><a href="ProfileMem.html" style="color:white;">My Profile</a></li>
                            <li><a href="ArticalMem.html" style="color:white;">My Article</a></li>
                            <li><a href="index.jsp" style="color:white;">Sign out</a></li>
                        </ul>
                    </div>
                    <% } else if (checkRoleS.equals("ORG")) { %>
                    <!--Start Button dropdown after sign in -->
                    <div class="btn-group navbar-nav navbar-btn">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color:black; color:white;">
                            <img src="img/test2.jpg" class="navbar-nav" style="width:35px; height:35px; border-radius:24px; margin-right:5px">
                            Oliveoil <span class="caret"></span>
                        </button>

                        <ul class="dropdown-menu" style="background-color:black; color:white; border-radius:10px;">
                            <li><a href="ProfileOrg.html" style="color:white;">My Profile</a></li>
                            <li><a href="AllDashboard.html" style="color:white;">DashBoard</a></li>
                            <li><a href="index.html" style="color:white;">Sign out</a></li>
                        </ul>
                    </div>
                    <% } else if (checkRoleS.equals("ADM")) { %>
                    <!--Start Button dropdown after sign in -->
                    <div class="btn-group navbar-nav navbar-btn">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color:black; color:white;">
                            <img src="img/test2.jpg" class="navbar-nav" style="width:35px; height:35px; border-radius:24px; margin-right:5px">
                            Oliveoil <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" style="background-color:black; color:white; border-radius:10px;">
                            <li><a href="ProfileAd.html" style="color:white;">My Profile</a></li>
                            <li><a href="Adminpanel.html" style="color:white;">My Article</a></li>
                            <li><a href="index.html" style="color:white;">Sign out</a></li>
                        </ul>
                    </div>
                    <% } else { %>
                    <button class="btn btn-custom navbar-btn" data-toggle="modal" data-target="#SignUp"> Sign up</button>
                    <button class="btn btn-custom navbar-btn" data-toggle="modal" data-target="#SignIn"> Sign in</button>
                    <% }%>
                </ul>
            </div>
        </nav><br>



                <!--LEFT MENU-->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav"><br>

                        <!--Menu-->
                        <li class="active">
                        <a class="btn btn-primary btn-xl" href="CreateArticle.jsp" >+ Create Article</a>
                        <li><a href="Adminpanel.jsp"><i class="fa fa-fw fa-book"></i> All Article</a></li>
                        <li><a href="ConcertRequest"><i class="fa fa-fw fa-envelope"></i> Concert Request</a></li>

                    </ul>
                </div>
                <!-- /.navbar-collapse -->
        </nav>
        <div id="page-wrapper">

            <form name="EditFormServlet" method="post" action="EditFormServlet"  id="myForm">
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">
                                <i class="fa fa-edit"></i> Edit Article <c:out value="${Status}" />
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


                    <!-- ************ Main Edit Article ************* -->
                    <sql:query var="articles" dataSource="${it58070053_webp}">
                        select User.User_ID , Article.Date_Time , Article.Article_ID , Article.Article_Name , Article.Content , Article.Map from User JOIN Article Using (User_ID) Where Article_ID = ?
                        <sql:param value="${param.id}"/>
                    </sql:query>          
                    <!-- Concert's Name -->
                    <h4><b>Concert's Name</b></h4>
                    <div class="form-group">
                        <div class="row"> 
                            <div class="col-sm-4">
                                <select disabled="disabled" class="form-control">
                                    <c:forEach var="Article_" items="${articles.rows}" >  
                                        <option>${Article_.Article_Name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>  

                    <!-- Summernote (Write Content) -->
                    <h4><b>Write a content</b></h4>

                    <div id="summernote">
                        <c:forEach var="Article_" items="${articles.rows}" > 
                            ${Article_.Content}
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
                    <textarea name="summerNoteText" style="display:none;"></textarea></div>
                    <input type="hidden" name="Article_ID" value="${param.id}">
                    <!-- Button Save & View -->
                    <div class=".col-md-3 .col-md-offset-3 text-right">
                        <input class="btn btn-info" id="confirm" type="submit" name="btn" value="Save"/>
                        <input class="btn btn-success" id="confirm" type="submit" name="btn" value="View Artical"/>
                    </div>

                </div>
            </form>
            </body>
            </html>
