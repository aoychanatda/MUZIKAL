<%-- 
    Document   : HowtoEditMem
    Created on : Apr 20, 2017, 2:36:19 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body class="colorful3">   
            
            <!-- Start Check NavBar -->  
            <% String checkRoleS = (String)session.getAttribute("checkRoleS"); %>
            <% if(checkRoleS == null) { %>
                <jsp:include page="navbarguest.jsp"/>
                
            <% } else if(checkRoleS.equals("MEM")) { %>
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
                                <li><a href="MyTicket.jsp" style="color:white;">My Ticket</a></li>
                                <li><a href="SignOutServlet" style="color:white;">Sign out</a></li>
                            </ul>
                        </div>
                    </ul>
                </div>
            </nav><br>                
                
            <% } else if(checkRoleS.equals("ORG")) { %>
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
                                <li><a href="AllDashboard.html" style="color:white;">DashBoard</a></li>
                                <li><a href="SignOutServlet" style="color:white;">Sign out</a></li>
                            </ul>
                        </div>
                    </ul>
                </div>
            </nav><br>
            
            
            <% } else if(checkRoleS.equals("ADM")) { %>
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
                                <li><a href="Adminpanel.html" style="color:white;">My Artical</a></li>
                                <li><a href="SignOutServlet" style="color:white;">Sign out</a></li>
                            </ul>
                        </div>
                    </ul>
                </div>
            </nav>
            
            <% } %>
            <!-- End Check Nav Bar -->
            
            <div class="container" id="buy">
                <div class="row" style="width: 70%; margin: 0 auto">
                    <div class="col-xs-12">        
                        <div class="thumbnail">
                            <center><h3>‘My Profile’ คืออะไร ?</h3></center>
                            <hr size="10" width="100%">
                            <p> สำหรับเมนู ‘My Profile’ เป็นหน้าที่เก็บข้อมูลส่วนตัวที่คุณกรอกตอนสมัครสมาชิกครั้งแรก
                                คุณสามารถปรับเปลี่ยนข้อมูลส่วนตัวของคุณได้ตลอดเวลาและควรอัพเดทข้อมูลให้เป็นข้อมูลปัจจุบัน
                                ข้อมูลส่วนตัวของคุณจะถูกนำไปใช้ตอนทำรายการสั่งซื้อบัตร ในเมนู ‘My Profile’ จะมี features หลักๆ ดังนี้<br></p>
                            <center>ใส่รูปเหวย!!!!!</center><br><br>  
                            <center><h3>การเปลี่ยนแปลงข้อมูลส่วนตัว</h3></center>
                            <hr size="10" width="100%">
                            สำหรับขั้นตอนการเปลี่ยนแปลงข้อมูลบัญชีมีขั้นตอน ดังนี้<br>
                            1. เข้าสู่ระบบด้วยชื่อบัญชีที่ต้องการเปลี่ยนแปลงข้อมูล <br>
                            2. คลิกที่ชื่อบัญชีของคุณ ตรงมุมขวาบนของหน้าจอ เลือกเมนู ‘My Profile’ <br>
                            <center>ใส่รูปเหวย!!!!!</center><br>
                            3. คุณสามารถแก้ไขข้อมูลส่วนตัวของคุณได้ในเมนูนี้<br>
                            <center>ใส่รูปเหวย!!!!!</center><br>
                            4. กดปุ่ม ‘save’ เพื่อยืนยันการเปลี่ยนแปลงข้อมูล<br>
                            <center>ใส่รูปเหวย!!!!!</center><br>
                            
                        </div>
                    </div>
                </div>
            </div>
            
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
