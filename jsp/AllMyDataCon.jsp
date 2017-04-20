<%-- 
    Document   : AllMyDataCon
    Created on : Apr 19, 2017, 10:54:07 PM
    Author     : test
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
        <html lang="en">

        <head>

            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <meta name="description" content="">
            <meta name="author" content="">

            <title>All Data Concert</title>


            <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <link href="css/bootstrap.min.css" rel="stylesheet">
            <link href="css/sb-admin.css" rel="stylesheet">
            <link href="css/plugins/morris.css" rel="stylesheet">

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
                                        <li><a href="" style="color:white;">My Profile</a></li>
                                        <li><a href="AllDashboard.jsp" style="color:white;">My Dashboard</a></li>
                                        <li><a href="index.jsp" style="color:white;">Sign out</a></li>
                                    </ul>
                                </div>
                            </ul>
                        </div>
                    </nav><br>

                    <!--LEFT MENU-->
                    <div class="collapse navbar-collapse navbar-ex1-collapse">
                        <ul class="nav navbar-nav side-nav"><br>

                            <!--Dashboard(Dropdown)-->
                            <li class="active">
                                <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-dashboard"></i> Dashboard </a>
                                <ul id="demo" class="collapse">
                                    <li><a href="index.jsp">Dashboard Overview</a></li>
                                    <li><a href="Dashboard concert.html">Concert1</a></li>
                                    <li><a href="Dashboard concert.html">Concert2</a></li>
                                </ul>
                            </li>

                            <!--Forms-->
                            <li><a href="forms.html"><i class="fa fa-fw fa-edit"></i> Forms</a></li>
                            
                            <!-- All Data Concert -->
                            <li><a href="AllMyDataCon.jsp"><i class="fa fa-paper-plane-o"></i> All Data Concerts</a></li>
                            
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </nav>

                <!-- Main Page -->
                <sql:setDataSource var="it58070053_webp" driver="com.mysql.jdbc.Driver" 
                                       url="jdbc:mysql://ihost.it.kmitl.ac.th:3306/it58070053_webp" 
                                       user="it58070053_webp" password="utKavVnZ79"/>
               
                <sql:query var="user" dataSource="${it58070053_webp}">
                    SELECT Concert_Name, Status, Date_Time FROM Concert WHERE User_ID=?;
                    <sql:param value="${Login_ID}"/>
                </sql:query>
                
                <div id="page-wrapper" >
                    <div class="container-fluid" >

                        <!-- Page Heading -->
                        <div class="row">
                            <div class="col-lg-12">
                                <h1 class="page-header" >
                                    Dashboard Overview<br>
                                </h1>
                            </div>
                        </div>
                        <!-- /.row -->
                      
                           <!-- Concert Request Table -->
                        <table id="allre1-dt" class="table table-striped" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>Concert's Name</th>
                                <th>Status</th>
                                <th>Date & Time</th>
                                <th></th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="row" items="${user.rows}">
                                <tr>
                                    <td>${row.Concert_Name}</td>
                                    <td>
                                        <c:choose>
                                                <c:when test="${row.Status == 'CANCELED'}">
                                                    <span class="label label-danger">CANCELED</span>
                                                </c:when>
                                                <c:when test="${row.Status == 'ACCEPTED'}">
                                                    <span class="label label-success">ACCEPTED</span>
                                                </c:when>
                                                <c:when test="${row.Status == 'PENDING'}">
                                                    <span class="label label-warning">PENDING</span>
                                                </c:when>
                                                <c:when test="${row.Status == 'PUBLISHED'}">
                                                    <span class="label label-primary">PUBLISHED</span>
                                                </c:when>
                                            </c:choose>
                                    </td>
                                    <td>${row.Date_Time}</td>
                                    <td><a class="btn btn-info" href="ConcertDetail?id=${row.Concert_Name}" >View Detail</a></td>

                                </tr>
                            </c:forEach>
                                <%= session.getAttribute("Login_ID")%><br>
                        </tbody>
                    </table>

                </div>

                    </div> <!-- /.row -->
                        
                    </div> <!-- /.container-fluid -->

                </div> <!-- /#page-wrapper -->

            </div> <!-- /#wrapper -->

            <!-- jQuery -->
            <script src="js/jquery.js"></script>

            <!-- Bootstrap Core JavaScript -->
            <script src="js/bootstrap.min.js"></script>

            <!-- Morris Charts JavaScript -->
            <script src="js/plugins/morris/raphael.min.js"></script>
            <script src="js/plugins/morris/morris.min.js"></script>
            <script src="js/plugins/morris/morris-data.js"></script>
            <script src="js/plugins/morris/morris-donut.js"></script>

        </body>

        </html>

