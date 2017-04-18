<%-- 
    Document   : AllDashBoard
    Created on : Apr 17, 2017, 9:34:20 PM
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
                <!-- Navigation bar-->
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

                    <!--LEFT MENU-->
                    <div class="collapse navbar-collapse navbar-ex1-collapse">
                        <ul class="nav navbar-nav side-nav"><br>

                            <!--Dashboard(Dropdown)-->
                            <li class="active">
                                <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-dashboard"></i> Dashboard </a>
                                <ul id="demo" class="collapse">
                                    <li><a href="AllDashBoard.jsp">Dashboard Overview</a></li>
                                    <li><a href="DashBoardConcert.jsp">DashBoard Concert</a></li>
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
                                Dashboard Overview<br>
                            </h1>
                        </div>
                    </div>
                    <!-- /.row -->

                    <!--CARD-->
                    <div class="row">
                        <div class="col-lg-4" >
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><a href="Dashboard concert.html"><i class="fa fa-bar-chart-o fa-fw"></i> Concert1</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="col-lg-12" align="center"><img src="http://assets.gcstatic.com/u/apps/asset_manager/uploaded/2015/28/little-mix-the-get-weird-tour-2016-1437155664-custom-0.png" style="width:300px;height:300px;"></div>

                                    <div class="col-lg-12 col-md-12">
                                        <div class="panel-heading">
                                            <div class="col-xs-8 text-right">
                                                <div class="huge"><h2>543/1000</h2></div>
                                                <div> TICKETS SOLD</div>
                                            </div>
                                            <br> <i class="fa fa-user" style="font-size:36px"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4" >
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><a href="DashBoardConcert.jsp"><i class="fa fa-bar-chart-o fa-fw"></i> Concert2</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="col-lg-12" align="center"><img src="https://static1.squarespace.com/static/54a6e652e4b00f7c5fb09e89/t/580f9acaf7e0abd1f4b0c0dd/1477417686480/RobertEllis_EuroTour_V3_Thumb.jpg?format=500w" style="width:300px;height:300px;"></div>

                                    <div class="col-lg-12 col-md-12">
                                        <div class="panel-heading">
                                            <div class="col-xs-8 text-right">
                                                <div class="huge"><h2>132/560</h2></div>
                                                <div> TICKETS SOLD</div>
                                            </div>
                                            <br> <i class="fa fa-user" style="font-size:36px"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4" >
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><a href="Dashboard concert.html"><i class="fa fa-bar-chart-o fa-fw"></i> Concert3</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="col-lg-12" align="center"><img src="https://s-media-cache-ak0.pinimg.com/736x/88/27/82/88278203593d5f239797f1b3aa1e7d88.jpg" style="width:300px;height:300px;"></div>

                                    <div class="col-lg-12 col-md-12">
                                        <div class="panel-heading">
                                            <div class="col-xs-8 text-right">
                                                <div class="huge"><h2>673/750</h2></div>
                                                <div> TICKETS SOLD</div>
                                            </div>
                                            <br> <i class="fa fa-user" style="font-size:36px"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><br><br><br><br>

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
