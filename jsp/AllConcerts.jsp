<%-- 
    Document   : AllConcert
    Created on : Apr 14, 2017, 8:57:41 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%! int id1 = 0; %>

<!DOCTYPE html>
<html lang="en" class="no-js"> 
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Muzikal - Get yourself to concert</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/modernizr.custom.js"></script>


    </head>
    <body class="colorful3">   

        <!-- Start Check NavBar -->  
        <% String checkRoleS = (String) session.getAttribute("checkRoleS");%>
        <%= session.getAttribute("checkRoleS")%><br>
        <% if (checkRoleS == null) { %>
        <jsp:include page="navbarguest.jsp"/>
        <% out.println("in guestNull"); %>

        <% } else if (checkRoleS.equals("MEM")) { %>
        <nav class="navbar navbar-custom navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-brand" style="width:10%;">
                    <a class="navbar-header" href="indexMem.html">
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
                            <li><a href="ProfileMem.html" style="color:white;">My Profile</a></li>
                            <li><a href="ArticalMem.html" style="color:white;">My Ticket</a></li>
                            <li><a href="index.html" style="color:white;">Sign out</a></li>
                        </ul>
                    </div>
                </ul>
            </div>
        </nav><br>                
        <% out.println("in mem"); %>
        <% } else if (checkRoleS.equals("ORG")) { %>
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
                            <li><a href="ProfileOrg.html" style="color:white;">My Profile</a></li>
                            <li><a href="AllDashboard.html" style="color:white;">DashBoard</a></li>
                            <li><a href="index.html" style="color:white;">Sign out</a></li>
                        </ul>
                    </div>
                </ul>
            </div>
        </nav><br>
        <% out.println("in org"); %>

        <% } else if (checkRoleS.equals("ADM")) { %>
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
                            <li><a href="ProfileAd.html" style="color:white;">My Profile</a></li>
                            <li><a href="Adminpanel.html" style="color:white;">My Artical</a></li>
                            <li><a href="index.html" style="color:white;">Sign out</a></li>
                        </ul>
                    </div>
                </ul>
            </div>
        </nav>
        <% out.println("in org"); %>
        <% }%>
        <!-- End Check Nav Bar -->


        <div style="margin-top:5%;"></div>
        <!-- Start product-->
    <center><h1 class="white">All Concert</h1></center>
    <div class="container" style="width: 100%;">
        <div class="row" style="width: 100%; margin-left:-3%;">
            <ul class="grid cs-style-2">
                <sql:setDataSource var="it58070053_webp" driver="com.mysql.jdbc.Driver" 
                                   url="jdbc:mysql://ihost.it.kmitl.ac.th:3306/it58070053_webp" 
                                   user="it58070053_webp" password="utKavVnZ79"/>
                <sql:query var = "concert" dataSource="${it58070053_webp}">
                    SELECT Concert_ID, Start_Date, Concert_Name FROM Article JOIN Concert On (Concert_Name=Article_Name) ORDER BY Article.Date_Time;
                </sql:query>
                <c:forEach var="row" items="${concert.rows}">
                    <% id1 += 1; %>
                    <div class="col-sm-4 col-xs-12">
                        <li>
                            <figure>
                                <!-- ดึงข้อมูลจาก Table Concert(Picture_Poster)-->
                                <img src="<c:url value="${row.Picture_Poster}"/>" alt="img02">
                                <figcaption>
                                    <h4>${row.Concert_Name}</h4>                                        
                                    <h6>${row.Start_Date}</h6>
                                    <!-- <form action="Article" method="POST"> -->
                                        <a href="ArticleServlet?id=${row.Concert_ID}" method="">View Detail!</a>
                                        <!--<input type="submit" value="View Detail!" class='btn btn-danger'/> -->
                                    <!-- </form>  -->
                                </figcaption>
                            </figure>
                        </li>
                    </div>
                </c:forEach>

            </ul>
        </div>
    </div>        
    <!-- End product -->

    <!-- Footer -->
    <footer style="background-color:rgba(255,255,255,0.1);">
        <div class="row">
            <div class="container ">
                <div class="col-lg-3 col-md-6" style="padding: 85px 0; text-align:center;">
                    <a href="What.html" style="text-decoration: none"><h3><font color="white">What is Muzikal</font></h3></a>
                </div>
                <div class="col-lg-4 col-md-6"></div>
                <div class="col-lg-3 col-md-6">
                    <h3><font color="white">Contact</font></h3>
                    <p>Jirpinya Onsang<br>
                        Tel: xxxxxxxx<br>
                        Email: xxx@xxx.com</p>
                    <p><a href="" title="Contact me!"><i class="fa fa-envelope"></i>Facebook</a></p>
                    <h3><font color="white">Follow</font></h3>
                    <a href="" id="gh" target="_blank" title="Twitter"><span class="fa-stack fa-lg">
                        </span>
                        Twitter</a>
                    <a href=""  target="_blank" title="GitHub"><span class="fa-stack fa-lg">
                        </span>
                        GitHub</a><br><br>
                </div>
                </footer>
                <!--End footer -->

                <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                <script src="js/jquery-3.1.1.min.js"></script>
                <!-- Include all compiled plugins (below), or include individual files as needed -->
                <script src="js/bootstrap.min.js"></script>
                <script src="js/toucheffects.js"></script>
    </body>
</html>
