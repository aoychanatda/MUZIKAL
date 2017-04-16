<%-- 
    Document   : BuyTicket
    Created on : Apr 15, 2017, 11:35:47 AM
    Author     : jirpinya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Concert's Name</title>

        <!-- Bootstrap -->

        <link href="css/bootstrap.css" rel="stylesheet">    
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Kanit" rel="stylesheet">

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
                    <a class="navbar-header" href="#">
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
                            <li><a href="#" style="color:white;">My Profile</a></li>
                            <li><a href="#" style="color:white;">My Ticket</a></li>
                            <li><a href="#" style="color:white;">Sign out</a></li>
                        </ul>
                    </div>
                </ul>
            </div>
        </nav>

        <!-- Start Poster concert-->
        <div style="margin-top: 2%"></div>
        <div class="container">
            <div class="row" style="width: 70%; margin: 0 auto">
                <div class="col-xs-12">        
                    <div class="thumbnail">
                        <img src="img/dek.JPG" class="img-responsive">
                        <div class="text"><h4>Dek Sai Silp #Bangkok</h4></div>
                        <!--Start create map-->         
                        <span>สนามกีฬา จรัญ บุรพรัตน์ กรุงเทพมหานคร ประเทศไทย  </span><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true" data-toggle="collapse" data-target="#demo"></span>
                        <div id="demo" class="collapse">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3871.807477148134!2d100.55236929999997!3d13.970062300000006!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30e2815dad1aaaab%3A0xf0e449779da55126!2zSnVuZ2xlIFdhdGVyIFBhcmsg4Lib4LiX4Li44Lih4LiY4Liy4LiZ4Li1!5e0!3m2!1sth!2sth!4v1489800873155" width="100%" height="400" frameborder="0" style="border:0" allowfullscreen></iframe>
                        </div><br>
                        <!--End create map-->
                        <br>        
                    </div>
                </div>        
            </div>  
        </div>        
    </div>
    <!--End Poster concert-->  

    <!-- Start Detail -->
    <div class="container">
        <div class="row" style="width: 70%; margin: 0 auto">
            <div class="col-xs-12">        
                <div class="thumbnail">
                    <div class="panel panel-danger">
                        <div class="panel-heading"> 
                            <center><h3 class="panel-title">กำลังทำรายการ</h3></center> 
                        </div>
                        <div class="panel-body"> 
                            *****นับถอยหลัง 15 นาที*****
                        </div>
                    </div>

                    <center><br><h3>คำสั่งซื้อ #รหัสคอน-XXXXXX</h3></center>

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
                            <td scope="row">Pre sale</td>
                            <td>590</td>
                            <td>1</td>
                            <td>590</td>
                            </tbody>
                            <tbody>
                            <td scope="row">Service Charge 7%</td>
                            <td>26</td>
                            <td>1</td>
                            <td>26</td>
                            </tbody>              
                            <tbody>
                            <td scope="row">ราคารวม</td>
                            <td></td>
                            <td></td>
                            <td>616</td>
                            </tbody> 
                        </table>
                    </div>           
                    <!-- End Table Order -->

                    <!-- Start Data form-->

                    <hr size="10" width="100%"><br>

                    <!--End data form-->

                    <!--Start Choose how to pay-->
                    <form name="PaymentServlet" method="post" action="PaymentServlet">
                        <br><center><h3>การชำระเงิน</h3></center>
                        <ul class="nav nav-pills center-pills">
                            <li class="active"><a data-toggle="tab" href="#credit">บัตรเครดิต</a></li>
                            <li><a data-toggle="tab" href="#m-cash" <% session.setAttribute("btype", "mcash"); %>>บัตร M Cash</a></li>
                            <li><a data-toggle="tab" href="#payment" <% session.setAttribute("btype", "bill");%>>ชำระเงินผ่านบิล</a></li>
                        </ul>


                        <div class="tab-content">
                            <div  name="tab-content" value="credit" id="credit" class="tab-pane fade in active text-center">
                                <h4>Credit Card</h4>
                                <p class="center">
                                    <img src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR2Xd5f1oS_DBadc3RHGHK4NlkPs5RwLDBUipDf82CvNm4g7odhitAoyls" width="300" height="300"><br>

                                <div class="row">
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-4">
                                        <i>*หมายเลขบัตรเครดิต (Card Number) </i><br><br><br>
                                        <i>*ชื่อผู้ถือบัตร (Card Name) </i><br><br><br>
                                        <i>*วันหมดอายุ (Card Expiry Date) </i> <br><br><br>
                                        <i>*CVV </i><br><br>
                                    </div>
                                    <div class="col-xs-4">
                                        <input class="form-control" type="text" name="fname" placeholder="........" size="30"><br>
                                        <input class="form-control" type="text" name="fname" placeholder="Card Holder's Name" size="30"><br>
                                        <input class="form-control" type="text" name="fname" placeholder="MM / YY" size="30"><br>
                                        <input class="form-control" type="password" name="fname" placeholder="...." size="4"><br>
                                    </div>

                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-body">*ค่าบริการบัตรเครดิตจำนวน ฿49.69<br><hr>
                                        ราคารวมทั้งสิ้น: ฿1,551.34</div>
                                </div>
                                <input type="radio" name="method" value="credit" checked="checked"/> ยืนยันการใช้บัตรเครดิต


                            </div>

                            <div name="tab-content" value="m-cash" id="m-cash" class="tab-pane fade text-center">
                                <h4>M Cash</h4>
                                <!-- Left-aligned -->
                                <div class="media text-left">
                                    <div class="media-left col-xs-2">
                                        <img src="http://image.dek-d.com/27/0298/3146/117914812" alt="..." class="media-object img-rounded" style="width:100px">
                                    </div>
                                    <div class="media-body">
                                        <h4 class="media-heading">Kim Taeyeon</h4>
                                        <p>หมายเลขบัตร: 1111111</p>
                                    </div>
                                </div><br>
                                <div class="panel panel-default">
                                    <div class="panel-body"><hr>
                                        ราคารวมทั้งสิ้น: ฿1,501.65</div>
                                </div>
                                <input type="radio" name="method" value="mcash" /> ยืนยันการใช้ Mcash
                            </div>


                            <div name="tab-content" value="payment" id="payment" class="tab-pane fade text-center">
                                <h4>Payment</h4><br>
                                <div class="text-left">
                                    * กรุณาชำระเงินภายใน 4 ชั่วโมง มิเช่นนั้นคำสั่งซื้อนี้จะหมดอายุ<br>
                                    * หลังจากที่คุณทำการชำระเงินที่เคาน์เตอร์ต่างๆ / ตู้เอทีเอ็มแล้ว คำสั่งซื้อของคุณจะเสร็จสิ้นภายใน 1 วันทำการ<br>
                                    * เคาน์เตอร์ต่างๆ / ตู้เอทีเอ็ม สามารถชำระค่าบริการได้สูงสุด 30,000 บาท<br>
                                    * ในกรณีที่ชำระหลังวันหมดอายุ หรือจำนวนเงินไม่ถูกต้อง บริษัท อีเว้นท์ ป็อป จำกัด ขอสงวนสิทธิ์ในการคืนเงินและค่าธรรมเนียม</p><br></div>
                                <div class="panel panel-default ">
                                    <div class="panel-body">*ค่าบริการชำระเงินผ่านบิลจำนวน ฿62.61<br><hr>
                                        ราคารวมทั้งสิ้น: ฿1,564.26</div>
                                </div>
                                <input type="radio" name="method" value="bill" /> ยืนยันการจ่ายเงินผ่าน Bill payment

                            </div>
                            
                            
                            <input type="radio" name="refund" value="YES" checked="checked"/>  ใช้บริการ Tickets refund
                            <input type="radio" name="refund" value="NO" /> ไม่ใช้ใช้บริการ Tickets refund
                            
                            <hr>
                            <div class="panel panel-default">
                                <div class="panel-heading">ข้อตกลงการทำรายการ</div>
                                <div class="panel-body">หากท่านได้ชำระค่าสินค้า หรือค่าบริการเรียบร้อยแล้ว โดยเราได้ทำการสำรองที่นั่ง หรือสินค้าให้แก่ท่านแล้ว ในกรณีที่ท่านมิได้เข้าชมการแสดง หรือมิได้มารับบัตรภายในเวลาที่กำหนด เราขอสงวนสิทธิ์ในการคืนเงินให้แก่ท่าน ไม่ว่ากรณีใดก็ตาม</div>
                            </div>
                        </div><br>
                        <!--End-->

                        <!--Start button confirm & cancel-->

                        <div class="col-ts-12 col-xs-6 text-left hidden-ts">
                            <input class="btn btn-default" id="cancel" type="submit" name="btn" value="Cancel"/>
                        </div>


                        <div class="col-ts-12 col-xs-6 text-right">
                            <input class="btn btn-success" id="confirm" type="submit" name="btn" value="Confirm"/>

                        </div>
                    </form>
                    <br><br>
                    </p>
                    <!--End button confirm & cancel-->

                </div>   

            </div>  
        </div>        
    </div>
    <!-- End Detail -->


    <!-- Footer -->
    <footer style="background-color:rgba(255,255,255,0.1);">
        <div class="row">
            <div class="container ">
                <div class="col-lg-3 col-md-6" style="padding: 85px 0; text-align:center;">
                    <a href="#" style="text-decoration: none"><h3><font color="white">What is Muzikal</font></h3></a>
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

                </body>
                </html>
