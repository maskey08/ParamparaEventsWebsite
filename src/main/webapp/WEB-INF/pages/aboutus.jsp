<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Parampara Events</title>
    <style>
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', 'Joan', sans-serif;
            line-height: 1.6;
            color: #333;
        }

        h1, h2, h3, h4, h5, h6 {
            margin-bottom: 0.5rem;
            font-weight: 600;
        }

        p {
            margin-bottom: 1rem;
        }

        img {
            max-width: 100%;
            height: auto;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Hero Section */
        .hero {
            position: relative;
            background-image: url('${pageContext.request.contextPath}/resources/images/blogs/Weddinghands.jpeg');
            background-size: cover;
            background-position: center;
            color: #ffffff;
            padding: 120px 20px;
            text-align: center;
        }

        .hero-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            z-index: 1;
        }

        .hero-content {
            position: relative;
            z-index: 2;
        }

        .hero h1 {
            font-size: 3rem;
            margin-bottom: 10px;
        }

        .hero p {
            font-size: 1.2rem;
            max-width: 800px;
            margin: 30px auto;
            line-height: 1.6;
        }

        /* About Section */
        .about {
            background-color: #E54E50;
            color: #ffffff;
            padding: 40px 20px;
        }

        .about-content {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            gap: 30px;
        }

        .about-image {
            flex: 0 0 300px;
        }

        .about-image img {
            width: 100%;
            border-radius: 10px;
        }

        .about-text {
            flex: 1 1 500px;
            max-width: 600px;
        }

        .about-text p {
            font-size: 1.1rem;
            line-height: 1.6;
        }

        .btn {
            display: inline-block;
            background-color: #C1050B;
            color: #ffffff;
            border: none;
            padding: 12px 24px;
            border-radius: 30px;
            font-size: 1rem;
            cursor: pointer;
            text-decoration: none;
            margin-top: 20px;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background-color: #a00409;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        /* Stats Section */
        .stats {
            background-color: #ffffff;
            padding: 60px 20px;
        }

        .stats-content {
            display: grid;
            grid-template-columns: 1fr 2fr 1fr;
            gap: 30px;
            align-items: center;
        }

        .stat-item {
            display: flex;
            flex-direction: column;
            padding: 20px;
        }

        .stat-item h2 {
            color: #333;
            margin: 0 0 10px 0;
            font-size: 2.5rem;
            font-weight: normal;
        }

        .stat-item p {
            color: #333;
            font-size: 1.1rem;
        }

        .stat-item img {
            width: 100%;
            border-radius: 20px;
            margin-top: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .stat-left {
            text-align: left;
        }

        .stat-center {
            text-align: center;
            padding: 0 40px;
        }

        .stat-right {
            text-align: right;
        }

        /* Team Section */
        .team {
            background-color: #E54E50;
            padding: 60px 20px 120px 20px;
            position: relative;
            overflow: hidden;
            color: #ffffff;
        }

        .team-wave {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 150px;
            background: linear-gradient(to bottom, transparent, #C1050B);
            transform: skewY(-3deg) translateY(50px);
            z-index: 1;
        }

        .team-content {
            position: relative;
            z-index: 2;
            display: flex;
            flex-wrap: wrap;
        }

        .team-title {
            flex: 0 0 300px;
            padding-right: 20px;
        }

        .team-title h2 {
            font-size: 2.5rem;
            line-height: 1.2;
            margin-top: 20px;
        }

        .team-members {
            flex: 1 1 700px;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            gap: 20px;
            align-items: center;
        }

        .team-member {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 10px;
            height: 150px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .team-member:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .team-member img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #E54E50;
        }

        .team-member h3 {
            color:#333;
            margin: 10px 0 0 0;
            font-size: 0.9rem;
        }

        /* FAQ Section */
        .faq {
            background-color: #f8f8f8;
            padding: 80px 20px;
            color: #333;
        }

        .faq h2 {
            font-size: 2.5rem;
            margin-bottom: 40px;
            text-align: center;
            position: relative;
            font-weight: 600;
        }

        .faq h2:after {
            content: '';
            display: block;
            width: 60px;
            height: 3px;
            background-color: #E54E50;
            margin: 15px auto 0;
        }

        .faq-content {
            max-width: 800px;
            margin: 0 auto;
        }

        .faq-item {
            background-color: #ffffff;
            border-radius: 8px;
            margin-bottom: 16px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .faq-item:hover {
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transform: translateY(-2px);
        }

        .faq-question {
            padding: 20px 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
            font-weight: 500;
            color: #333;
            border-left: 4px solid transparent;
            transition: all 0.3s ease;
        }

        .faq-question:hover {
            border-left-color: #E54E50;
        }

        .faq-toggle {
            width: 24px;
            height: 24px;
            border-radius: 50%;
            background-color: #f0f0f0;
            color: #E54E50;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            transition: all 0.3s ease;
        }

        .faq-answer {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease;
            padding: 0 25px;
            color: #666;
            line-height: 1.6;
        }

        .faq-item.active .faq-question {
            border-left-color: #E54E50;
            color: #E54E50;
        }

        .faq-item.active .faq-toggle {
            background-color: #E54E50;
            color: white;
            transform: rotate(45deg);
        }

        .faq-item.active .faq-answer {
            max-height: 300px;
            padding: 0 25px 20px;
        }

        /* Responsive Styles */
        @media (max-width: 992px) {
            .stats-content {
                grid-template-columns: 1fr;
                text-align: center;
            }
            
            .stat-left, .stat-right {
                text-align: center;
            }
        }

        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.5rem;
            }

            .team-title {
                flex: 0 0 100%;
                text-align: center;
                padding-right: 0;
                margin-bottom: 30px;
            }

            .team-members {
                flex-wrap: wrap;
                justify-content: center;
            }

            .faq h2 {
                font-size: 2rem;
            }
        }

        @media (max-width: 480px) {
            .hero h1 {
                font-size: 2rem;
            }

            .team-members {
                grid-template-columns: repeat(2, 1fr);
            }

            .faq-question {
                padding: 15px 20px;
                font-size: 0.95rem;
            }
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
        <!-- Navigation Bar -->
        <jsp:include page="header.jsp" />
    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-overlay"></div>
        <div class="hero-content container">
            <h1>About</h1>
            <h1>Parampara Events</h1>
            <p>
                We blend tradition with modern elegance to design events that feel both rooted and
                refreshing. Whether it's a vibrant Teej celebration or a sacred Nwaran ceremony, we turn
                your vision into an unforgettable experience
            </p>
        </div>
    </section>

    <!-- About Section -->
    <section class="about">
        <div class="about-content container">
            <div class="about-image">
                <img src="./Images/teaminaction.jpeg" alt="Traditional henna design">
            </div>
            <div class="about-text">
                <p>
                    Founded in 2015, EventPlan began as a small start-up with a big dream: to revolutionize
                    the corporate event planning industry. Over the years, we've grown and evolved, achieving
                    numerous milestones and building lasting relationships with our clients and partners.
                </p>
                <a href="#" class="btn">Explore our services</a>
            </div>
            <div class="about-image">
                <img src="${pageContext.request.contextPath}/resources/images/blogs/environment.jpeg" alt="Traditional wedding ceremony">
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats">
        <div class="stats-content container">
            <div class="stat-item stat-left">
                <h2>More than</h2>
                <h2>1k events</h2>
                <p>successfully organized</p>
                <img src="./Images/entrance.jpeg" alt="Event venue">
            </div>
            
            <div class="stat-item stat-center">
                <p>
                    To celebrate Nepali traditions with heartfelt planning honoring every ritual with care,
                    creativity, and a lifetime experience you'll cherish forever.
                </p>
            </div>
            
            <div class="stat-item stat-right">
                <h2>90%</h2>
                <p>of our client retention for our services</p>
                <img src="./Images/outdoorwedding.jpeg" alt="Traditional celebration">
            </div>
        </div>
    </section>

    <!-- Team Section -->
    <section class="team">
        <div class="team-wave"></div>
        <div class="team-content container">
            <div class="team-title">
                <h2>Meet<br>our<br>team</h2>
            </div>
            <div class="team-members">
                <!-- First row -->
                <div class="team-member">
                    <img src="${pageContext.request.contextPath}/resources/images/blogs/Pragun.jpg" alt="Team Member 1">
                    <h3>Pragun Raj Maskey</h3>
                </div>
                <div class="team-member">
                    <img src="${pageContext.request.contextPath}/resources/images/blogs/Pranjali.jpg" alt="Team Member 2">
                    <h3>Pranjali Prasai</h3>
                </div>
                <!-- Second row -->
                <div class="team-member">
                    <img src="${pageContext.request.contextPath}/resources/images/blogs/Sneha.jpg" alt="Team Member 3">
                    <h3>Sneha Sapkota</h3>
                </div>
                <div class="team-member">
                    <img src="${pageContext.request.contextPath}/resources/images/blogs/Santosh.jpg" alt="Team Member 4">
                    <h3>Santosh Lamichhane</h3>
                </div>
                <div class="team-member">
                    <img src="${pageContext.request.contextPath}/resources/images/blogs/Krijal.JPG" alt="Team Member 5">
                    <h3>Krijal Maharjan</h3>
                </div>
            </div>
        </div>
    </section>

    <!-- FAQ Section -->
    <section class="faq">
        <div class="container">
            <h2>Frequently Asked Questions</h2>
            <div class="faq-content">
                <div class="faq-item">
                    <div class="faq-question">
                        <span>How do you ensure succession of an event?</span>
                        <span class="faq-toggle">+</span>
                    </div>
                    <div class="faq-answer">
                        <p>We ensure the success of every event through meticulous planning, experienced coordination, and attention to detail. Our team follows a comprehensive checklist and timeline, conducts multiple pre-event inspections, and maintains constant communication with all vendors and stakeholders to ensure flawless execution.</p>
                    </div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        <span>Do you offer customized event packages?</span>
                        <span class="faq-toggle">+</span>
                    </div>
                    <div class="faq-answer">
                        <p>Yes, we specialize in creating bespoke event packages tailored to your specific requirements and budget. Our team works closely with you to understand your vision, preferences, and cultural needs to design a personalized experience that exceeds your expectations while respecting your financial parameters.</p>
                    </div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        <span>How far in advance should I book your services?</span>
                        <span class="faq-toggle">+</span>
                    </div>
                    <div class="faq-answer">
                        <p>For major events like weddings and large corporate functions, we recommend booking 6-12 months in advance to secure your preferred date and venue. For smaller events, 3-6 months is typically sufficient. However, we also accommodate last-minute requests when possible, depending on our availability and the complexity of your event.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        // FAQ Accordion Functionality
        document.addEventListener('DOMContentLoaded', function() {
            const faqItems = document.querySelectorAll('.faq-item');
            
            faqItems.forEach(item => {
                const question = item.querySelector('.faq-question');
                
                question.addEventListener('click', () => {
                    // Close all other items
                    faqItems.forEach(otherItem => {
                        if (otherItem !== item && otherItem.classList.contains('active')) {
                            otherItem.classList.remove('active');
                        }
                    });
                    
                    // Toggle current item
                    item.classList.toggle('active');
                });
            });
        });
    </script>
</body>
</html>