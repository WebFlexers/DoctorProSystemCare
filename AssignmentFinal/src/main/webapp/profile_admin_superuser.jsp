<%--
  Created by IntelliJ IDEA.
  User: Michalis
  Date: 14/07/2021
  Time: 6:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.WebFlexers.models.Doctor" %>
<%@ page import="com.WebFlexers.DatabaseManager" %>
<%@ page import="com.WebFlexers.models.Admin" %>
<!--Template: W3layouts
Template URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="zxx">
<head>
    <title>Doctor Pro | Admin Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8" />
    <meta name="keywords" content="Alleviating Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
	SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- Custom Theme files -->
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
    <link href="css/style.css" type="text/css" rel="stylesheet" media="all">
    <!-- font-awesome icons -->
    <link href="css/fontawesome-all.min.css" rel="stylesheet">
    <!-- //Custom Theme files -->
    <!-- online-fonts -->
    <link href="//fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800,900" rel="stylesheet"><!-- //online-fonts -->
</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache"); // HTTP 1
    response.setHeader("Expires", "0");

    Admin admin = null;
    if (session.getAttribute("user") == null)
        response.sendRedirect("index.jsp");
    else {
        admin = (Admin)session.getAttribute("user");
    }
%>
<!-- header -->
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-gradient-secondary">
        <h1>
            <a class="navbar-brand text-white" href="index.jsp">
                Doctor Pro
            </a>
        </h1>
        <button class="navbar-toggler ml-md-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-lg-auto text-center">

                <li class="nav-item   mr-3 mt-lg-0 mt-3">
                    <a class="nav-link" href="index.jsp">Home
                    </a>
                </li>

                <li class="nav-item mr-3 mt-lg-0 mt-3">
                    <a class="nav-link" href="gallery.jsp">Gallery</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp">Contact</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="about.jsp">About</a>
                </li>

                <li class="nav-item active dropdown mr-3 mt-lg-0 mt-3">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false">
                        Account
                        <span class="sr-only">(current)</span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">

                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="profile_admin.jsp">Profile</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="logout-servlet">Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</header>
<!-- main image slider container -->
<div class="inner-banner">
</div>
<!-- end of main image slider container -->
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="index.jsp">Home</a>
        </li>
        <li class="breadcrumb-item active" aria-current="page">Profile</li>
    </ol>
</nav>
<!-- typography -->
<section class="wthree-row pt-sm-3  pb-sm-5 pb-3">
    <div class="container py-sm-5 py-3">
        <!-- section title -->

        <h2 class="heading-agileinfo"> Welcome, <% out.println("<font color=black size=6px>"+ admin.getUsername() +"</font>"); %></h2>
        <!-- //section title -->
        <div class="pb-5 mt-md-5 typo-wthree">
            <h4 class="pt-4 pb-3">Admin's Profile</h4>

            <div class="d-flex flex-column bg-flex">
                <div class="p-2 bg-flex mb-1 bg-flex-item">ID: <% out.println("<font color=black size=4px>"+ admin.getAdminID() +"</font>"); %> </div>
                <div class="p-2 bg-flex mb-1 bg-flex-item">Firstname:  <% out.println("<font color=black size=4px>"+ admin.getFirstName() +"</font>"); %></div>
                <div class="p-2 bg-flex mb-1 bg-flex-item">Surname:  <% out.println("<font color=black size=4px>"+ admin.getSurname() +"</font>"); %> </div>
                <div class="p-2 bg-flex mb-1 bg-flex-item">Username: <% out.println("<font color=black size=4px>"+ admin.getUsername() +"</font>"); %></div>
                <div class="p-2 bg-flex mb-1 bg-flex-item">Email: <% out.println("<font color=black size=4px>"+ admin.getEmail() +"</font>"); %> </div>

            </div>
            <br><br>
            <h4>List of Doctors</h4><br>

            <div>
                <table border="1" cellpadding="5">
                    <tr>
                        <th>AMKA</th>
                        <th>Username</th>
                        <th>First_name</th>
                        <th>Last_name</th>
                        <th>speciality</th>
                        <th>email</th>
                        <th>phone_num</th>
                        <th>admin_id</th>

                    </tr>
                    <%
                        ArrayList<Doctor> doctorList = (ArrayList<Doctor>)session.getAttribute("allDoctors");
                        if (doctorList != null) {
                            for (Doctor doctor: doctorList) {
                                out.println("<tr>");
                                out.println("<td>" + doctor.getAmka() + "</td> " +
                                        "<td>" + doctor.getUsername() + "</td> " +
                                        "<td>" + doctor.getFirstName() + "</td> " +
                                        "<td>" + doctor.getSurname() + "</td> " +
                                        "<td>" + doctor.getSpecialty() + "</td> " +
                                        "<td>" + doctor.getEmail() + "</td> " +
                                        "<td>" + doctor.getPhoneNum() + "</td> " +
                                        "<td>" + doctor.getAdminID() + "</td> "
                                );
                                out.println("</tr>");
                            }
                        }
                    %>
                </table>
            </div>
            <br>
            <%--            Deletion form            --%>
            <form action="/delete-doctor-servlet" method="post">
                <div class="form-group">
                    <label for="recipient-name">Enter Doctor's AMKA for deletion:</label>
                    <input type="text" placeholder="Doctor's AMKA.. " name="amka" id="doctor-amka" required="">
                </div>
                <div class="right-w3l">
                    <input type="submit" value="Delete">
                </div>
            </form>
                <%
                    String deleteDoctorMessage = (String)session.getAttribute("deleteDoctorMessage");
                    if (deleteDoctorMessage != null)
                        out.println("<font color=blue size=4px>" + deleteDoctorMessage + "</font>");
                %>
            <br>

            <%-- Add an admin - button --%>
            <button href="#" data-toggle="modal" data-target="#registerAdminModal" class="text-dark font-weight-bold">
                Add an admin</button>

            <%-- Add a doctor - button --%>
            <button href="#" data-toggle="modal" data-target="#registerDoctorModal" class="text-dark font-weight-bold">
                Add a doctor</button>

            <%-- Add a doctor--%>
            <div class="modal fade" id="registerDoctorModal" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header text-center">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="login px-4 mx-auto mw-100">
                                <h5 class="modal-title text-center text-dark mb-4">Add a doctor</h5>
                                <form action="/add-doctor-servlet" method="post">
                                    <div class="form-group">
                                        <label class="col-form-label">Amka</label>
                                        <input type="text" pattern="^(\d{11})$" class="form-control" name="amkaD" id="amkaDoctor" required>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-form-label">Specialty</label>
                                        <input type="text" class="form-control" name="specialtyD" id="specialtyDoctor" required>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-form-label">Username</label>
                                        <input type="text" class="form-control" name="usernameD" id="usernameDoctor" required>
                                    </div>

                                    <div class="form-group">
                                        <label class="mb-2 col-form-label">Password</label>
                                        <input type="password" class="form-control" name="passwordD" id="passwordDoctor" required>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-form-label">Confirm Password</label>
                                        <input type="password" class="form-control" name="confirmPasswordD" id="passwordConfirmDoctor" required>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-form-label">First name</label>
                                        <input type="text" class="form-control" name="firstNameD" id="firstNameDoctor" required>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-form-label">Last name</label>
                                        <input type="text" class="form-control" name="lastNameD" id="lastNameDoctor" required>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-form-label">Email</label>
                                        <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-control" name="emailD" id="emailDoctor" required>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-form-label">Phone number</label>
                                        <input type="text" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" class="form-control" name="phoneNumD" id="phoneNumDoctor" required>
                                    </div>

                                    <div class="reg-w3l">
                                        <button type="submit" class="form-control submit mb-4">Add doctor</button>
                                    </div>

                                    <p class="text-center pb-4">
                                        <a href="#" class="text-secondary">By adding a doctor into the database, I agree to your terms</a>
                                    </p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //typo container -->
            </div>
                <%
                    String registerDoctorMessage = (String)session.getAttribute("registerDoctorMessage");
                    if( registerDoctorMessage != null )
                        out.println("<font color=green size=4px>" + registerDoctorMessage + "</font>");
                %>

                <%
                    String register_msg = (String)session.getAttribute("registerMessage");
                    if (register_msg != null)
                        out.println("<font color=blue size=4px>" + register_msg + "</font>");
                %>
</section>
<!-- //typography -->

<!-- footer -->
<footer class="py-sm-5">
    <div class="container">
        <div class="row py-5">
            <!-- footer grid1 -->
            <div class="col-lg-3 col-sm-6 fv5-contact">
                <h2 class="mb-4">Contact Us</h2>
                <div class="fv3-contact mt-3">

                    <span class="fas fa-home mr-2"></span>
                    <p>90 Street, City, State 34789.</p>
                </div>
                <div class="fv3-contact mt-3">
                    <span class="fas fa-phone-volume mr-2"></span>
                    <p>+456 123 7890</p>
                </div>
                <div class="fv3-contact mt-3">
                    <span class="fas fa-envelope-open mr-2"></span>
                    <a href="mailto:doctorpro@protonmail.com" class="text-secondary">doctorpro@protonmail.com</a>
                </div>
            </div>
            <!-- //footer grid1 -->
            <!-- footer grid2 -->
            <div class="col-lg-3  col-sm-6 footv3-left text-lg-center my-sm-0 mt-5">
                <h3 class="mb-4">Opening Hours</h3>
                <ul class="list-agileits">
                    <li>
                        Mon – Fri ------- 09:00-17:00
                    </li>
                    <li class="my-3">
                        Saturday -------- 09:30-17:00</a>
                    </li>
                    <li class="mb-3">
                        Sunday ---------- 10:30-18:00
                    </li>

                </ul>
            </div>
            <!-- //footer grid2 -->
            <!-- footer grid3 -->
            <div class="col-lg-3  col-sm-6 footv3-left text-lg-center my-lg-0 mt-sm-5 mt-5">
                <h3 class="mb-4">Navigation</h3>
                <ul class="list-agileits">
                    <li>
                        <a href="index.jsp">
                            Home
                        </a>
                    </li>
                    <li class="my-3">
                        <a href="about.jsp">
                            About Us
                        </a>
                    </li>
                    <li class="mb-3">
                        <a href="services.jsp">
                            Services
                        </a>
                    </li>
                    <li>
                        <a href="contact.jsp">
                            Contact Us
                        </a>
                    </li>
                </ul>
            </div>
            <!-- //footer grid3 -->
            <!-- footer grid4  -->
            <div class="col-lg-3  col-sm-6 footv3-left my-lg-0 mt-5">
                <h3 class="mb-4">subscribe to newsletter</h3>
                <form action="#" method="post">
                    <div class="form-group">
                        <input type="email" class="form-control  bg-dark border-0" id="email" placeholder="Enter email" name="email" required>
                    </div>
                    <div class="form-group">
                        <input type="Submit" class="form-control bg-secondary text-white border-0" id="sub" value="submit" name="sub">
                    </div>
                </form>
            </div>
            <!-- //footer grid4 -->
        </div>
        <div class="cpy-right text-center  pt-3">

            <div class="copyrightbottom">
                <p class="text-secondary">© 2021 WebFlexers. All rights reserved | Design by
                    <a href="http://w3layouts.com" class="text-white"> W3layouts.</a>
                </p>
            </div>
            <div class="copyrighttop">
                <ul>
                    <li>
                        <h4>Follow us on:</h4>
                    </li>
                    <li>
                        <a class="facebook" href="#">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                    </li>
                    <li>
                        <a class="facebook" href="#">
                            <i class="fab fa-twitter"></i>
                        </a>
                    </li>
                    <li>
                        <a class="facebook" href="#">
                            <i class="fab fa-google-plus-g"></i>
                        </a>
                    </li>
                    <li>
                        <a class="facebook" href="#">
                            <i class="fab fa-pinterest-p"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- //footer container -->
</footer>
<!-- //footer -->
<!--/Register Admin-->
<div class="modal fade" id="registerAdminModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="login px-4 mx-auto mw-100">
                    <h5 class="modal-title text-center text-dark mb-4">Add an Admin</h5>
                    <form action="/register-admin-servlet" method="post">

                        <div class="form-group">
                            <label class="col-form-label">Username</label>
                            <input type="text" class="form-control" name="usernameA" id="usernameAdmin" required>
                        </div>

                        <div class="form-group">
                            <label class="mb-2 col-form-label">Password</label>
                            <input type="password" class="form-control" name="passwordA" id="passwordAdmin" required>
                        </div>

                        <div class="form-group">
                            <label class="col-form-label">Confirm Password</label>
                            <input type="password" class="form-control" name="confirmPasswordA" id="passwordConfirmAdmin" required>
                        </div>

                        <div class="form-group">
                            <label class="col-form-label">First name</label>
                            <input type="text" class="form-control" name="firstNameA" id="firstNameAdmin" required>
                        </div>

                        <div class="form-group">
                            <label class="col-form-label">Last name</label>
                            <input type="text" class="form-control" name="lastNameA" id="lastNameAdmin" required>
                        </div>


                        <div class="form-group">
                            <label class="col-form-label">Email</label>
                            <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-control" name="emailA" id="emailAdmin" required>
                        </div>



                        <div class="form-group">
                            <label class="col-form-label">Super User</label>
                            <input type="checkbox" class="form-control" name="isSuperUserA" id="isSuperUserA" >
                        </div>

                        <div class="reg-w3l">
                            <button type="submit" class="form-control submit mb-4">Add Admin</button>
                        </div>

                        <p class="text-center pb-4">
                            <a href="#" class="text-secondary">By adding an admin into the database, I agree to your terms</a>
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!--//Register-->

<!-- //footer -->
<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script>
<!-- //js -->

<!-- start-smooth-scrolling -->
<script src="js/move-top.js"></script>
<script src="js/easing.js"></script>
<script>
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();

            $('html,body').animate({
                scrollTop: $(this.hash).offset().top
            }, 1000);
        });
    });
</script>
<!-- //end-smooth-scrolling -->
<!-- smooth-scrolling-of-move-up -->
<script>
    $(document).ready(function () {
        /*
        var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
        };
        */

        $().UItoTop({
            easingType: 'easeOutQuart'
        });

    });
</script>
<script src="js/SmoothScroll.min.js"></script>
<!-- //smooth-scrolling-of-move-up -->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/bootstrap.js"></script>
</body>
</html>