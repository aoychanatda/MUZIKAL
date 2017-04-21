<%-- 
    Document   : Manual
    Created on : Apr 20, 2017, 2:51:25 PM
    Author     : test
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body class="colorful3">   

        <!-- Start Check NavBar -->  
        <% String checkRoleS = (String) session.getAttribute("checkRoleS"); %>
        <% if (checkRoleS == null) { %>
        <jsp:include page="navbarguest.jsp"/>
        <%-- out.println("in guestNull"); --%>

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
                            <li><a href="ProfileMem.jsp" style="color:white;">My Profile</a></li>
                            <li><a href="ArticalMem.jsp" style="color:white;">My Ticket</a></li>
                            <li><a href="SignOutServlet" style="color:white;">Sign out</a></li>
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
                            <li><a href="ProfileOrg.html" style="color:white;">My Profile</a></li>
                            <li><a href="AllDashboard.html" style="color:white;">My Dashboard</a></li>
                            <li><a href="SignOutServlet" style="color:white;">Sign out</a></li>
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
                            <li><a href="ProfileAd.html" style="color:white;">My Profile</a></li>
                            <li><a href="Adminpanel.html" style="color:white;">My Article</a></li>
                            <li><a href="SignOutServlet" style="color:white;">Sign out</a></li>
                        </ul>
                    </div>
                </ul>
            </div>
        </nav>

        <% }%>
        <!-- End Check Nav Bar -->

        <div class="container">
            <div class="row" style="width: 70%; margin: 0 auto">
                <div class="col-xs-12">        
                    <div class="thumbnail">
                        <div class="jumbotron">
                            <h1>Manual User</h1> 
                            <p>คู่มือการใช้ Muzikal</p>
                        </div> 
                        <p align="center" class="cd">
                            <a href="#member" class="page-scroll" data-scroll="true">MEMBER</a> | 
                            <a href="#org" class="page-scroll" data-scroll="true">ORGANIZER</a> | 
                            <a href="#admin" class="page-scroll" data-scroll="true">ADMIN</a></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row" style="width: 70%; margin: 0 auto">
                <div class="col-xs-12">        
                    <div class="thumbnail">
                        
                        <div class="cd" id="member">
                            <h3><b><span class="glyphicon glyphicon-question-sign"></span> FAQ MEMBER</b></h3>
                            <hr>
                            <span class="glyphicon glyphicon-chevron-right"></span> <a href="HowtoSignUpMem.jsp">วิธีสมัครสมาชิก Muzikal</a> <br>
                            <span class="glyphicon glyphicon-chevron-right"></span> <a href="HowtoSignInOut.jsp">วิธีเข้าสู่ระบบ/ออกจากระบบ</a><br>
                            <span class="glyphicon glyphicon-chevron-right"></span> <a href="WhatMyTicket.jsp">เมนู My Ticket คืออะไร</a><br>
                            <span class="glyphicon glyphicon-chevron-right"></span> <a href="WhatMuCash.jsp">Mu Cash คืออะไร</a><br>
                            <span class="glyphicon glyphicon-chevron-right"></span> <a href="WhatTicketRefund.jsp">Ticket Refund คืออะไร</a><br>
                            <span class="glyphicon glyphicon-chevron-right"></span> <a href="HowtoReserve.jsp">การจองบัตรคอนเสิร์ต/รับบัตรคอนเสิร์ต</a><br>
                            <span class="glyphicon glyphicon-chevron-right"></span> <a href="HowToPay.jsp">การชำระเงิน</a><br>
                            <span class="glyphicon glyphicon-chevron-right"></span> <a href="HowtoEditMem.jsp">จัดการบัญชีข้อมูลส่วนตัว</a><br>
                        </div>
                        <div class="cd" id="org">
                            <h3><b><span class="glyphicon glyphicon-question-sign"></span> FAQ ORGANIZER</b></h3>
                            <hr>
                            <span class="glyphicon glyphicon-chevron-right"></span> <a href="HowtoSignUpOrg.jsp">วิธีสมัครเป็น Organizer</a><br>
                            <span class="glyphicon glyphicon-chevron-right"></span> <a href="HowtoSignInOutOrg.jsp">วิธีเข้าสู่ระบบ/ออกจากระบบ</a><br>
                            <span class="glyphicon glyphicon-chevron-right"></span> <a href="#">วิธีการส่งข้อมูลคอนเสิร์ต</a><br>
                            <span class="glyphicon glyphicon-chevron-right"></span> <a href="#">ข้อมูลดูยอดขายของคอนเสิร์ตอย่างไร</a><br>
                            <span class="glyphicon glyphicon-chevron-right"></span> <a href="#">วิธีการดูข้อมูลคอนเสิร์ต</a><br>
                            <span class="glyphicon glyphicon-chevron-right"></span> <a href="HowtoEditOrg.jsp">จัดการบัญชีข้อมูลส่วนตัว</a></div>
                        <div class="cd" id="admin">
                            <h3><b><span class="glyphicon glyphicon-question-sign"></span> FAQ ADMIN</b></h3>
                            <hr>
                            <span class="glyphicon glyphicon-chevron-right"></span> <a href="HowtoSignIO_AD.jsp">วิธีเข้าสู่ระบบ/ออกจากระบบ</a><br>
                            <span class="glyphicon glyphicon-chevron-right"></span> <a href="HowtoViewArticle.jsp">ดูบทความทั้งหมดอย่างไร</a><br>
                            <span class="glyphicon glyphicon-chevron-right"></span> <a href="HowtoRequestAdmin.jsp">การจัดการการร้องขอจัดคอนเสิร์ต</a><br>
                            <span class="glyphicon glyphicon-chevron-right"></span> <a href="HowtoCrEdViAdmin.jsp">วิธีสร้าง/แก้ไข/ลบ/ดูบทความ</a><br>
                            <span class="glyphicon glyphicon-chevron-right"></span> <a href="HowtoEditAdmin.jsp">จัดการบัญชีข้อมูลส่วนตัว</a></div>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer style="background-color:rgba(255,255,255,0.1);">
            <div class="row">
                <div class="container ">
                    <div class="col-lg-3 col-md-6" style="padding: 85px 0; text-align:center;">
                        <a href="What.html" style="text-decoration: none"><h3><font color="white">What is Muzikal</font></h3></a><br>
                        <a href="Manual.jsp" style="text-decoration: none"><font color="white">Manual User</font></a>
                    </div>
                    <div class="col-lg-4 col-md-6"></div>
                    <div class="col-lg-3 col-md-6">
                        <h3><font color="white">Contact</font></h3>
                        <font color="white"><p>Jirpinya Onsang<br>
                            Tel: xxxxxxxx<br>
                            Email: xxx@xxx.com</p></font>
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
                    <!-- End-->

                    <!-- End product-->
                    <!-- jQuery (necessary for Bootstrap's JavaScriptplugins)-->
                    <script src="js/jquery-3.1.1.min.js"></script>
                    <!-- Include all compiled plugins(below), or include individual files as needed -->
                    <script src="js/bootstrap.min.js"></script>
                    <script src="js/jquery.easing.min.js"></script>
                    <script src="js/scrolling-nav.js"></script>
                    </body>
                    </html>
