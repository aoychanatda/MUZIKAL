<%-- 
    Document   : forms
    Created on : Apr 16, 2017, 11:52:40 AM
    Author     : jirpinya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Concert Request Form</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">

    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
                      <li><a href="ProfileOrg.html" style="color:white;">My Profile</a></li>
                      <li><a href="AllDashboard.html" style="color:white;">DashBoard</a></li>
                      <li><a href="index.html" style="color:white;">Sign out</a></li>
                    </ul>
                  </div>
                  </ul>
                </div>
            </nav><br>

            <!--LEFT MENU-->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav"><br>

                    <!--Dashboard(Dropdown)-->
                    <li class="active">
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-dashboard"></i> Dashboard </a>
                        <ul id="demo" class="collapse">
                            <li><a href="AllDashboard.html">Dashboard Overview</a></li>
                            <li><a href="Dashboard concert.html">Concert1</a></li>
                            <li><a href="Dashboard concert.html">Concert2</a></li>
                        </ul>
                    </li>

                    <!--Forms-->
                    <li><a href="forms.html"><i class="fa fa-fw fa-edit"></i> Forms</a></li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <!--___________________________________________CONTENT___________________________________________-->
       

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Concert Request Form
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="AllDashboard.html">Dashboard Overview</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Concert Request Form
                            </li>
                        </ol>
                    </div>
                </div>
                
                <!-- /.row -->
                                      <form name="RequestConcertServlet" method="post" action="RequestConcertServlet">
                <div id="concert-request-form">
                <div class="row">
                  <div class="col-sm-8">
                  <p>Concert's name: <input type="text" class="form-control" name="concert_name"></div></div>
                  <div class="row">
                    <div class="col-sm-4">
                        <p>Starts Date: <input type="text" class="form-control" name="s_date" placeholder="Day Month Year">
                        <p>Starts Time: <input type="text" class="form-control" name="s_time" placeholder="xx:xx AM/PM">
                    </div>
                      <div class="col-sm-4">
                        <p>Ends Date: <input type="text" class="form-control" name="e_date" placeholder="Day Month Year">
                        <p>Ends Time: <input type="text" class="form-control" name="e_time" placeholder="xx:xx AM/PM">
                      </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-4">
                        <p>Location: <input type="text" class="form-control" name="location">
                    </div>
                      <div class="col-sm-4">
                        <p>Concert's Hall name: <input type="text" class="form-control" name="hall">
                      </div>
                  </div>


                  <!-- Browse Cover-->
                  <div id="Cover" class="form-group">
                    <h4><label for="exampleInputFile">Browse Cover Image</label></h4>
                    <input type="file" id="exampleInputFile" >
                    <p class="help-block">Allow only size 851*400 px.</p>
                  </div>
                  <!--Browse Poster -->
                  <div id="Poster" class="form-group">
                    <h4><label for="exampleInputFile">Browse Poster</label></h4>
                    <input type="file" id="exampleInputFile">
                    <p class="help-block">Allow only size 612*612 px.</p>
                  </div>

                  <!-- Ticket -->
                  <h4><b>Manage Ticket</b></h4>
                  <div class="input_fields_wrap">
                    <b>Add Show time</b> <a class="btn btn-success glyphicons glyphicon-plus add_field_button"></a> <br>

                    <div class="well input_fields_wrap1">
                      <div class="row">
                        <div class="col-sm-3">Date: <input type="text" class="form-control" name="date[]"></div>
                      </div>
                    </div>
                  <p><b>Add Zone</b> <a class="btn btn-success glyphicons glyphicon-plus add_field_button1"></a>
                      <div class="well input_fields_wrap2">
                        <div class="row">
                         <div class="col-sm-3">
                          <p>Zone Name: <input type="text" class="form-control" name="zoneName[]">
                          <p>Number of seats: <input type="text" class="form-control" name="numOfview[]">
                          <p>Price: <input type="text" class="form-control" name="price[]">
                        </div>
                      </div>
                  </div>

                <script>
                    $(document).ready(function() {
                        var max_fields        = 10; //maximum input boxes allowed
                        var wrapper           = ".input_fields_wrap"; //Fields wrapper
                        var showtime_wrapper  = ".input_fields_wrap1"; //Showtime wrapper
                        var zone_wrapper      = ".input_fields_wrap2"; //Zone wrapper
                        var addShowtime       = ".add_field_button"; //Add showtime button
                        var addZone           = ".add_field_button1"; //Add zone button
                        var removeField       = ".remove_field"; //Remove button
                        var x = 1; //initlal text box count
                        $(wrapper).on("click", addShowtime, function(e) { // (Showtime) add Showtime on click
                            e.preventDefault();
                            if(x < max_fields){ //max input box allowed
                                x++; //text box increment
                                $(this).closest(wrapper).append('<div class="well input_fields_wrap1"><a href="#" class="btn btn-danger remove_field" style="float:right;"><i class="glyphicon glyphicon-remove"></i></a><div class="row"><div class="col-sm-3">Date: <input type="text" class="form-control" name="date[]"></div></div></div></div>'); //add input box
                            }
                        });
                        $(wrapper).on("click", addZone, function(e) { // (Zone) add zone on click
                            e.preventDefault();
                            if(x < max_fields){ //max input box allowed
                                x++; //text box increment
                                $(this).closest(wrapper).append('<div class="well input_fields_wrap2"><a href="#" class="btn btn-danger remove_field" style="float:right;"><i class="glyphicon glyphicon-remove"></i></a><div class="row"><div class="col-sm-3"><p>Zone Name: <input type="text" class="form-control" name="zoneName[]"><p>Number of seats: <input type="text" class="form-control" name="numOfview[]"><p>Price: <input type="text" class="form-control" name="price[]"></div></div></div>'); //add input box
                            }
                        });
                        $(wrapper).on("click", removeField, function(e) { //user click on remove text
                            e.preventDefault();
                            $(this).closest('div').remove(); // Remove cloest parent (Zone or Showtime)
                            x--;
                        });
                    });
                  </script>

                  
                  
                
                </div>

                    <div class="col-lg-12">
                        <form role="form" method="post" action="RequestConcertServlet">
                            <center><button type="submit" class="btn btn-danger" >Send Request</button></center><br><br>
                        </form>
                    </div>
                </div>
                                                                    </form>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>