<%-- 
    Document   : DashBoardConcert
    Created on : Apr 17, 2017, 7:21:16 PM
    Author     : lenovo
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

        <title>Dashboard</title>

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
                                        <li><a href="ProfileOrganize.jsp" style="color:white;">My Profile</a></li>
                                        <li><a href="AllDashBoard.jsp" style="color:white;">DashBoard</a></li>
                                        <li><a href="index.jsp" style="color:white;">Sign out</a></li>
                                    </ul>
                                </div>
                            </ul>
                        </div>
                    </nav><br>
                    <sql:setDataSource var="it58070053_webp" driver="com.mysql.jdbc.Driver" 
                                       url="jdbc:mysql://ihost.it.kmitl.ac.th:3306/it58070053_webp" 
                                       user="it58070053_webp" password="utKavVnZ79"/>

                    <sql:query var = "user" dataSource="${it58070053_webp}">
                        select User.User_ID , Concert.Concert_ID , Concert.Concert_Name , Concert.Status , Concert.Start_Date , Concert.Start_Time , Concert.End_Date , Concert.End_Time from User JOIN Concert Using (User_ID) Where User_ID = ?;
                        <sql:param value="${Login_ID}"/>
                    </sql:query>


                    <!--LEFT MENU-->
                    <div class="collapse navbar-collapse navbar-ex1-collapse">
                        <ul class="nav navbar-nav side-nav"><br>

                            <!--Dashboard(Dropdown)-->
                            <li class="active">
                                <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-dashboard"></i> Dashboard </a>
                                <ul id="demo" class="collapse">
                                    <li><a href="AllDashBoard.jsp">Dashboard Overview</a></li>
                                        <c:forEach var="row" items="${user.rows}">
                                        <li><a href="DashBoardConcert.jsp?id=${row.Concert_ID}" name="Concert" value="Concert">${row.Concert_Name}</a></li>
                                        
                                    </c:forEach>
                                </ul>
                            </li>

                            <!--Forms-->
                            <li><a href="forms.html"><i class="fa fa-fw fa-edit"></i> Forms</a></li>

                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
            </nav>

            <!--___________________________________________CONTENT___________________________________________-->
            <div id="page-wrapper" >
                <div class="container-fluid" >

                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header" >
                                Dashboard<br>
                                <small>Concert Name</small>
                            </h1>
                            <h>
                        </div>
                    </div>
                    <!-- /.row -->

                    <!-- summary overview -->
                    <div class="row">
                        <div class="col-lg-4 col-md-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3"><i class="fa fa-eye fa-5x"></i></div>
                                        <div class="col-xs-8 text-right">
                                            <div class="huge">7999</div>
                                            <div>TOTAL VIEWS</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="panel panel-green">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3"><i class="fa fa-shopping-cart fa-5x"></i></div>
                                        <div class="col-xs-8 text-right">
                                            <div class="huge">1239</div>
                                            <div> TICKETS SOLD</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="panel panel-red">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3"><i class="fa fa-btc fa-5x"></i></div>
                                        <div class="col-xs-8 text-right">
                                            <div class="huge"><b>250,000</b></div>
                                            <div>TOTAL SALES</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->

                    <!--GRAPH-->
                    <div class="row">
                        <div class="col-lg-8" >
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Total Views & Number of Order Chart</h3>
                                </div>
                                <div class="panel-body">
                                    <div id="morris-area-concert-chart"></div>
                                </div>
                            </div>

                        </div>


                        <div class="col-lg-4" >
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-fw fa-user"></i> Donut chart </h3>
                                </div>
                                <div class="panel-body">
                                    <div id="morris-donut-chart"></div>
                                </div>
                            </div>
                        </div>

                    </div>
                     
                    <!--TABLE-->
                    <div class="row">
                        <div class="col-lg-12">
                            
                            <h2>Concert_Name</h2>
                            <sql:query var = "user2" dataSource="${it58070053_webp}">
                                select User.User_ID , Reservation.Order_ID , Reservation.Order_date , Reservation.Order_Status , Reservation.Total_Price , Reservation.getRefund , Reservation.Service_charge from User JOIN Reservation Using (User_ID) Where User_ID = ?;
                                <sql:param value="${Login_ID}"/>
                            </sql:query>
                            
                                <div class="table-responsive">
                               
                                 
                                        <table class="table table-bordered table-hover">

                                            <thead>
                                                <tr>
                                                    <th><center>Order ID</center></th>
                                                    <th><center>User ID</center></th>
                                                    <th><center>Date and Times</center></th>
                                                    <th><center>Status</center></th>
                                                    <th><center>Total Price (THB)</center></th>
                                                </tr>
                                            </thead>
                                            
                                            <tbody>
                                                 <c:forEach var="row2" items="${user2.rows}">
                                                <tr align="center">
                                                    <td><c:out value="${row2.Order_ID}"/></td> 
                                                    <td><c:out value="${row2.User_ID}"/></td>
                                                    <td><c:out value="${row2.Order_date}  &nbsp; 08:30:45"/></td>
                                                    <td class="btn btn-success col-md-2"><c:out value="${row2.Order_Status}"/></td>
                                                    <td><c:out value="${row2.Total_Price}"/></td>
                                                </tr>
                                                </c:forEach>
                                            </tbody>

                                        </table>
                                    
                                
                            </div>

                        </div>

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

</body>

</html>
