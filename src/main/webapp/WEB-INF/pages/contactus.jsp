<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | Parampara Events</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Joan:wght@400;500;600&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            color: #333;
            position: relative;
            line-height: 1.6;
            font-family: 'Montserrat', sans-serif;
        }
        
        /* Header styles - using Primary color */
        .header-contact {
            background-color: transparent;
            color: #ffffff;
            padding: 80px 40px;
            text-align: center;
            position: relative;
            z-index: 1;
            background-image: url('${pageContext.request.contextPath}/resources/images/blogs/Weddinghands.jpeg');
            background-size: cover;
            background-position: center;
            background-blend-mode: overlay;
        }

        .header-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #E54E50;
            opacity: 0.5;
            z-index: -1;
        }

        .header-contact h1 {
            font-size: 48px;
            margin-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: normal;
            font-family: 'Joan', serif;
        }

        .tagline {
            font-style: italic;
            font-size: 18px;
            letter-spacing: 1px;
        }
        
        /* Main content */
        .main-content {
            max-width: 1200px;
            margin: 60px auto;
            background: #ffffff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
            position: relative;
            z-index: 1;
            border-radius: 10px;
            overflow: hidden;
        }
        
        /* Get in Touch Section */
        .get-in-touch {
            padding: 60px;
            background-color: #fff;
            text-align: center;
        }
        
        .section-title {
            font-size: 36px;
            color: #333;
            margin-bottom: 15px;
            font-weight: 600;
            position: relative;
            display: inline-block;
            font-family: 'Joan', serif;
        }
        
        .section-title:after {
            content: '';
            display: block;
            width: 60px;
            height: 3px;
            background-color: #E54E50;
            margin: 10px auto 0;
        }
        
        .contact-form-container {
            max-width: 800px;
            margin: 40px auto 0;
            padding: 40px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
        }
        
        .form-title {
            font-size: 28px;
            margin-bottom: 30px;
            color: #333;
            text-align: left;
            font-family: 'Joan', serif;
        }
        
        .form-row {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 20px;
            gap: 20px;
        }
        
        .form-group {
            flex: 1;
            min-width: 250px;
            text-align: left;
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: all 0.3s;
        }
        
        .form-control:focus {
            outline: none;
            border-color: #E54E50;
            box-shadow: 0 0 0 2px rgba(229, 78, 80, 0.1);
        }
        
        textarea.form-control {
            min-height: 120px;
            resize: vertical;
        }
        
        .submit-btn {
            background-color: #E54E50;
            color: #fff;
            border: none;
            padding: 14px 30px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 500;
            margin-top: 10px;
        }
        
        .submit-btn:hover {
            background-color: #d43e40;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(229, 78, 80, 0.2);
        }
        
        /* Contact Details Section */
        .contact-details {
            padding: 80px 40px;
            background-color: #f9f9f9;
            text-align: center;
        }
        
        .details-title {
            font-size: 42px;
            letter-spacing: 2px;
            margin-bottom: 50px;
            color: #333;
            text-transform: uppercase;
            font-weight: 300;
            font-family: 'Joan', serif;
        }
        
        .details-subtitle {
            font-size: 18px;
            color: #666;
            max-width: 700px;
            margin: 0 auto 60px;
            line-height: 1.6;
        }
        
        .details-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 40px;
            max-width: 1000px;
            margin: 0 auto;
        }
        
        .details-item {
            flex: 1;
            min-width: 200px;
            text-align: center;
            padding: 30px 20px;
        }
        
        .details-icon {
            width: 60px;
            height: 60px;
            margin: 0 auto 20px;
            display: block;
        }
        
        .details-icon svg {
            width: 100%;
            height: 100%;
            stroke: #E54E50;
            fill: none;
            stroke-width: 1.5;
            stroke-linecap: round;
            stroke-linejoin: round;
        }
        
        .details-label {
            font-size: 24px;
            margin-bottom: 15px;
            color: #333;
            font-weight: 500;
            font-family: 'Joan', serif;
        }
        
        .details-text {
            color: #666;
            line-height: 1.8;
        }
        
        .details-text a {
            color: #E54E50;
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .details-text a:hover {
            color: #d43e40;
            text-decoration: underline;
        }
        
        /* Location Section */
        .location-section {
            padding: 80px 40px;
            background-color: #fff;
            text-align: center;
        }
        
        .location-subtitle {
            font-size: 14px;
            color: #E54E50;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 10px;
            font-weight: 600;
        }
        
        .location-title {
            font-size: 38px;
            letter-spacing: 3px;
            margin-bottom: 20px;
            color: #333;
            text-transform: uppercase;
            font-weight: 300;
            font-family: 'Joan', serif;
        }
        
        .location-address {
            font-size: 18px;
            color: #666;
            margin-bottom: 40px;
        }
        
        .map-wrapper {
            max-width: 1000px;
            margin: 0 auto;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        }
        
        .map-wrapper iframe {
            width: 100%;
            height: 450px;
            border: none;
        }
        
        /* Responsive styles */
        @media (max-width: 992px) {
            .get-in-touch, .contact-details, .location-section {
                padding: 60px 30px;
            }
            
            .contact-form-container {
                padding: 30px;
            }
            
            .details-grid {
                gap: 30px;
            }
        }
        
        @media (max-width: 768px) {
            .get-in-touch, .contact-details, .location-section {
                padding: 50px 20px;
            }
            
            .section-title, .details-title, .location-title {
                font-size: 32px;
            }
            
            .form-title {
                font-size: 24px;
            }
            
            .details-item {
                flex-basis: calc(50% - 20px);
            }
            
            .map-wrapper iframe {
                height: 350px;
            }
        }
        
        @media (max-width: 576px) {
            .header {
                padding: 60px 20px;
            }
            
            .header h1 {
                font-size: 32px;
            }
            
            .get-in-touch, .contact-details, .location-section {
                padding: 40px 15px;
            }
            
            .contact-form-container {
                padding: 20px;
            }
            
            .section-title, .details-title, .location-title {
                font-size: 28px;
            }
            
            .details-item {
                flex-basis: 100%;
            }
            
            .map-wrapper iframe {
                height: 300px;
            }
        }
    </style>
</head>
<body>
        <!-- Navigation Bar -->
        <jsp:include page="header.jsp" />
    <!-- Header -->
    <div class="header-contact">
        <div class="header-overlay"></div>
        <h1>Contact Us</h1>
        <p class="tagline">"Turning your dream wedding into reality"</p>
    </div>
    
    <!-- Get in Touch Section -->
    <section class="get-in-touch">
        <h2 class="section-title">Get in Touch</h2>
        
        <div class="contact-form-container">
            <h3 class="form-title">Send Us a Message</h3>
            
            <form action="submitContact.jsp" method="post">
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label" for="fullname">Full Name</label>
                        <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Your full name" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="email">Email Address</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Your email address" required>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label" for="phone">Phone Number</label>
                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="Your phone number" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="eventType">Event Type</label>
                        <select class="form-control" id="eventType" name="eventType" required>
                            <option value="">Select Event Type</option>
                            <option value="Wedding">Wedding</option>
                            <option value="Engagement">Engagement</option>
                            <option value="Birthday">Birthday</option>
                            <option value="Corporate">Corporate Event</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label" for="message">Your Message</label>
                        <textarea class="form-control" id="message" name="message" placeholder="Tell us about your event..." rows="5" required></textarea>
                    </div>
                </div>
                
                <button type="submit" class="submit-btn">Send Message</button>
            </form>
        </div>
    </section>
    
    <!-- Contact Details Section -->
    <section class="contact-details">
        <h2 class="details-title">Contact Details</h2>
        <p class="details-subtitle">We're here to help you plan your perfect event. Reach out to us through any of the following channels.</p>
        
        <div class="details-grid">
            <div class="details-item">
                <div class="details-icon">
                    <svg viewBox="0 0 24 24">
                        <rect x="5" y="2" width="14" height="20" rx="2" ry="2"></rect>
                        <line x1="12" y1="18" x2="12" y2="18"></line>
                    </svg>
                </div>
                <h3 class="details-label">Phone</h3>
                <div class="details-text">
                    <p>+977 9841 234567</p>
                    <p>+977 9841 234568</p>
                </div>
            </div>
            
            <div class="details-item">
                <div class="details-icon">
                    <svg viewBox="0 0 24 24">
                        <path d="M12 2L2 7l10 5 10-5-10-5z"></path>
                        <path d="M2 17l10 5 10-5"></path>
                        <path d="M2 12l10 5 10-5"></path>
                    </svg>
                </div>
                <h3 class="details-label">Hours</h3>
                <div class="details-text">
                    <p>Monday - Saturday</p>
                    <p>9AM - 5PM</p>
                </div>
            </div>
            
            <div class="details-item">
                <div class="details-icon">
                    <svg viewBox="0 0 24 24">
                        <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                        <polyline points="22,6 12,13 2,6"></polyline>
                    </svg>
                </div>
                <h3 class="details-label">E-mail</h3>
                <div class="details-text">
                    <p><a href="mailto:info@paramparaevents.com">info@paramparaevents.com</a></p>
                    <p><a href="mailto:events@paramparaevents.com">events@paramparaevents.com</a></p>
                </div>
            </div>
            
            <div class="details-item">
                <div class="details-icon">
                    <svg viewBox="0 0 24 24">
                        <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                        <circle cx="12" cy="10" r="3"></circle>
                    </svg>
                </div>
                <h3 class="details-label">Address</h3>
                <div class="details-text">
                    <p>Kathmandu, Nepal</p>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Location Section -->
    <section class="location-section">
        <p class="location-subtitle">Where We Are?</p>
        <h2 class="location-title">Our Office</h2>
        <p class="location-address"> Kathmandu, Nepal</p>
        
        <div class="map-wrapper">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d56516.31625949266!2d85.29111337431642!3d27.70895594443863!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb198a307baabf%3A0xb5137c1bf18db1ea!2sKathmandu%2044600%2C%20Nepal!5e0!3m2!1sen!2sus!4v1650000000000!5m2!1sen!2sus" allowfullscreen="" loading="lazy"></iframe>
        </div>
    </section>
    <script src="${pageContext.request.contextPath}/scripts/scripts.js"></script>
	<jsp:include page="footer.jsp" />
</body>
</html>