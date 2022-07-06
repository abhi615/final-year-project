<%@page import="db.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
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
    <%
        if (request.getParameter("msg") != null) {
        %>
        <script>alert('Added Remarks');</script>
        <%
            }
    %>
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
            <a href="staffhome.jsp" class="navbar-brand d-flex align-items-center text-center py-0 px-4 px-lg-5">
                <h1 class="m-0 text-primary">Placement Portal</h1>
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="#" class="nav-item nav-link active">Home</a>
                     <a href="addquiz.jsp" class="nav-item nav-link"> Add Quiz</a>
                     <a href="viewresquiz.jsp" class="nav-item nav-link">Quiz Marks </a>
                     <a href="planmeeting.jsp" class="nav-item nav-link">Plan Meeting</a>
                     <a href="Studentlist.jsp" class="nav-item nav-link">Procter Details</a>
                    <a href="addplacement.jsp" class="nav-item nav-link">Add Placement Details</a>
                     <a href="viewprodiary.jsp" class="nav-item nav-link">View Prockter Diary</a>
                     <a href="viewdiary.jsp" class="nav-item nav-link">View Project Diary</a>
                     <a href="viewreports.jsp" class="nav-item nav-link">Download </a>
                     
                     
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


        <!-- Search Start -->
        <<div class="container-xxl py-5 bg-primary">
            <div class="container">
                <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s"style="color: white">My student Project Diary</h1>
                <div class="row g-4">
                    
                    </div>
                    
                    <div class="col-md-6">
                        <div class="wow fadeInUp" data-wow-delay="0.5s">
                            
                            <table border="2" style="border-color: white;color: white">
                                <h1 style="color: white">Project Work Committee</h1>
                               
                                
                                    <%
                                       String sname=request.getParameter("sname");
                                       session.setAttribute("stname", sname);
                                        Connection con=DbConnection.getConnection();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("SELECT * FROM projectcom where sname='"+sname+"'");
        if(rs.next())
        {
            %>
                                    <tr>
                                        <td>Project Internal Guide Name and Phone number</td>
                                        <td><%=rs.getString("piname")%><br>
                                         <%=rs.getString("pimono")%></td>
                                         
                                    </tr>
                                    <tr>
                                        <td>Project External Guide Name and Phone number</td>
                                        <td><%=rs.getString("pxname")%><br>
                                         <%=rs.getString("pxmono")%></td>
                                         
                                    </tr>
                                    <tr>
                                        <td>Project done in Place and Phone number</td>
                                        <td><%=rs.getString("pplace")%><br>
                                         <%=rs.getString("ppmono")%></td>
                                         
                                    </tr>
                                    <tr>
                                        <td>Project Coordinator Name and Phone number</td>
                                        <td><%=rs.getString("pcname")%><br>
                                         <%=rs.getString("pcmono")%></td>
                                         
                                    </tr>
                                    <tr>
                                         <td>Hod Name and Phone number</td>
                                         <td><%=rs.getString("hodname")%><br>
                                         <%=rs.getString("hodmono")%></td>
                                         
                                    </tr>
                                    <%}
        Statement st1=con.createStatement();
        ResultSet rs1=st1.executeQuery("SELECT * FROM projectabstract where sname='"+sname+"'");
        if(rs1.next())
        {
                                    %>
                                    <tr>
                                        <td rowspan="2"></td>
                                    </tr>
                                    
                                    <tr>
                                        <td><h1 style="color: white">Project Abstract</h1></td>
                                    </tr>
                                    <tr> 
                                        <td>Project Title</td>
                                        <td><%=rs1.getString("pname")%></td>
                                    </tr>
                                    <tr> 
                                        <td>Abstract</td>
                                        <td><%=rs1.getString("abst")%></td>
                                    </tr>
                                    <%}
        Statement st2=con.createStatement();
        ResultSet rs2=st2.executeQuery("SELECT * FROM pprogress1 where sname='"+sname+"'");
        if(rs2.next())
        {
            String remarks=rs2.getString("remarks");
            System.out.println("remarks=="+remarks);
        
                                    %>
                                    <tr>
                                        <td rowspan="2"></td>
                                    </tr>
                                    
                                    <tr>
                                        <td><h1 style="color: white">Project Progress of 1st Review</h1></td>
                                    </tr>
                                    <tr> 
                                        <td>From date</td>
                                        <td><%=rs2.getString("sdate")%></td>
                                    </tr>
                                    <tr> 
                                        <td>To date</td>
                                        <td><%=rs2.getString("edate")%></td>
                                    </tr>
                                    <tr> 
                                        <td>Progress</td>
                                        <td><%=rs2.getString("progresss")%></td>
                                    </tr>
                                    
                                    <%
                                    if (remarks.equals("no"))
                                    {%>
                                    <tr>
                                    <td>Make Remark</td>
                                    <td>
                                        <a href="remark1.jsp?id=<%=rs2.getInt("id")%>">Remark</a></td></tr>
                                   <% }else
                                    {%>
                                    <tr>
                                       <td>Remarks</td>
                                       <td><%=remarks%></td> </tr>
                                  <% }
                                    }
        Statement st3=con.createStatement();
        ResultSet rs3=st3.executeQuery("SELECT * FROM pprogress2 where sname='"+sname+"'");
        if(rs3.next())
        {
            String remarks=rs3.getString("remarks");
            System.out.println("remarks=="+remarks);
        
                                    %>
                                    <tr>
                                        <td rowspan="2"></td>
                                    </tr>
                                    
                                    <tr>
                                        <td><h1 style="color: white">Project Progress of 2nd Review</h1></td>
                                    </tr>
                                    <tr> 
                                        <td>From date</td>
                                        <td><%=rs3.getString("sdate")%></td>
                                    </tr>
                                    <tr> 
                                        <td>To date</td>
                                        <td><%=rs3.getString("edate")%></td>
                                    </tr>
                                    <tr> 
                                        <td>Progress</td>
                                        <td><%=rs3.getString("progesss")%></td>
                                    </tr>
                                    
                                    <%
                                    if (remarks.equals("no"))
                                    {%>
                                    <tr>
                                    <td>Make Remark</td>
                                    <td>
                                        <a href="remark2.jsp?id=<%=rs3.getInt("id")%>">Remark</a></td></tr>
                                   <% }else
                                    {%>
                                    <tr>
                                       <td>Remarks</td>
                                       <td><%=remarks%></td> </tr>
                                  <% }
                                    }
        
                                     Statement st4=con.createStatement();
        ResultSet rs4=st4.executeQuery("SELECT * FROM pprogress3 where sname='"+sname+"'");
        if(rs4.next())
        {
            String remarks=rs4.getString("remarks");
            System.out.println("remarks=="+remarks);
        
                                    %>
                                    <tr>
                                        <td rowspan="2"></td>
                                    </tr>
                                    
                                    <tr>
                                        <td><h1 style="color: white">Project Progress of 3rd Review</h1></td>
                                    </tr>
                                    <tr> 
                                        <td>From date</td>
                                        <td><%=rs4.getString("sdate")%></td>
                                    </tr>
                                    <tr> 
                                        <td>To date</td>
                                        <td><%=rs4.getString("edate")%></td>
                                    </tr>
                                    <tr> 
                                        <td>Progress</td>
                                        <td><%=rs4.getString("progress")%></td>
                                    </tr>
                                    
                                    <%
                                    if (remarks.equals("no"))
                                    {%>
                                    <tr>
                                    <td>Make Remark</td>
                                    <td>
                                        <a href="remark3.jsp?id=<%=rs4.getInt("id")%>">Remark</a></td></tr>
                                   <% }else
                                    {%>
                                    <tr>
                                       <td>Remarks</td>
                                       <td><%=remarks%></td> </tr>
                                  <% }
                                    } 
        Statement st5=con.createStatement();
        ResultSet rs5=st5.executeQuery("SELECT * FROM pprogress4 where sname='"+sname+"'");
        if(rs5.next())
        {
            String remarks=rs5.getString("remarks");
            System.out.println("remarks=="+remarks);
        
                                    %>
                                    <tr>
                                        <td rowspan="2"></td>
                                    </tr>
                                    
                                    <tr>
                                        <td><h1 style="color: white">Project Progress of 4th Review</h1></td>
                                    </tr>
                                    <tr> 
                                        <td>From date</td>
                                        <td><%=rs5.getString("sdate")%></td>
                                    </tr>
                                    <tr> 
                                        <td>To date</td>
                                        <td><%=rs5.getString("edate")%></td>
                                    </tr>
                                    <tr> 
                                        <td>Progress</td>
                                        <td><%=rs5.getString("progresss")%></td>
                                    </tr>
                                    
                                    <%
                                    if (remarks.equals("no"))
                                    {%>
                                    <tr>
                                    <td>Make Remark</td>
                                    <td>
                                        <a href="remark4.jsp?id=<%=rs5.getInt("id")%>">Remark</a></td></tr>
                                   <% }else
                                    {%>
                                    <tr>
                                       <td>Remarks</td>
                                       <td><%=remarks%></td> </tr>
                                  <% }
                                    } 
         Statement st6=con.createStatement();
        ResultSet rs6=st6.executeQuery("SELECT * FROM pprogress5 where sname='"+sname+"'");
        if(rs6.next())
        {
            String remarks=rs6.getString("remarks");
            System.out.println("remarks=="+remarks);
        
                                    %>
                                    <tr>
                                        <td rowspan="2"></td>
                                    </tr>
                                    
                                    <tr>
                                        <td><h1 style="color: white">Project Progress of 5th Review</h1></td>
                                    </tr>
                                    <tr> 
                                        <td>From date</td>
                                        <td><%=rs6.getString("sdate")%></td>
                                    </tr>
                                    <tr> 
                                        <td>To date</td>
                                        <td><%=rs6.getString("edate")%></td>
                                    </tr>
                                    <tr> 
                                        <td>Progress</td>
                                        <td><%=rs6.getString("progresss")%></td>
                                    </tr>
                                    
                                    <%
                                    if (remarks.equals("no"))
                                    {%>
                                    <tr>
                                    <td>Make Remark</td>
                                    <td>
                                        <a href="remark5.jsp?id=<%=rs6.getInt("id")%>">Remark</a></td></tr>
                                   <% }else
                                    {%>
                                    <tr>
                                       <td>Remarks</td>
                                       <td><%=remarks%></td> </tr>
                                  <% }
                                    } 
        Statement st7=con.createStatement();
        ResultSet rs7=st7.executeQuery("SELECT * FROM pprogress6 where sname='"+sname+"'");
        if(rs7.next())
        {
            String remarks=rs7.getString("remarks");
            System.out.println("remarks=="+remarks);
        
                                    %>
                                    <tr>
                                        <td rowspan="2"></td>
                                    </tr>
                                    
                                    <tr>
                                        <td><h1 style="color: white">Project Progress of 6th Review</h1></td>
                                    </tr>
                                    <tr> 
                                        <td>From date</td>
                                        <td><%=rs7.getString("sdate")%></td>
                                    </tr>
                                    <tr> 
                                        <td>To date</td>
                                        <td><%=rs7.getString("edate")%></td>
                                    </tr>
                                    <tr> 
                                        <td>Progress</td>
                                        <td><%=rs7.getString("progresss")%></td>
                                    </tr>
                                    
                                    <%
                                    if (remarks.equals("no"))
                                    {%>
                                    <tr>
                                    <td>Make Remark</td>
                                    <td>
                                        <a href="remark6.jsp?id=<%=rs7.getInt("id")%>">Remark</a></td></tr>
                                   <% }else
                                    {%>
                                    <tr>
                                       <td>Remarks</td>
                                       <td><%=remarks%></td> </tr>
                                  <% }
                                    } 
                                    
        
                                    %>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- About End -->


        <!-- Jobs Start -->
         <!-- Testimonial End -->
        

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