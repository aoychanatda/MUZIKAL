<%-- 
    Document   : navbarguest
    Created on : Apr 13, 2017, 7:53:32 PM
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
      <!-- GUEST-->
      <!-- Start Modal Sign In -->
      <div class="modal fade" id="SignIn" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <div class="text-center"><h4 class="modal-title" id="myModalLabel">Sign in</h4></div>
                  </div>
                  <div class="modal-body">
                      <form name="signIn" method="post" action="SignInServlet">
                          Username: <input type="text" name="usernameIn" ><br><br>
                          Password: <input type="password" name="passwordIn"><br><br>
                          <input type="submit" value="Sign in" class="btn btn-primary btn-md"/>
                      </form>
                  </div>
                  <div class="modal-footer">
                      <div  class="text-center">
                          <a href="#" data-toggle="modal" data-target="#Forget" data-dismiss="modal">Forget password?</a>
                          | Not a member?
                          <a href="#" data-toggle="modal" data-target="#SignUp" data-dismiss="modal">Sign up</a>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      <!-- End Sing In-->
      <!-- Start Modal Sign Up Choose Member or Organizer-->
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
      <!-- End Modal Sign Up Choose Member or Organizer-->
      <!-- Start Modal Sign Up for Member -->
      <div class="modal fade" id="SignUpMem" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <div class="text-center"><h4 class="modal-title" id="myModalLabel">Sign up for Member</h4></div>
                  </div>
                  <div class="modal-body">
                      <form name="singUpMem" method="post" action="SignUpMember">
                          <i>*Username</i><br> <input type="text" name="username1" size="30"><br>
                          <i>*Password</i><br> <input type="password" name="password1" size="30"><br>
                          <i>*First Name</i><br> <input type="text" name="fname1" size="30"><br>
                          <i>*Last Name</i><br> <input type="text" name="lname1" size="30"><br>
                          <i>*ID CARD</i><br> <input type="text" name="card1" size="30"><br>
                          <i>*Email</i><br> <input type="text" name="email1" size="30"><br>
                          <i>*Phone</i><br> <input type="text" name="phone1" size="30"><br>
                          <i>*Address</i><br> <input type="text" name="address1" size="30"><br>
                          *Gender    
                          <input type="radio" name="gender" value="male" /> <i>Male    </i>    
                          <input type="radio" name="gender" value="female" /> <i>Female</i><br>
                          <input type="submit" value="Confirm" class="btn btn-primary btn-md" data-toggle="modal" data-dissmiss="modal" />
                      </form>
                      <a href="#" data-toggle="modal" data-target="#SignUp" data-dismiss="modal">Back</a>
                  </div>
              </div>
          </div>
      </div>
      <!-- End Sign Up for Member -->
      <!-- Start Modal Sign Up for Organizer -->
      <div class="modal fade" id="SignUpOrg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <div class="text-center"><h4 class="modal-title" id="myModalLabel">Sign up for Organizer</h4></div>
                  </div>
                  <div class="modal-body">
                      <form name="signUpOrg" method="post" action="SignUpOrg">
                          <i>*Username</i><br> <input type="text" name="username2" size="30"><br>
                          <i>*Password</i><br> <input type="password" name="password2" size="30"><br>
                          <i>*First Name</i><br> <input type="text" name="fname2" size="30"><br>
                          <i>*Last Name</i><br> <input type="text" name="lname2" size="30"><br>
                          <i>*Email</i><br> <input type="text" name="email2" size="30"><br>
                          <i>*Phone</i><br> <input type="text" name="phone2" size="30"><br>
                          <i>*Company Name</i><br> <input type="text" name="comName2" size="30"><br>
                          <i>*Company Phone</i><br> <input type="text" name="comPhone2" size="30"><br><br>
                          <input type="submit" value="Confirm" class="btn btn-primary btn-md" data-toggle="modal" data-dissmiss="modal" />
                      </form>
                  </div>
              </div>
          </div>
      </div>
      <!-- End Sign Up for Organizer -->
      <!-- Start Modal Forget Password -->
      <div class="modal fade" id="Forget" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <div class="text-center"><h4 class="modal-title" id="myModalLabel">Forget Password</h4></div>
                  </div>
                  <div class="modal-body">
                      <center>Please fill your email</center><br>
                      <div style="text-align:center;">
                          <form name="forgetpw" method="post" action="">
                              Email: <input type="text" name="email" style="margin-right:5%;"><br><br>                            
                              <center><button type="submit" class="btn btn-primary">Submit</button></center>
                          </form>
                      </div><br>
                  </div>
              </div>
          </div>
      </div>
      <!-- End Modal Forget Password -->
      <!-- MEMBER -->
      
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/toucheffects.js"></script>
    <!-- hide scrollbar -->

  </body>
</html>