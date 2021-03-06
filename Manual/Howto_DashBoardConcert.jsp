<%-- 
    Document   : ็Howto_DashBoardConcert
    Created on : Apr 21, 2017, 10:54:28 AM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en" class="no-js"> 
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>How to Sign In and Sign Out</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/modernizr.custom.js"></script>


    </head>
    <body class="colorful3">   

        <!-- Start Check NavBar -->  
        <% String checkRoleS = (String) session.getAttribute("checkRoleS");%>
        
        <% if (checkRoleS == null) { %>
        <jsp:include page="navbarguest.jsp"/>
       

        <% } else if (checkRoleS.equals("MEM")) { %>
        <nav class="navbar navbar-custom navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-brand" style="width:10%;">
                    <a class="navbar-header" href="indexMem.html">
                        <img src="img/muzikal1logo-invert.png" style="width:130%; height:130%;">
                    </a>
                </div>
                <ul class="nav navbar-nav navbar-right" style="padding-right:10px;">
                    
                    <!--Start Button dropdown after sign in -->
                    <div class="btn-group navbar-nav navbar-btn">

                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color:black; color:white;">
                            <img src="img/test2.jpg" class="navbar-nav" style="width:35px; height:35px; border-radius:24px; margin-right:5px">
                            Oliveoil <span class="caret"></span>
                        </button>

                        <ul class="dropdown-menu" style="background-color:black; color:white; border-radius:10px;">
                            <li><a href="ProfileMember.jsp" style="color:white;">My Profile</a></li>
                            <li><a href="MyTicket.jsp" style="color:white;">My Ticket</a></li>
                            <li><a href="index.jsp" style="color:white;">Sign out</a></li>
                        </ul>
                    </div>
                </ul>
            </div>
        </nav><br>                
        
        <% } else if (checkRoleS.equals("ORG")) { %>
        <nav class="navbar navbar-custom navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-brand" style="width:10%;">
                    <a class="navbar-header" href="indexOrg.html">
                        <img src="img/muzikal1logo-invert.png" style="width:130%; height:130%;">
                    </a>
                </div>
                <ul class="nav navbar-nav navbar-right" style="padding-right:10px;">
                    
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
        

        <% } else if (checkRoleS.equals("ADM")) { %>
        <nav class="navbar navbar-custom navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-brand" style="width:10%;">
                    <a class="navbar-header" href="indexAd.html">
                        <img src="img/muzikal1logo-invert.png" style="width:130%; height:130%;">
                    </a>
                </div>
                <ul class="nav navbar-nav navbar-right" style="padding-right:10px;">
                    
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
        </nav>
       
        <% }%>
        <!-- End Check Nav Bar -->

        <div class="container" id="buy">
            <div class="row" style="width: 70%; margin: 0 auto">
                <div class="col-xs-12">        
                    <div class="thumbnail">
                        <center><h3>วิธีการดูยอดขายของคอนเสิร์ต</h3></center>
                        <hr size="10" width="100%">
                        <p>
                            1. เข้าสู่ระบบด้วยชื่อบัญชีผู้ใช้ของคุณ <br>
                            2. คลิกที่ชื่อบัญชีของคุณ ตรงมุมขวาบนของหน้าจอ เลือกเมนู ‘My DashBoard’ <br>
                        <center>ใส่รูป</center><br>
                            3. จากนั้นจะทำการเข้าสู่หน้า AllDashBoard  ซึ่งในหน้านี้จะโชว์จำนวนบัตรที่ขายได้ทั้งหมดในแต่ละคอนเสิร์ต<br>
                        <center>ใส่รูป</center><br>
                        4.ถ้าหากอยากดูรายการขายบัตรทั้งหมดให้คุณคลิกปุ่ม DashBoard มุมบนซ้าย จากนั้น กดเลือก DashBoard Concert<br>
                        <center>ใส่รูป</center><br>
                        5.จากนั้นให้คุณคลิกปุ่ม DashBoard ที่มุมบนซ้ายอีกครั้ง จะมีชื่อคอนเสิร์ตทั้งหมดแสดงขึ้นมา ถ้าหากคุณอยากดูยอดขายหรือรายละเอียดของรายการที่ขายบัตรได้ในคอนเสิร์ตนั้นๆ<br>
                        <center>ใส่รูป</center><br>
                        6.เมื่อคลิกที่ชื่อคอนเสิร์ตนั้นๆ แล้วจะทำการแสดงผลสรุปการขายบัตรในแต่ละรายการออกมาเป็นตาราง<br>
                        <center> ใส่รูป</center>
                        </p>


                    </div>
                </div>
            </div>
        </div>
        <!-- End what is muzikal-->

        <!-- Footer -->
        <footer style="background-color: rgba(0,0,0,0.6);">
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
        <!-- hide scrollbar -->

    </body>
</html>
