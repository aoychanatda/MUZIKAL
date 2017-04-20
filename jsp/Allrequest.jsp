<%-- 
    Document   : Allrequest
    Created on : Apr 15, 2017, 2:25:25 PM
    Author     : test
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <body class="colorful3">
        <div id="wrapper2">
            <% String checkRoleS = (String)session.getAttribute("checkRoleS"); %>
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
              <!--Start Button dropdown after sign in -->
              <div class="btn-group navbar-nav navbar-btn">

                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color:black; color:white;">
                <img src="img/test2.jpg" class="navbar-nav" style="width:35px; height:35px; border-radius:24px; margin-right:5px">
                Oliveoil <span class="caret"></span>
                </button>

                <ul class="dropdown-menu" style="background-color:black; color:white; border-radius:10px;">
                  <li><a href="ProfileAd.html" style="color:white;">My Profile</a></li>
                  <li><a href="Adminpanel.jsp" style="color:white;">My Article</a></li>
                  <li><a href="index.html" style="color:white;">Sign out</a></li>
                </ul>
              </div>
              </ul>
            </div>
        </nav>

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
            </nav>
            <!-- /.navbar-collapse -->
            
        <!-- MAIN -->
        <form action="ConcertRequest" method="post">
            <div id="page-wrapper">

                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">
                                Concert Request
                            </h1>

                        </div>
                    </div>
                    <!-- /.row -->

                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#allre1" aria-controls="allre1" role="tab" data-toggle="tab">All Request</a></li>
                        <li role="presentation"><a href="#accept1" aria-controls="accept1" role="tab" data-toggle="tab">Accepted Request</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        
                        <!-- SHOW ALL CONCERT REQUEST -->
                        <div role="tabpanel" class="tab-pane fade in active" id="allre1">
                            <h2>All Request</h2>
                            <table id="allre1-dt" class="table table-striped" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Concert's Name</th>
                                        <th>Organizer</th>
                                        <th>Status</th>
                                        <th>Date&Time</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="cname" items="${requestScope.Concert_Name}" varStatus="loop" >
                                    <tr>
                                        <!-- Concert's Name Column -->
                                        <td>${cname}</td>
                                        <!-- Organizer Name Column -->
                                        <td>${requestScope.Contact_name[loop.index]}</td>
                                        <!-- Status Column -->
                                        <td>                                      
                                            <c:choose>
                                                <c:when test="${requestScope.Status[loop.index] == 'CANCELED'}">
                                                    <span class="label label-danger">CANCELED</span>
                                                </c:when>
                                                <c:when test="${requestScope.Status[loop.index] == 'ACCEPTED'}">
                                                    <span class="label label-success">ACCEPTED</span>
                                                </c:when>
                                                <c:when test="${requestScope.Status[loop.index] == 'PENDING'}">
                                                    <span class="label label-warning">PENDING</span>
                                                </c:when>
                                                <c:when test="${requestScope.Status[loop.index] == 'PUBLISHED'}">
                                                    <span class="label label-primary">PUBLISHED</span>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                        <!-- Date&Time Column -->
                                        <td>${requestScope.Date_Time[loop.index]}</td>
                                        <!-- Button View Detail Column -->
                                        <td><a class="btn btn-info" href="ConcertDetail?id=${cname}" >View Detail</a></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                                    
                       <!-- SHOW ALL ACCEPTED CONCERT -->
                        <div role="tabpanel" class="tab-pane fade" id="accept1">
                            <h2>Accepted Request</h2>
                            <table id="accept1-dt" class="table table-striped" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Concert's Name</th>
                                        <th>Organizer</th>
                                        <th>Status</th>
                                        <th>Date</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="ACcname" items="${requestScope.Concert_NameAc}" varStatus="loopAC" >
                                    <tr>
                                        <!-- Concert's Name Column -->
                                        <td>${ACcname}</td>
                                        <!-- Organizer Name Column -->
                                        <td>${requestScope.Contact_nameAc[loopAC.index]}</td>
                                        <!-- Status Column -->
                                        <td><span class="label label-success">ACCEPTED</span></td>
                                        <!-- Date&Time Column -->
                                        <td>${requestScope.Date_TimeAc[loopAC.index]}</td>
                                        <!-- Button View Detail Column -->
                                        <td><a class="btn btn-info" href="ConcertDetail?id=${ACcname}" >View Detail</a></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </form>
    </body>
</html>
