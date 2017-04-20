<%-- 
    Document   : Article
    Created on : Apr 15, 2017, 4:30:30 PM
    Author     : MENSAUSER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title><%= request.getAttribute("conName") %></title>

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
        <nav class="navbar navbar-custom navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-brand" style="width:10%;">
                    <a class="navbar-header" href="index.html">
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
                    <button class="btn btn-custom navbar-btn" data-toggle="modal" data-target="#SignUp"> Sign up</button>
                    <button class="btn btn-custom navbar-btn" data-toggle="modal" data-target="#SignIn"> Sign in</button>
                </ul>
            </div>
        </nav>

        <!-- Modal Sign in -->
        <div class="modal fade" id="SignIn" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <div class="text-center"><h4 class="modal-title" id="myModalLabel">Sign in</h4></div>
                    </div>
                    <div class="modal-body">
                        <form name="singIn" method="post" action="">
                            Username: <input type="text" name="username"><br><br>
                            Password: <input type="password" name="password"><br><br>
                            <center><button type="submit" class="btn btn-primary">Sign in</button></center>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <div  class="text-center">
                            <a href="#" data-toggle="modal" data-target="#Forget" data-dismiss="modal">Forget password?</a>
                            | Not a member?
                            <a href="#" data-toggle="modal" data-target="#SignUp" data-dismiss="modal">Sign up</a>
                        </div></div>

                </div>
            </div>
        </div>

        <!--End Sing in-->

        <!--Modal SignUp-->
        <div class="modal fade" id="SignUp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <div class="text-center"><h4 class="modal-title" id="myModalLabel">Sign Up</h4></div>
                    </div>
                    <div class="row"><span>
                            <div class="modal-body">
                                <center>

                                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#SignUpMem" data-dismiss="modal">Sign up for Member</button>
                                    <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#SignUpOrg" data-dismiss="modal">Sign up for Organizer</button>
                                </center>

                            </div>
                        </span>
                    </div>

                    <div class="modal-footer">
                        <div class="text-center">
                            <a href="#" data-toggle="modal" data-target="#SignIn" data-dismiss="modal">Sign in</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--end Modal Sign up-->

        <!-- Modal Sign Up for Member -->
        <div class="modal fade" id="SignUpMem" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <div class="text-center"><h4 class="modal-title" id="myModalLabel">Sign up for Member</h4></div>
                    </div>
                    <div class="modal-body">
                        <form name="singIn" method="post" action="">
                            <i>*Username</i><br> <input type="text" name="username" size="30"><br><br>
                            <i>*Password</i><br> <input type="password" name="password" size="30"><br><br>
                            <i>*First Name</i><br> <input type="text" name="fname" size="30"><br><br>
                            <i>*Last Name</i><br> <input type="text" name="lname" size="30"><br><br>
                            <i>*Email</i><br> <input type="text" name="email" size="30"><br><br>
                            <i>Phone</i><br> <input type="text" name="email" size="30"><br><br>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <div  class="text-center">

                            <a href="#" data-toggle="modal" data-target="#SignUp" data-dismiss="modal">Back</a>
                            <button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-dismiss="modal"> Confirm </button>
                        </div></div>

                </div>
            </div>
        </div>

        <!-- Modal Sign Up for Organizer -->
        <div class="modal fade" id="SignUpOrg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <div class="text-center"><h4 class="modal-title" id="myModalLabel">Sign up for Organizer</h4></div>
                    </div>
                    <div class="modal-body">
                        <form name="singIn" method="post" action="">
                            <i>*Username</i><br> <input type="text" name="username" size="30"><br><br>
                            <i>*Password</i><br> <input type="password" name="password" size="30"><br><br>
                            <i>*First Name</i><br> <input type="text" name="fname" size="30"><br><br>
                            <i>*Last Name</i><br> <input type="text" name="lname" size="30"><br><br>
                            <i>*Email</i><br> <input type="text" name="email" size="30"><br><br>
                            <i>Phone</i><br> <input type="text" name="email" size="30"><br><br>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <div  class="text-center">

                            <a href="#" data-toggle="modal" data-target="#SignUp" data-dismiss="modal">Back</a>
                            <button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-dismiss="modal"> Confirm </button>
                        </div></div>

                </div>
            </div>
        </div>

        <!-- Modal forgetpassword -->
        <div class="modal fade" id="Forget" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <div class="text-center"><h4 class="modal-title" id="myModalLabel">Forget Password</h4></div>
                    </div>
                    <div class="modal-body">
                        <center>Please fill your email</center><br>
                        <div style="text-align:center;"><form name="forgetpw" method="post" action="">
                                Email: <input type="text" name="email" style="margin-right:5%;"></div><br>
                                <center><button type="submit" class="btn btn-primary">Submit</button></center>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <div  class="text-center">
                            </div></div>

                    </div>
                </div>
            </div>

            <div style="margin-top:2%;"></div>
            <!-- Start Poster concert-->
            <div class="container">
                <div class="row" style="width: 70%; margin: 0 auto">
                    <div class="col-xs-12">        
                        <div class="thumbnail">
                            <img src="<%= request.getAttribute("conPic") %>" class="img-responsive">
                            <div class="text"><h3><%= request.getAttribute("conName") %></h3></div>
                            <span class="glyphicon glyphicon-time"></span></a> <%= request.getAttribute("conSDate") %> - <%= request.getAttribute("conEDate") %>  | <%= request.getAttribute("conSTime") %> - <%= request.getAttribute("conETime") %><br>
                            <!--Start create map-->         
                            <span class="glyphicon glyphicon-map-marker"></span><span> <%= request.getAttribute("conLoc") %>  </span><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true" data-toggle="collapse" data-target="#demo"></span>
                            <div id="demo" class="collapse">
                                <%= request.getAttribute("conMap") %>
                            </div><br>
                            <!--End create map-->
                            <div class="text-right" style="padding:5px;">
                                <a class="btn page-scroll btn-danger" id="top-buy-tickets-btn" data-scroll="true" href="#buy">Buy Ticket</a>
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
                    <%= request.getAttribute("conTent") %>
                    </div>
                </div>  
            </div>        
        </div>
        <!-- End Detail -->

        <!--Start choose ticket-->
        <div class="container" id="buy">
            <div class="row" style="width: 70%; margin: 0 auto">
                <div class="col-xs-12">        
                    <div class="thumbnail">
                        <center><h3><b>Ticket</b></h3></center>
                        <hr size="10" width="100%"><br>
                        <h4><b><%= request.getAttribute("conName") %></b></h4>
                        <!-- Dropdown Showtime -->
                        <b>Show time</b><br>
                        <div class="row">
                            <div class="form-group col-sm-4">
                                <select class="form-control" id="show" style="float:left;">
                                    <option>Day/Month/Year Time xx.xx - xx.xx</option>
                                    <option>Day/Month/Year Time xx.xx - xx.xx</option>
                                    <option>Day/Month/Year Time xx.xx - xx.xx</option>
                                </select>
                            </div></div>
                        <!-- Dropdown Zone -->
                        <b>Zone</b><br>
                            <div class="row">
                                <div class="form-group col-sm-4">
                                    <select class="form-control" id="zone" style="float:left;">
                                        <option>Zone A</option>
                                        <option>Zone B</option>
                                        <option>Zone C</option>
                                    </select>
                                </div>
                            </div>
                        <!-- Start drop down -->
                            <div class="form-group">
                                Price: ฿250
                                <select class="form-control" id="sel1" style="float:right;">
                                    <option>0</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                </select>
                            </div>
                        <!--End drop down -->
                        <br><hr size="10" width="100%"><br>
                        <!-- End drop up -->
                        <p align="right">
                            <a href="BuyTicket.html"><button type="button" class="btn btn-danger">Buy Ticket</button></p></a>

                    </div>        
                </div>  
            </div>        
        </div>
        <!--End choose ticket-->

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
