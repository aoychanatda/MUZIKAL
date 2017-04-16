<%-- 
    Document   : summernote
    Created on : Apr 16, 2017, 11:48:07 AM
    Author     : jirpinya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">


        <title>Create Artical</title>

        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">

        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
        <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/sb-admin.css" rel="stylesheet">
        <link href="css/plugins/morris.css" rel="stylesheet">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="wrapper2">
            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <!--NAV BAR -->
                <body class="colorful3">
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
                                        <li><a href="ProfileAd.html" style="color:white;">My Profile</a></li>
                                        <li><a href="Adminpanel.html" style="color:white;">My Article</a></li>
                                        <li><a href="index.html" style="color:white;">Sign out</a></li>
                                    </ul>
                                </div>
                            </ul>
                        </div>
                    </nav><br>



                    <!--LEFT MENU-->
                    <div class="collapse navbar-collapse navbar-ex1-collapse">
                        <ul class="nav navbar-nav side-nav"><br>

                            <!--Menu-->
                            <li class="active">
                            <li><a href="Adminpanel.html"><i class="fa fa-fw fa-book"></i> All Article</a></li>
                            <li><a href="allre.html"><i class="fa fa-fw fa-envelope"></i> Concert Request</a></li>

                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
            </nav>
            <div id="page-wrapper">
                
                <form name="summernoteServlet" method="post" action="summernoteServlet"  id="myForm">
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="row">
                            <div class="col-lg-12">
                                <h1 class="page-header">
                                    <i class="fa fa-edit"></i> Create Article
                                </h1>
                                <ol class="breadcrumb">
                                    <li>
                                        <i class="fa fa-book"></i>  <a href="Adminpanel.html">All Article</a>
                                    </li>
                                    <li class="active">
                                        <i class="fa fa-edit"></i> Create Article
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <!-- /.row -->


                        <!-- ************ Main Create Artical ************* -->
                        <!-- Concert's Name -->
                        <h4><b>Choose Concert's Name</b></h4>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-4">
                                    <select class="form-control" id="conname">
                                        <option>Bangsaen Water Festival 2017</option>
                                        <option>Halfmoonfestival</option>
                                        <option>SONGKRAN SPLASH AWAY POOL PARTY 2017</option>
                                    </select>
                                </div>
                            </div>
                        </div>  
                        <!-- Map input -->
                        <h4><b>Location Map Code</b></h4> <input type="text" class="form-control" name="MAP" placeholder="code<html>">
                        <p class="help-block">https://www.google.co.th/maps</p>

                        <!-- Summernote (Write Content) -->
                        <h4><b>Write a content</b></h4>

                        <div id="summernote">
                        </div>
                        <script>
                            $(document).ready(function () {
                                $('#summernote').summernote({
                                    height: 300, // set editor height
                                    minHeight: null, // set minimum height of editor
                                    maxHeight: null, // set maximum height of editor
                                    focus: true                  // set focus to editable area after initializing summernote
                                });
                                $('#myForm').submit(function () {
                                    $('textarea[name=summerNoteText]').val($('#summernote').summernote('code'));
                                });
                            });
                        </script>
                        
                        <textarea name="summerNoteText" style="display:none;"></textarea>

                        <!-- Button Save & View -->
                        <div class=".col-md-3 .col-md-offset-3 text-right">
                            <input class="btn btn-info" id="confirm" type="submit" name="btn" value="Save"/>
                            <input class="btn btn-success" id="confirm" type="submit" name="btn" value="ViewArtical"/>
                        </div>
                        
                    </div>
                </form>
                </body>
                </html>
