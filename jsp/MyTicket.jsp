<%-- 
    Document   : MyTicket
    Created on : Apr 15, 2017, 6:03:12 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>My Ticket</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <link href="js/jquery-3.1.1.min.js" rel="stylesheet">

    </head>
    <body class="colorful3">
        <!-- Navigation bar-->
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
                            <li><a href="MyTicket.html" style="color:white;">MyTicket</a></li>
                            <li><a href="index.html" style="color:white;">Sign out</a></li>
                        </ul>
                    </div>
                </ul>
            </div>
        </nav><br>
        <!--______________________________________________________________CONTENT__________________________________________________________________-->

    <center><h1>MY TICKET</h1></center>

    <br>
    <% String Login_ID = (String) session.getAttribute("Login_ID");%>
    
    <c:set var="Login_ID" value="${Login_ID}"/>
    
    
    <sql:setDataSource var="it58070053_webp" driver="com.mysql.jdbc.Driver" 
                       url="jdbc:mysql://ihost.it.kmitl.ac.th:3306/it58070053_webp" 
                       user="it58070053_webp" password="utKavVnZ79"/>

    <sql:query var = "concert" dataSource="${it58070053_webp}">    
        Select Distinct r.Order_ID, c.Concert_Name, r.Order_Status, r.Total_Price, u.Fname, u.Lname, p.Payment_method, 
        r.Order_datetime, z.Zone_Name, t.Price_of_Ticket, s.Date, c.Start_Time, l.Location_Name, r.Service_charge, u.Email, r.getRefund
        FROM User u
        JOIN Reservation r USING (User_ID)
        JOIN Payment p USING (Order_ID)
        JOIN Ticket t USING (Order_ID)
        JOIN Zone z USING (Zone_ID)
        JOIN Showtime s USING (Showtime_ID)
        JOIN Concert c USING (Concert_ID)
        JOIN Location l USING (Location_ID)
        WHERE u.User_ID = ?;
        <sql:param value="${User_ID}"/>
    </sql:query>
    
        
    <sql:query var="refund" dataSource="${it58070053_webp}">
        Select c.Concert_Name, s.Date, c.Start_Time, l.Location_Name, z.Zone_Name, 
        t.Price_of_Ticket, r.Total_Price, r.Service_charge, r.Order_ID
        FROM User u
        JOIN Reservation r USING (User_ID)
        JOIN Ticket t USING (Order_ID)
        JOIN Zone z USING (Zone_ID)
        JOIN Showtime s USING (Showtime_ID)
        JOIN Concert c USING (Concert_ID)
        JOIN Location l USING (Location_ID)
        Where r.getRefund = 'YES'
        AND u.User_ID = ?;
        <sql:param value="${User_ID}"/>
    </sql:query>
   
    <sql:query var="balance" dataSource="${it58070053_webp}">
        Select Balance From Member Where User_ID = ?;
        <sql:param value="${User_ID}"/>
    </sql:query>
    
    <c:forEach var="row" items="${balance.rows}">
        <c:set var="Balance" value="${row.Balance}"/>
    </c:forEach>
    <c:out value="${Balance}" />
        
    <%--<% String Balance = (String)session.getAttribute("BalanceS"); %>
    <%= session.getAttribute("BalanceS") %><br>--%>
    <div class="container">
        <div class="thumbnail" style="width: 70%; margin: 0 auto">
            <ul class="nav nav-tabs">
                <li><a data-toggle="tab" href="#refund">Ticket Refund</a></li>
                <li><a data-toggle="tab" href="#menu1">E-Ticket</a></li>
                <li ><a data-toggle="tab" href="#menu2">History</a></li>
                <li><a data-toggle="tab" href="#menu3">Mu Cash</a></li>
            </ul>

            <!--Start Bar-->
            <div class="tab-content"><br>
              
                <!--____________________Mu Cash ________________-->
                <div id="menu3" class="tab-pane fade">
                   <div class="container">
                        <div class="row" style="width: 200%; margin: 0 auto">
                            <div class="col-xs-12 col-sm-6 col-md-4">
                                <div class="panel-body">
                                    <div class="row" >

                                        <div class="panel panel-default class">
                                            <div class="panel-heading"><center><b>Mu Cash</b></center></div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="panel panel-info" >
                                                <div class="panel-body">
                                                    <div class="row" >
                                                        <center><b><h3>BALANCE</h3></b></center>
                                                        <center><b><h4><c:out value="${Balance}" /></h3></b></center><br>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                   </div>                    
                </div>

                <!--_____________________TICKER REFUND___________________-->
                <!-- Start Ticket Refund -->
                <%! int num1=1; %>
                <div id="refund" class="tab-pane fade">
                    <div class="panel panel-default class">
                        <div class="panel-heading"><center><b>Ticket Refund</b></center></div>
                    </div>
                    <!--CARD-->
                    <c:forEach var="row" items="${refund.rows}">
                       <%--<c:forEach var="row" items="${concert.rows}">--%>
                    <div class="container">
                        <div class="row" style="width: 100%; margin: 0 auto">
                            <div class="col-xs-12 col-sm-6 col-md-4">        
                                <div class="thumbnail">
                                    <img src="https://static1.squarespace.com/static/54a6e652e4b00f7c5fb09e89/t/580f9acaf7e0abd1f4b0c0dd/1477417686480/RobertEllis_EuroTour_V3_Thumb.jpg?format=500w" class="img-responsive">
                                    <center><h3><b><c:out value="${row.Concert_Name}"/></b></h3></center>
                                    <font size=2>
                                    <a href="#"><span class="glyphicon glyphicon-time"></span></a>&nbsp;  <c:out value="${row.Date}"/> | <c:out value="${row.Start_Time}"/><br>
                                    <a href="#"><span class="glyphicon glyphicon-map-marker"></span></a>&nbsp; <c:out value="${row.Location_Name}"/><br><br>
                                    </font>

                                    <div class="text-center" style="padding:5px;"><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#Accept" data-dismiss="modal">Get a Refund</button></div>
                                </div>
                            </div>
                        </div>        
                    </div>
                    
                    
                    <!-- Start ticket refund accept-->
                    <div class="modal fade" id="Accept" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document" style="width: 50%; margin: 0 auto">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <div class="text-center"><h4 class="modal-title" id="myModalLabel">Ticket Refund</h4></div>
                                </div>
                                <div class="modal-body">
                                    <form name="checkSeat" method="post" action="">
                                        <div class="detail">
                                            <p>
                                                สปา ริคเตอร์ เพทนาการสเปคกิฟท์อพาร์ตเมนท์ ควิกดีพาร์ตเมนต์ เวิลด์ทัวร์แอร์ ไฟลท์เทรนด์บ๊อกซ์ พงษ์พันธุวิศวกรรม สไปเดอร์โอ้ยซัพพลายเอฟเฟ็กต์ มาร์เก็ตตู้เซฟเชอร์รี่ เนอะแมนชั่นแล็บอุด้งมอบตัว สตาร์ นรีแพทย์โบกี้จตุคามธรรมาภิบาล บริกรควิก อีโรติกเซอร์ไพรส์อพาร์ตเมนต์มอยส์เจอไรเซอร์เบอร์รี แอร์โอเลี้ยงติ๋ม แพลนบัลลาสต์แพทยสภา

                                                ยิมหลินจือ ฟรุตเพาเวอร์﻿กรรมาชนปาร์ตี้ ชะโนดคอร์ปอเรชั่นแชมปิยอง สตีลตัวเองสคริปต์ แฟร์มายองเนสราสเบอร์รีรามเทพ แอปเปิ้ล ฮ็อตอัลตราหมั่นโถวแฟรี่โพสต์ ต่อรองพันธกิจ ไลน์ทัวร์แครกเกอร์เชฟแอ๊บแบ๊ว ป๋าพงษ์เพียวทัวริสต์วโรกาส ปัจฉิมนิเทศอพาร์ตเมนท์ปาสเตอร์แฟรี รามเทพอัลบั้มโอวัลติน เฟิร์มปาสคาล บริกรบลูเบอร์รีเยอร์บีราโพสต์ สมิติเวชไฟลท์ แอดมิชชั่นรามาธิบดีซีดานบูติกติงต๊อง

                                                โดนัทออเดอร์ธรรมาภิบาลเพียวต่อยอด มาร์เก็ตติ้ง วิป ตุ๊ดเซ็นเซอร์ ซิงสารขัณฑ์ทัวริสต์สหรัฐ ตุ๊กตุ๊ก หมายปองโอเปอเรเตอร์ พุทธภูมิพิซซ่า เกรดตี๋ รีดไถชัตเตอร์ช็อคชาร์ป กษัตริยาธิราชสปิริต ดีพาร์ตเมนท์สปิริต คาราโอเกะเยลลี่ ต่อยอดละอ่อนโฟล์คพันธกิจอึ๋ม หลวงตาอยุติธรรมวิกสเต็ป ดีพาร์ตเมนต์ลิสต์อพาร์ตเมนท์แซ็กสามช่า

                                                ม็อบเป็นไงเจี๊ยวอพาร์ทเมนท์ แฟรนไชส์มวลชนซาร์แกสโซฮอล์เก๋ากี้ บอร์ดบลูเบอร์รีเลกเชอร์ดีไซน์ โมเต็ลเฉิ่มรามาธิบดีอุปัทวเหตุคอร์รัปชัน เวิลด์ เวิร์กเฟอร์รี่กรอบรูป เหี่ยวย่น     ฮัลโลวีนม้งเกมส์ เจ๊ไลน์สแตนเลสสติ๊กเกอร์ ซิมโฟนี่วานิลากิมจิเฮอร์ริเคน ไวอากร้าโอเลี้ยงคัตเอาต์สวีทอพาร์ตเมนต์ ฮากกาเย้วอินดอร์ แชมปิยองโลโก้อุปทาน สหรัฐว้อดก้าแอ็คชั่นกรุ๊ปพาสปอร์ต อุเทนโหลยโท่ยโมเต็ล แอ๊บแบ๊วจอหงวนอีแต๋นแฟร์

                                                ทีวีเซ่นไหว้สหัสวรรษ รายชื่อ เลดี้คอมเพล็กซ์ ไบโอ โรลออนบอมบ์ เซอร์ไพรส์ ออสซี่ฟรุตเบนโลราชบัณฑิตยสถานสันทนาการ ซีรีส์สตูดิโอ ดีกรีแบ็กโฮอิเลียดภารตะ ด็อกเตอร์เซ็กซ์ปิยมิตรออร์แกนิกแอลมอนด์ รามเทพโฮมจอหงวนคอมเมนต์ อันตรกิริยาซ้อ เตี๊ยมแชมเปญ ชะโนด ยูโรบูมล้มเหลว สปิริต
                                            </p><br><br>
                                        </div>
                                        <center><button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#Confirm<%= num1 %>" data-dismiss="modal">Accept</button></center>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Start Confirm refund-->
                    
                    
                    <div class="modal fade" id="Confirm<%= num1 %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document" style="width: 50%; margin: 0 auto">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <div class="text-center"><h4 class="modal-title" id="myModalLabel">Ticket Refund</h4></div>
                                </div>
                                <div class="modal-body">
                                    
                                    
                                    <!--<form name="checkSeat" method="post" action="">-->
                                    <%--<c:forEach var="row" items="${refund.rows}">--%>                                 
                                        <div class="detail">
                                            <!-- Start Table Order-->
                                            <div>
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th>ประเภทบัตร</th>
                                                            <th>ราคา</th>
                                                            <th>จำนวน</th>
                                                            <th>รวม</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <td scope="row"><c:out value="${row.Zone_Name}"/></td>
                                                    <td><c:out value="${row.Price_of_Ticket}"/></td>
                                                    <c:set var="count1" value="${row.Total_Price}"/>
                                                    <c:set var="count2" value="${row.Price_of_Ticket}"/>
                                                                                            
                                                    <fmt:parseNumber var="countS" integerOnly="true" type="number" value="${count1 / count2}" />
                                                    <td><c:out value="${countS}" /></td>
                                                    <td><c:out value="${row.Total_Price}"/></td>
                                                    </tbody>
                                                    <tbody>
                                                    <td scope="row">Service Charge</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td><c:out value="${row.Service_charge}"/></td>
                                                    </tbody>              
                                                    <tbody>
                                                    <td scope="row">ราคารวม</td>
                                                    <td></td>
                                                    <td></td>
                                                    <c:set var="sum1" value="${row.Total_Price}"/>
                                                    <c:set var="sum2" value="${row.Service_charge}"/>
                                                    <fmt:formatNumber var="Sum" type="number" minFractionDigits="2" maxFractionDigits="2" value="${sum1+sum2}" />
                                                    <td><c:out value="${Sum}"/></td>
                                                    </tbody> 
                                                </table>
                                            </div>           
                                            <!-- End Table Order --> 
                                            
                                        </div>
                                    <c:set var="Order_ID" value="${row.Order_ID}"/>   
                                    <form action="BalanceServlet">
                                        <input type="hidden" name="Balance" value="${Balance}" />
                                        <input type="hidden" name="Login_ID" value="${Login_ID}" />
                                        <input type="hidden" name="Order_ID" value="${Order_ID}" />
                                        <input type="hidden" name="Sum" value="${Sum}" />
                                        <center><input type="submit" class="btn btn-primary" name="confirm" value="Confirm" ></input></center>                                    
                                        
                                    </form>
                                </div>
                            </div>
                        </div>                        
                    </div>                   
                   <% num1+=1; %> 
                </c:forEach>
                </div>
                
                
                <!-- End Ticket Refund--> 


                <!-- Start E-Ticket -->
                <div id="menu1" class="tab-pane fade">
                    <div class="container">
                        <div class="row" style="width: 200%; margin: 0 auto">
                            <div class="col-xs-12 col-sm-6 col-md-4">

                                <div class="panel-body">
                                    <div class="row" >

                                        <!--____________________E-TICKET____________________-->

                                        <div class="panel panel-default class">
                                            <div class="panel-heading"><center><b>E-TICKET</b></center></div>
                                        </div>

                                        <!--card1-->
                                <c:forEach var="row" items="${concert.rows}">
                                        <div class="col-lg-12">
                                            <div class="panel panel-info" >
                                                <div class="panel-body">
                                                    <div class="row">

                                                        <div class="col-lg-4">
                                                            <img src="https://static1.squarespace.com/static/54a6e652e4b00f7c5fb09e89/t/580f9acaf7e0abd1f4b0c0dd/1477417686480/RobertEllis_EuroTour_V3_Thumb.jpg?format=500w" class="img-responsive">
                                                        </div>
                                                        <div class="col-lg-4 text-left">
                                                            <h5><b><c:out value="${row.Concert_Name}"/></b></h5>
                                                            <b><font size=2>
                                                                <c:out value="${row.Zone_Name}"/><br>
                                                                <c:set var="sum1" value="${row.Total_Price}"/>
                                                                <c:set var="sum2" value="${row.Service_charge}"/>
                                                                <fmt:formatNumber var="Sum" type="number" minFractionDigits="2" maxFractionDigits="2" value="${sum1+sum2}" />
                                                                ฿ <c:out value="${Sum}"/><br>
                                                                <c:out value="${row.Fname}"/> <c:out value="${row.Lname}"/><br>
                                                                REF# <c:out value="${row.Order_ID}"/>
                                                                
                                                                </font></b>
                                                            <br>
                                                            <font size=2>
                                                            <a href="#"><span class="glyphicon glyphicon-time"></span></a>&nbsp;  <c:out value="${row.Date}"/> | <c:out value="${row.Start_Time}"/><br>
                                                            <a href="#"><span class="glyphicon glyphicon-map-marker"></span></a>&nbsp; <c:out value="${row.Location_Name}"/><br>
                                                            </font>
                                                        </div>
                                                        <div class="col-lg-4">
                                                            <center><img src="https://www.fullidentity.com/wp-content/uploads/2015/10/qrcode.png" style="width:160px;height:160px;"></center><br>
                                                            <center><button type="button" class="btn btn-secondary btn-sm"style="width: 75%">PRINT</button></center>
                                                        </div>
                                                    </div>
                                                </div> <!-- /.panel-body-->
                                            </div> <!-- /.panel panel-info-->
                                        </div> <!-- /.End card1-->
                                </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Start History -->
                <div id="menu2" class="tab-pane fade in active">
                    <div class="container">
                        <div class="row" style="width: 200%; margin: 0 auto">
                            <div class="col-xs-12 col-sm-6 col-md-4">
                                <div class="panel-body">
                                    <div class="row ">
                                
                                        
                                     <!--____________________________HISTORY___________________________-->
                                    
                                        <div class="panel panel-default class">
                                            <div class="panel-heading"><center><b>HISTORY</b></center></div>
                                        </div>

                                        <!--___Concert1 ___-->
                                        <%! int num=1; %>
                                        <c:forEach var="row" items="${concert.rows}">
                                
                                        <div class="col-lg-12">
                                            <div class="panel panel-info" >
                                                <div class="panel-body">
                                                    <div class="row" >

                                                        <div class="col-lg-6">
                                                            <div class="col-lg-6" align="left"><img src="http://assets.gcstatic.com/u/apps/asset_manager/uploaded/2015/28/little-mix-the-get-weird-tour-2016-1437155664-custom-0.png" style="width:280px;height:280px;"></div>
                                                        </div>
                                                        <div class="col-lg-6 text-left">
                                                            <h3><c:out value="${row.Concert_Name}"/></h3><br>
                                                            <a href="#"><span class="glyphicon glyphicon-time"></span></a>&nbsp; <c:out value="${row.Date}"/> | <c:out value="${row.Start_Time}"/><br>
                                                            <a href="#"><span class="glyphicon glyphicon-map-marker"></span></a>&nbsp; <c:out value="${row.Location_Name}"/><br>
                                                            <br>
                                                            <center><button type="button" class="btn btn-secondary btn-lg"style="width: 80%">PRINT</button></center><br>
                                                        </div>
                                                        <div class="col-lg-6 text-right">
                                                            <button type="button" class="btn btn-link" data-toggle="collapse" data-parent="#accordion" href="#collapse<%= num %>">More Detail <i class="fa fa-angle-down" style="font-size:18px"></i></button>
                                                        </div>
                                                    </div>

                                                    <br>

                                                    <div class="panel-group" id="accordion">
                                                        <div class="panel panel-info">
                                                            <div id="collapse<%= num %>" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                    <div class="col-lg-6 text-left">
                                                                        <h5><b>Order #<c:out value="${row.Order_ID}"/></b></h5>
                                                                        <h5><b><c:out value="${row.Concert_Name}"/></b></h5><br>
                                                                        Status: <button type="button" class="btn btn-success btn-sm"><c:out value="${row.Order_Status}"/></button><br><br>
                                                                        
                                                                    </div>
                                                                    <div class="col-lg-6 text-left">
                                                                        <b>Buyer: </b>&nbsp; <c:out value="${row.Fname}"/> <c:out value="${row.Lname}"/><br>
                                                                        <b>Email: </b>&nbsp; <c:out value="${row.Email}"/><br>
                                                                        <b>Payment via: </b>&nbsp; <c:out value="${row.Payment_method}"/><br>
                                                                        <b>Ordered At:</b> <c:out value="${row.Order_date}"/><br><br>
                                                                    </div>

                                                                    <!--TABLE-->
                                                                    <div class="row">
                                                                        <div class="col-lg-12"><hr width=100%> <!--Horizontal rule-->
                                                                            <h5>&nbsp;&nbsp;&nbsp;  Order Details</h5>
                                                                            <div class="table-responsive">
                                                                                <table class="table table-bordered table-hover">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th><center>Ticket Type</center></th>
                                                                                    <th><center>Price</center></th>
                                                                                    <th><center>Quantity</center></th>
                                                                                    <th><center>Subtotal</center></th>
                                                                                    </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        
                                                                                        <c:set var="Order_ID" value="${row.Order_ID}"/>
                                                                                        
                                                                                        
                                                                                        <tr align="center">
                                                                                            <td><c:out value="${row.Zone_Name}"/></td>
                                                                                            <td><c:out value="${row.Price_of_Ticket}"/></td>
                                                                                            
                                                                                            <c:set var="count1" value="${row.Total_Price}"/>
                                                                                            <c:set var="count2" value="${row.Price_of_Ticket}"/>
                                                                                            
                                                                                            <fmt:parseNumber var="countS" integerOnly="true" type="number" value="${count1 / count2}" />
                                                                                            <td><c:out value="${countS}" /></td>
                                                                                            <td><c:out value="${row.Total_Price}"/></td>
                                                                                        </tr>
                                                                                        <tr align="center">
                                                                                            <td>Service Charge</td>
                                                                                            <td></td>
                                                                                            <td></td>
                                                                                            <td><c:out value="${row.Service_charge}"/></td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                        <c:set var="sum1" value="${row.Total_Price}"/>
                                                                        <c:set var="sum2" value="${row.Service_charge}"/>
                                                                        <fmt:formatNumber var="sum3" type="number" minFractionDigits="2" maxFractionDigits="2" value="${sum1+sum2}" />
                                                                        <div class="col-lg-12 text-right"> Order total : &nbsp;<b><c:out value="${sum3}"/></b></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div> <!-- /.panel-body-->
                                            </div> <!-- /.panel panel-info-->
                                        </div> <!-- /.End Concert1-->
                                        <% num+=1; %>
                                    </c:forEach>
                                
                                    </div> <!-- /.row -->
                                </div> <!-- /.panel-body -->
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.container-->
                </div><!-- Fisish div history -->

            </div><!-- tab-content -->
        </div><!-- Fisish thumbnail -->
    </div><!-- Fisish container -->

    <div style="margin-bottom:3%;"></div>

    <!-- Footer -->
    <footer style="background-color:rgba(255,255,255,0.1);">
        <div class="row">
            <div class="container ">
                <div class="col-lg-3 col-md-6" style="padding: 85px 0; text-align:center;">
                    <a href="WhatMem.html" style="text-decoration: none"><h3><font color="white">What is Muzikal</font></h3></a>
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
