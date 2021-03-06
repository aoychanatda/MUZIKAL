<%-- 
    Document   : WhatMuzikal
    Created on : Apr 14, 2017, 9:06:32 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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


<!--show What is Muzikal-->
<div class="container">
  <div class="row" style="width: 70%; margin: 0 auto">
     <div class="col-xs-12">
      <div class="thumbnail">
        <div><br><center><font size = "10">WHAT'S MUZIKAL</font></center><br></div>

        <hr size="10" width="100%"><br>

        <div><center>Music is a form of art. Music is also a form of entertainment that puts sounds<br> together in a way that people like or find interesting. Most music includes <br>people singing with their voices or playing musical instruments, such as the piano, <br>guitar, or drums.<br>
        The word music comes from the Greek word μουσική (mousike), which means "(art) of <br>the Muses". In Ancient Greece the Muses included the goddesses of music, poetry, <br>art, and dance. Someone who makes music is known as a musician.</center></div><br><br>
      </div>
    </div>
  </div>
</div>

     

<!-- Footer -->
<div style="margin-bottom:7%;"></div>
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
  </body>
</html>