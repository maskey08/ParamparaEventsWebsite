<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>${service.name} | Parampara Events</title>
                <!-- Include CSS files -->
                <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />">
                <link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">
                <link rel="stylesheet" href="<c:url value='/resources/css/responsive.css' />">
                <link rel="icon" href="<c:url value='/resources/images/fevicon.png' />" type="image/gif" />
                <!-- Other CSS includes -->
                <link rel="stylesheet" href="<c:url value='/resources/css/jquery.mCustomScrollbar.min.css' />">
                <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
                <!-- Custom styles for this page -->
                <style>
                    .service-detail-section {
                        padding: 80px 0;
                    }

                    .service-image {
                        width: 100%;
                        border-radius: 10px;
                        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                    }

                    .service-details h1 {
                        color: #1d1d1d;
                        margin-bottom: 20px;
                    }

                    .service-price {
                        font-size: 24px;
                        color: #4ac00c;
                        font-weight: bold;
                        margin: 20px 0;
                    }

                    .service-description {
                        margin-bottom: 30px;
                        font-size: 16px;
                        line-height: 1.8;
                    }

                    .service-meta {
                        background-color: #f9f9f9;
                        padding: 20px;
                        border-radius: 5px;
                        margin-bottom: 30px;
                    }

                    .service-meta p {
                        margin-bottom: 10px;
                    }

                    .btn-book-now {
                        background-color: #4ac00c;
                        color: white;
                        padding: 10px 30px;
                        border-radius: 30px;
                        font-weight: bold;
                        transition: all 0.3s ease;
                    }

                    .btn-book-now:hover {
                        background-color: #3a9d0a;
                        color: white;
                    }

                    .tags {
                        margin-top: 20px;
                    }

                    .tag {
                        display: inline-block;
                        background-color: #e9f7e3;
                        color: #4ac00c;
                        padding: 5px 15px;
                        margin-right: 10px;
                        margin-bottom: 10px;
                        border-radius: 20px;
                        font-size: 14px;
                    }
                </style>
            </head>

            <body class="main-layout">
                <!-- loader -->
                <div class="loader_bg">
                    <div class="loader"><img src="<c:url value='/resources/images/loading.gif' />" alt="#" /></div>
                </div>
                <!-- end loader -->

                <!-- header -->
                <header>
                    <div class="header">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                                    <div class="full">
                                        <div class="center-desk">
                                            <div class="logo">
                                                <a href="<c:url value='/' />"><img
                                                        src="<c:url value='/resources/images/logo.png' />"
                                                        alt="#" /></a>
                                            </div>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                </header>
                <!-- end header inner -->

                <!-- Service Detail Section -->
                <div class="service-detail-section">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <img src="<c:url value='/resources/images/service_img1.jpg' />" alt="${service.name}"
                                    class="service-image">
                            </div>
                            <div class="col-md-6 service-details">
                                <h1>${service.name}</h1>
                                <div class="service-price">
                                    <fmt:formatNumber value="${service.cost}" type="currency" />
                                </div>
                                <div class="service-meta">
                                    <p><strong>Service ID:</strong> ${service.serviceId}</p>
                                    <p><strong>Type:</strong> ${service.type}</p>
                                </div>
                                <div class="service-description">
                                    ${service.description}
                                </div>
                                <c:if test="${not empty service.serviceTags}">
                                    <div class="tags">
                                        <p><strong>Tags:</strong></p>
                                        <c:forTokens items="${service.serviceTags}" delims="," var="tag">
                                            <span class="tag">${tag}</span>
                                        </c:forTokens>
                                    </div>
                                </c:if>
                                <div class="mt-4">
                                    <a href="<c:url value='/contact' />" class="btn btn-book-now">Book Now</a>
                                    <a href="<c:url value='/services' />" class="btn btn-outline-secondary ml-3">Back to
                                        Services</a>
                                </div>
                            </div>
                        </div>

                        <!-- Related Services Section -->
                        <div class="row mt-5">
                            <div class="col-md-12">
                                <h2>You Might Also Like</h2>
                                <hr>
                            </div>
                        </div>
                        <div class="row mt-4">
                            <!-- This section would normally show related services based on type or tags -->
                            <!-- For now, we'll just show a placeholder message -->
                            <div class="col-md-12">
                                <p>Related services will be displayed here based on the type and tags.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- footer -->
                <footer>
                    <div class="footer">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="fid_box">
                                        <h3>Contact Us</h3>
                                        <ul class="location_icon">
                                            <li><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i></a><br>
                                                Mumbai, India</li>
                                            <li><a href="#"><i class="fa fa-phone" aria-hidden="true"></i></a><br> +91
                                                987 654 3210</li>
                                            <li><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i></a><br>
                                                info@paramparaevents.com</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="fid_box">
                                        <h3>Links</h3>
                                        <ul class="link">
                                            <li><a href="<c:url value='/' />">Home</a></li>
                                            <li><a href="<c:url value='/about' />">About</a></li>
                                            <li><a href="<c:url value='/services' />">Services</a></li>
                                            <li><a href="<c:url value='/gallery' />">Gallery</a></li>
                                            <li><a href="<c:url value='/testimonial' />">Testimonial</a></li>
                                            <li><a href="<c:url value='/contact' />">Contact</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="fid_box">
                                        <h3>Newsletter</h3>
                                        <form class="news_form">
                                            <input class="letter_form" placeholder=" Enter your email" type="text"
                                                name="Enter your email">
                                            <button class="sumbit">Subscribe</button>
                                        </form>
                                        <ul class="social_icon">
                                            <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-linkedin-square" aria-hidden="true"></i></a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="copyright">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <p>© 2023 All Rights Reserved. <a href="https://paramparaevents.com/">Parampara
                                                Events</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
                <!-- end footer -->

                <!-- Javascript files-->
                <script src="<c:url value='/resources/js/jquery.min.js' />"></script>
                <script src="<c:url value='/resources/js/popper.min.js' />"></script>
                <script src="<c:url value='/resources/js/bootstrap.bundle.min.js' />"></script>
                <script src="<c:url value='/resources/js/jquery-3.0.0.min.js' />"></script>
                <!-- sidebar -->
                <script src="<c:url value='/resources/js/jquery.mCustomScrollbar.concat.min.js' />"></script>
                <script src="<c:url value='/resources/js/custom.js' />"></script>
            </body>

            </html>