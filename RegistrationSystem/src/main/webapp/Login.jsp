<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Sign In Page</title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
  <!-- Awesome Font -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <style>
    .signup-container {
      background-color: transparent;
      padding: 20px;
      width: 400px;
    }

    .signup-container h2 {
      color: white;
      margin-bottom: 20px;
    }

    .signup-container label {
      color: white;
      display: block;
      margin-bottom: 5px;
      text-align: left;
    }

    .signup-container input {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 3px;
    }

    .signup-container button {
      width: 100%;
      padding: 10px;
      border: none;
      border-radius: 3px;
      background-color: #1cbbb4;
      color: white;
      font-size: 16px;
      cursor: pointer;
    }

    .signup-container button:hover {
      background-color: #1cbbb4;
    }

    #passwordHelpBlock {
      color: white;
    }
  </style>

  <script type="text/javascript">
    function validateForm() {
      const password = document.getElementById("password").value;
      const checkbox = document.getElementById("terms").checked;
      let message = "";

      if (password.length < 8 || password.length > 12) {
    	  passwordHelpBlock.innerText = "Password must be 8-12 characters long.";
  	      passwordHelpBlock.style.color = "red";
      }

      if (!checkbox) {
    	passwordHelpBlock.innerText = "You must accept the terms and conditions..";
  	    passwordHelpBlock.style.color = "red";
      }

      if (message) {
        alert(message);
        return false;
      }

      return true;
    }
  </script>
</head>

<body>
  <div class="hero_area">
    <!-- header section starts -->
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container">
          <a class="navbar-brand" href="index.html">
            <i class="fa fa-user" style="font-size:36px;color:white" aria-label="User Icon"></i>
            <span>
              RegistrationSystem
            </span>
          </a>
           <%@include  file="Component/massage.jsp" %>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">
              <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Login.jsp">Sign In</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="register.jsp">Sign Up</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Users.jsp">All Users</a>
              </li>
            </ul>
            <div class="user_option">
              <a href="">
                <span>
                  Login
                </span>
              </a>
              <form class="form-inline my-2 my-lg-0 ml-0 ml-lg-4 mb-3 mb-lg-0">
                <button class="btn my-2 my-sm-0 nav_search-btn" type="submit"></button>
              </form>
            </div>
          </div>
          <div>
            <div class="custom_menu-btn">
              <button>
                <span class="s-1"></span>
                <span class="s-2"></span>
                <span class="s-3"></span>
              </button>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->

    <!-- slider section -->
    <section class="slider_section">
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active">01</li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1">02</li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2">03</li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="container-fluid">
              <div class="row">
                <div class="col-md-5 offset-md-1">
                  <div class="detail-box">
                    <!-- Registration form -->
                    <div class="signup-container">
                      <h2>Sign In</h2>
                      <form action="LoginServlet" method="POST" onsubmit="return validateForm();">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required>

                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>

                        <div id="passwordHelpBlock" class="form-text">
                          Must be 8-12 characters long.
                        </div>

                        <input type="checkbox" id="terms" name="terms" value="checked">
                        <label for="terms">Accept Terms and Conditions</label>

                        <button type="submit">Sign In</button>
                      </form>
                    </div>
                  </div>
                </div>
                <div class="offset-md-1 col-md-4 img-container">
                  <div class="img-box">
                    <img src="images/log.png" alt="">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- end slider section -->
  </div>

  <script src="js/jquery-3.4.1.min.js"></script>
  <script src="js/bootstrap.js"></script>
  <script src="js/custom.js"></script>
</body>

</html>
