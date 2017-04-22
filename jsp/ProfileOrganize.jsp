<%-- 
    Document   : ProfileOrganize
    Created on : Apr 16, 2017, 9:45:02 AM
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
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>My Profile</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
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
            select Contact_person.User_ID , User.Fname , User.Lname , User.Email , Contact_person.Phone_number from User JOIN Contact_person Using (User_ID) Where User_ID = ?;
            <sql:param value="${Login_ID}"/>
        </sql:query>

        <!-- Start product-->
        <form class="form-horizontal" action="SaveProfileServlet" enctype="multipart/form-data" method="POST">
            <c:forEach var="row" items="${user.rows}">
                <div class="container">
                    <div class="row" style="width: 80%; margin: 0 auto">
                        <div><center><H1><font color="white">MY PROFILE</font></H1></center></div><br>
                        <div class="col-xs-12 col-sm-6 col-md-4">        
                            <div class="thumbnail">

                                <div id="userphoto">

                                    <!--INSERT PICTURE-->
                                    <div id="userphoto">
                                        <div class="gravatar-wrapper-128"><img id="image" src="${row.Profile_img}" alt="" class="img-circle" width="260" height="250"></div>
                                        <div class="change-picture-slide" style="top: 30px;">
                                            <input accept="image/*" type="file" id="upload" name="upload" onchange="readURL(this);" style="visibility: hidden;" />
                                            <a href="" onclick="changePicture(); return false"><center><input class="btn btn-primary btn-block" type="button" value="Change Picture" /></center></a>
                                        </div>
                                    </div>
                                </div>
                                <script>
                                    function changePicture() {
                                        //open the open file dialog
                                        document.getElementById('upload').click();
                                        var link = document.getElementById('upload').url;
                                        //change picture
                                        var img = document.getElementById("image");
                                        img.src = link;
                                    }
                                </script>

                                <script>
                                    function changePicture() {
                                        $('#upload').click();
                                    }
                                    function readURL(input)
                                    {
                                        if (input.files && input.files[0])
                                        {
                                            var reader = new FileReader();
                                            reader.onload = function (e)
                                            {
                                                $('#image')
                                                        .attr('src', e.target.result);

                                            };
                                            reader.readAsDataURL(input.files[0]);
                                        }
                                    }
                                </script>
                                <!--End INSERT PICTURE-->

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-8">


                            <c:forEach var="row" items="${user.rows}">                   

                                <form class="form-horizontal" action="SaveProfileServlet">
                                    <br>
                                    <br>
                                    <div class="form-group">
                                        <label for="lname" class="col-sm-2 control-label"><font color="white">ชื่อ</font></label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="name" name="Fname" value="${row.Fname}" placeholder="firstname">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="lname" class="col-sm-2 control-label"><font color="white">นามสกุล</font></label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="lastname" name="Lname" value="${row.Lname}" placeholder="lastname">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="lname" class="col-sm-2 control-label"><font color="white">E-mail</font></label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="email" name="Email" value="${row.Email}" placeholder="email">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="lname" class="col-sm-2 control-label"><font color="white">Phone</font></label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="phone" name="Phone_number" value="${row.Phone_number}" placeholder="phone">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10"><center>
                                                <button type="submit" name="save" value="Organize"class="btn btn-danger">Save</button></center>
                                        </div>
                                    </div>
                                </form>
                            </c:forEach>
                        </div>
                    </div>        
                </div>
            </c:forEach>
        <!-- End product -->



        <!-- Footer -->
        <footer style="background-color:rgba(255,255,255,0.1);">
            <div class="row">
                <div class="container ">
                    <div class="col-lg-3 col-md-6" style="padding: 85px 0; text-align:center;">
                        <a href="WhatOrg.html" style="text-decoration: none"><h3><font color="white">What is Muzikal</font></h3></a>
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
