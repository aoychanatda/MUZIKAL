<%-- 
    Document   : data-concert
    Created on : Apr 13, 2017, 4:34:18 PM
    Author     : test
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">


        <title>Concert's Detail</title>
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
        <% String Login_ID = (String) session.getAttribute("Login_ID");%>
        <% String checkRoleS = (String)session.getAttribute("checkRoleS"); %>
        
        <div id="wrapper2">
            <!-- Navigation -->
            <nav class="navbar navbar-custom navbar-fixed-top">
                <div class="container-fluid">
                    <div class="navbar-brand" style="width:10%;">
                        <a class="navbar-header" href="index.jsp">
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
                        
                        <% if (checkRoleS.equals("ORG")) { %>
                        <!--Start Button dropdown after sign in -->
                        <div class="btn-group navbar-nav navbar-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color:black; color:white;">
                                <img src="img/test2.jpg" class="navbar-nav" style="width:35px; height:35px; border-radius:24px; margin-right:5px">
                                Oliveoil <span class="caret"></span>
                            </button>

                            <ul class="dropdown-menu" style="background-color:black; color:white; border-radius:10px;">
                                <li><a href="ProfileOrg.html" style="color:white;">My Profile</a></li>
                                <li><a href="AllDashboard.jsp" style="color:white;">My Dashboard</a></li>
                                <li><a href="index.jsp" style="color:white;">Sign out</a></li>
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
                                <li><a href="Adminpanel.jsp" style="color:white;">My Article</a></li>
                                <li><a href="index.jsp" style="color:white;">Sign out</a></li>
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
                            <li><a href="Adminpanel.html"><i class="fa fa-fw fa-book"></i> All Article</a></li>
                            <li><a href="ConcertRequest"><i class="fa fa-fw fa-envelope"></i> Concert Request</a></li>


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
                                <i class="fa fa-edit"></i> Concert's Detail
                            </h1>
                            <ol class="breadcrumb">
                                <% if ("Login_ID" == "ADM") { %>
                                <li>
                                    <i class="fa fa-envelope"></i>  <a href="ConcertRequest">Concert Request</a>
                                </li>
                                <% } %>
                                <li class="active">
                                    <i class="fa fa-edit"></i> Concert's Detail
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->
                    
                    
                    <!-- MAIN -->
                    <%= session.getAttribute("Login_ID")%><br>
                    <%= session.getAttribute("checkRoleS")%><br>
                    <form action="ConcertDetail" method="post">
                        <c:choose>
                            <c:when test="${requestScope.Status == 'CANCELED'}">
                                <div class="alert alert-danger">
                                    <strong>THIS REQUEST WAS CANCELED.</strong>
                                </div>
                            </c:when>
                            <c:when test="${requestScope.Status == 'PUBLISHED'}">
                                <div class="alert alert-info">
                                    <strong>THIS REQUEST WAS PUBLISHED.</strong>
                                </div>
                            </c:when>
                            <c:when test="${requestScope.Status == 'ACCEPTED'}">
                                <div class="alert alert-success">
                                    <strong>THIS REQUEST WAS ACCEPTED.</strong>
                                </div>
                            </c:when>
                        </c:choose>
                        
                            <h3>Organizer's Detail</h3> 
                            <div id="organizer-detail">
                                <div class="row">
                                    <div class="col-sm-4">
                                        Company name: <div class="well well-sm">${requestScope.Company_name}</div>
                                        Email: <div class="well well-sm">${requestScope.Email}</div>
                                    </div>
                                    <div class="col-sm-4">
                                        Contact name: <div class="well well-sm">${requestScope.Contact_name}</div>
                                        Phone: <div class="well well-sm">${requestScope.Phone}</div>
                                    </div>
                                </div>
                            </div>


                            <h3>Concert's Detail</h3> 
                            <div id="concert-detail">
                                <div class="row">
                                    <div class="col-sm-8">
                                        <p>Concert's name: <div class="well well-sm"><c:out value="${requestScope.Concert_Name}"/> </div></div></div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        Starts Date: <div class="well well-sm"><c:out value="${requestScope.Start_Date}"/></div>
                                        Starts Time: <div class="well well-sm">${requestScope.Start_Time}</div>
                                    </div>
                                    <div class="col-sm-4">
                                        Ends Date:<div class="well well-sm"><c:out value="${requestScope.End_Date}"/></div>
                                        Ends Time:<div class="well well-sm">${requestScope.End_Time}</div>
                                    </div>
                                </div>

                                
                                    <div class="row">
                                        <div class="col-sm-4">
                                            Location: <div class="well well-sm">${requestScope.Location_Name}</div>

                                        </div>
                                        <div class="col-sm-4">
                                            Concert's Hall name: <div class="well well-sm">${requestScope.Hall_Name}</div>

                                        </div>
                                    </div>
                                
                                Cover Image: <div class="well well-sm"><img src="${requestScope.Picture_Cover}"></div>
                                Poster: <div class="well well-sm"><img src="${requestScope.Picture_Poster}"><br></div>
                                All Show time: 
                                <div class="well well-sm">
                                    <c:forEach items="${requestScope.Showtime_Date}" var="item">
                                        - ${item}<br>
                                    </c:forEach></div>
                                All Zone: 
                                <div class="well well-sm">
                                    <c:forEach items="${requestScope.Zone_Name}" var="name">
                                        - Zone ${name}<br>
                                    </c:forEach></div>
                                All Price: 
                                <div class="well well-sm">
                                    <c:forEach var="zname" items="${requestScope.Zone_Name}" varStatus="price">
                                        - Zone ${zname} : ฿ <fmt:formatNumber value="${requestScope.Price[price.index]}" minFractionDigits="0" maxFractionDigits="0"/><br>
                                    </c:forEach>
                                </div>
                                <% if ("Login_ID" == "ADM") { %>
                                <c:choose>
                                    <c:when test="${requestScope.Status == 'PENDING'}">
                                        <div class=".col-md-3 .col-md-offset-3 text-right">
                                            <input class="btn btn-success" id="accept" type="submit" name="btn" value="ACCEPT"></button>
                                            <input class="btn btn-danger" id="cancel" type="submit" name="btn" value="CANCEL"></button>
                                        </div>
                                    </c:when>
                                </c:choose>
                                <% } %>
                                <input type="hidden" name="id" value="${requestScope.Concert_Name}">
                            
                    </form>
                    </body>
                    </html>
