<!DOCTYPE html>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String sname=session.getAttribute("uname").toString();
        Connection con=db.DbConnection.getConnection();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from pprogress1 where sname='"+sname+"'");
        if(rs.next())
        {
            response.sendRedirect("progress2.jsp");
        }else
        {
%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Placement Portal</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
            <a href="studhome.jsp" class="navbar-brand d-flex align-items-center text-center py-0 px-4 px-lg-5">
                <h1 class="m-0 text-primary">Placement Portal</h1>
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="quiz.jsp" class="nav-item nav-link">Quiz</a>
                     <a href="uploadofferleter.jsp" class="nav-item nav-link">Upload Offer letter</a>
                     <a href="uploadproject.jsp" class="nav-item nav-link">Upload Project Details</a>
                    <a href="prodiary.jsp" class="nav-item nav-link">Project Diary</a>
                    <a href="prokterdiary.jsp" class="nav-item nav-link">Prokter Diary</a>
                     <a href="viewplacement.jsp" class="nav-item nav-link">Placement</a>
                     
                    <a href="logout.jsp" class="nav-item nav-link">Logout</a>
                </div>
                
            </div>
        </nav>
        <!-- Navbar End -->


        <!-- Carousel Start -->
        <div class="container-fluid p-0">
            <div class="owl-carousel header-carousel position-relative">
                <div class="owl-carousel-item position-relative">
                    <img class="img-fluid" src="img/carousel-1.jpg" alt="">
                    <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(43, 57, 64, .5);">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-10 col-lg-8">
                                    <h1 class="display-3 text-white animated slideInDown mb-4">Find The Perfect Job That You Deserved</h1>
                                    <p class="fs-5 fw-medium text-white mb-4 pb-2">Vero elitr justo clita lorem. Ipsum dolor at sed stet sit diam no. Kasd rebum ipsum et diam justo clita et kasd rebum sea elitr.</p>
                                    <a href="" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Search A Job</a>
                                    <a href="" class="btn btn-secondary py-md-3 px-md-5 animated slideInRight">Find A Talent</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="owl-carousel-item position-relative">
                    <img class="img-fluid" src="img/carousel-2.jpg" alt="">
                    <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(43, 57, 64, .5);">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-10 col-lg-8">
                                    <h1 class="display-3 text-white animated slideInDown mb-4">Find The Best Startup Job That Fit You</h1>
                                    <p class="fs-5 fw-medium text-white mb-4 pb-2">Vero elitr justo clita lorem. Ipsum dolor at sed stet sit diam no. Kasd rebum ipsum et diam justo clita et kasd rebum sea elitr.</p>
                                    <a href="" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Search A Job</a>
                                    <a href="" class="btn btn-secondary py-md-3 px-md-5 animated slideInRight">Find A Talent</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Carousel End -->

<div class="container-fluid bg-primary mb-5 wow fadeIn" data-wow-delay="0.1s" style="padding: 35px;">
            <div class="container">
                <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">Add Progress-month 1</h1>
                <div class="row g-4">
                    
                    </div>
                    
                    <div class="col-md-6">
                        <div class="wow fadeInUp" data-wow-delay="0.5s">
                            
                            <form name="streg" action="pro1action.jsp" method="post" >
                                <div class="row g-3">
                                   
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="date" class="form-control" id="name" name="sdate" required="">
                                            <label for="name">Choose Staring Date</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="date" class="form-control" id="name" name="edate" required="">
                                            <label for="name">Choose Ending Date</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <textarea name="progress" rows="4" cols="20">
                                            </textarea>
                                            <label for="name">Work details</label>
                                        </div>
                                    </div>
                                   
                                    
                                    
                                    
                                    <div class="col-12">
                                        <button class="btn btn-dark border-0 w-100" type="submit">Add</button>
                                    </div>
                                     <div class="col-12">
                                        <button class="btn btn-dark border-0 w-100" type="reset">Clear</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Search Start -->
        
        

        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-2 wow fadeIn" data-wow-delay="0.1s">
            
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="copyright">
                    <div class="row">
                         <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">Digital transformation Academic activity</a>, All Right Reserved. 
							
							<!--/*** This template is free as long as you keep the footer author?s credit link/attribution link/backlink. If you'd like to use the template without the footer author?s credit link/attribution link/backlink, you can purchase the Credit Removal License from "http://projectinstitutie.in//credit-removal". Thank you for your support. ***/-->
							Designed By <a class="design" href="http://projectinstitutie.in/">CSE</a>
                        </div>
                        
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="">Home</a>
                                <a href="">Cookies</a>
                                <a href="">Help</a>
                                <a href="">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
<%}%>