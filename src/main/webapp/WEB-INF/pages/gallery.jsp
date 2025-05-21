<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wedding Photography Gallery</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Base styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Georgia", serif;
        }

        body {
            background-color: #1a1a1a;
            color: #333;
            width: 100%;
            overflow-x: hidden;
        }

        .container {
            width: 100%;
            background-color: #ffffff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
        }

        /* Hero section */
        .hero {
            position: relative;
            width: 100%;
            height: 40vh; /* Full viewport height */
            min-height: 200px;
            overflow: hidden;
        }

        .hero-image {
            width: 100%;
            height: 100%;
            opacity: 0.7;
            object-fit: cover;
        }

        .category-title {
            position:absolute;
            top: 100px;
            left: 600px;
            font-size: 72px; /* Larger for full-screen */
            color:#ffffff;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        /* Filter Categories - New Design */
        .filter-categories {
            display: flex;
            justify-content: center;
            gap: 20px;
            padding: 20px;
            background-color:transparent ;
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            flex-wrap: wrap;
        }

        .filter-button {
            padding: 15px 30px;
            border-radius: 30px;
            border: 1px solid #e0e0e0;
            background-color: transparent;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            color: #ffffff;
        }

        .filter-button.active {
            background-color: #1a1a1a;
            color: #ffffff;
            border-color: #1a1a1a;
        }

        .filter-button:hover:not(.active) {
            background-color: #e54e50;
            color: #ffffff;
            border-color: #e54e50;
        }

        /* Gallery section */
        .gallery-section {
            background-color: #e54e50;
            padding: 50px 5% 70px 5%; /* Increased bottom padding */
            position: relative;
        }

        .gallery-section::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 3px;
            background-color: #c1050b;
        }

        .gallery-title {
            font-size: 64px; /* Larger for full-screen */
            margin-bottom: 20px;
            color: #ffffff;
        }

        .gallery-subtitle {
            font-size: 24px; /* Larger for full-screen */
            color: #e0e0e0;
            margin-bottom: 40px;
            max-width: 800px;
        }

        .gallery-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); /* Responsive grid */
            grid-auto-rows: 300px;
            gap: 20px;
            margin-top: 30px;
            width: 100%;
        }

        .gallery-item {
            overflow: hidden;
            position: relative;
            cursor: pointer;
            border: 3px solid transparent;
            transition: border-color 0.3s, opacity 0.5s;
        }

        .gallery-item:hover {
            border-color: #ffffff;
        }

        .gallery-item.hidden {
            display: none;
        }

        /* Special items for larger displays */
        .gallery-item.large {
            grid-column: span 2;
            grid-row: span 2;
        }

        @media (min-width: 1200px) {
            .gallery-item:nth-child(2),
            .gallery-item:nth-child(7) {
                grid-column: span 2;
                grid-row: span 2;
            }
        }

        .gallery-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }

        .gallery-item:hover .gallery-image {
            transform: scale(1.1);
        }

        /* Category indicator dots */
        .category-indicator {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 40px;
        }

        .indicator-dot {
            width: 15px;
            height: 15px;
            border-radius: 50%;
            background-color: #e54e50;
            cursor: pointer;
            transition: all 0.3s;
        }

        .indicator-dot.active {
            background-color: #ffffff;
            transform: scale(1.2);
        }

        /* Additional styling with the color palette */
        .gallery-title::after {
            content: "";
            display: block;
            width: 100px;
            height: 4px;
            background-color: #ffffff;
            margin-top: 20px;
        }

        /* Responsive styles */
        @media (max-width: 1200px) {
            .category-title {
                font-size: 60px;
            }
            
            .gallery-title {
                font-size: 54px;
            }
        }

        @media (max-width: 992px) {
            .category-title {
                font-size: 50px;
            }
            
            .gallery-title {
                font-size: 48px;
            }
            
            .gallery-subtitle {
                font-size: 20px;
            }
            
            .hero {
                height: 80vh;
            }
        }

        @media (max-width: 768px) {
            .category-title {
                font-size: 40px;
                top: 30px;
                left: 30px;
            }
            
            .gallery-title {
                font-size: 42px;
            }
            
            .gallery-subtitle {
                font-size: 18px;
            }
            
            .filter-button {
                padding: 10px 20px;
                font-size: 14px;
            }
            
            .hero {
                height: 60vh;
            }
        }

        @media (max-width: 576px) {
            .category-title {
                font-size: 32px;
                top: 20px;
                left: 20px;
            }
            
            .gallery-title {
                font-size: 36px;
            }
            
            .gallery-subtitle {
                font-size: 16px;
            }
            
            .filter-categories {
                padding: 15px 10px;
            }
            
            .filter-button {
                padding: 8px 15px;
                font-size: 12px;
            }
            
            .hero {
                height: 50vh;
            }
            
            .gallery-grid {
                grid-template-columns: 1fr;
                grid-auto-rows: 250px;
            }
            
            .gallery-item {
                grid-column: span 1 !important;
                grid-row: span 1 !important;
            }
        }
    </style>
</head>
<body>
        <!-- Navigation Bar -->
        <jsp:include page="header.jsp" />
    <div class="container">
        <!-- Hero Section with Filter Categories -->
        <div class="hero">
            <img src="./Images/01.jpg" alt="Wedding Ceremony" class="hero-image">
            <h1 class="category-title">Gallery</h1>
            
            <div class="filter-categories">
                <button class="filter-button active" data-category="ALL">ALL</button>
                <button class="filter-button" data-category="BRATABANDHA">BRATABANDHA</button>
                <button class="filter-button" data-category="WEDDING">WEDDING</button>
                <button class="filter-button" data-category="PASNI">PASNI</button>
                <button class="filter-button" data-category="BEL BIBAHA">BEL BIBAHA</button>
            </div>
        </div>
        
        <!-- Gallery Section -->
        <div class="gallery-section">
            <h2 class="gallery-title">Collection</h2>
            <p class="gallery-subtitle">Every photo is a chapter in your love story—let's make it unforgettable.</p>
            
            <div class="gallery-grid">
                <!-- Gallery Images -->
                <div class="gallery-item" data-category="WEDDING">
                    <img src="${pageContext.request.contextPath}/resources/images/blogs//weddingphoto.jpeg" alt="Wedding Ceremony" class="gallery-image">
                </div>
                <div class="gallery-item large" data-category="WEDDING">
                    <img src="${pageContext.request.contextPath}/resources/images/blogs//couple set.jpeg" alt="Couple Portrait" class="gallery-image">
                </div>
                <div class="gallery-item" data-category="PASNI">
                    <img src="${pageContext.request.contextPath}/resources/images/blogs/Rice Feeding Ceremony in Nepal (Pasni) - Weaning Ceremony.jpeg" alt="Rice Feeding Ceremony" class="gallery-image">
                </div>
                <div class="gallery-item" data-category="WEDDING">
                    <img src="${pageContext.request.contextPath}/resources/images/blogs/Weddinghands.jpeg" alt="Wedding Rituals" class="gallery-image">
                </div>
                <div class="gallery-item" data-category="BRATABANDHA">
                    <img src="${pageContext.request.contextPath}/resources/images/blogs//Nepali culture_ Coming of age (Bratabandha)_.jpeg" alt="Traditional Ceremony" class="gallery-image">
                </div>
                <div class="gallery-item" data-category="WEDDING">
                    <img src="${pageContext.request.contextPath}/resources/images/blogs//Limbu _ yakthung couple 💐.jpeg" alt="Limbu Yakthung Couple" class="gallery-image">
                </div>
                <div class="gallery-item large" data-category="WEDDING">
                    <img src="${pageContext.request.contextPath}/resources/images/blogs//outdoorwedding.jpeg" alt="Outdoor Ceremony" class="gallery-image">
                </div>
                <div class="gallery-item" data-category="PASNI">
                    <img src="${pageContext.request.contextPath}/resources/images/blogs//Maternity Photographer _ Sutro Baths, San Francisco.jpeg" alt="Maternity Photoshoot" class="gallery-image">
                </div>
                <div class="gallery-item" data-category="WEDDING">
                    <img src="${pageContext.request.contextPath}/resources/images/blogs//02.jpeg" alt="Traditional Attire" class="gallery-image">
                </div>
                <div class="gallery-item" data-category="WEDDING">
                    <img src="${pageContext.request.contextPath}/resources/images/blogs/_ (1).jpeg" alt="Wedding Jewelry" class="gallery-image">
                </div>
                <div class="gallery-item" data-category="BEL BIBAHA">
                    <img src="${pageContext.request.contextPath}/resources/images/blogs/Bel Bibaha.jpeg" alt="Bel Bibaha Ceremony" class="gallery-image">
                </div>
                <div class="gallery-item" data-category="WEDDING">
                    <img src="${pageContext.request.contextPath}/resources/images/blogs/Photography By Gagan.jpeg" alt="Wedding Decorations" class="gallery-image">
                </div>
            </div>
            
            <div class="category-indicator">
                <span class="indicator-dot active" data-page="1"></span>
                <span class="indicator-dot" data-page="2"></span>
                <span class="indicator-dot" data-page="3"></span>
                <span class="indicator-dot" data-page="4"></span>
                <span class="indicator-dot" data-page="5"></span>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Get DOM elements
            const filterButtons = document.querySelectorAll('.filter-button');
            const galleryItems = document.querySelectorAll('.gallery-item');
            const indicatorDots = document.querySelectorAll('.indicator-dot');
            
            // State variables
            let activeCategory = 'ALL';
            let currentPage = 1;
            
            // Initialize the gallery
            updateGallery();
            
            // Filter button click event
            filterButtons.forEach(button => {
                button.addEventListener('click', function() {
                    // Remove active class from all buttons
                    filterButtons.forEach(btn => btn.classList.remove('active'));
                    
                    // Add active class to clicked button
                    this.classList.add('active');
                    
                    // Update active category
                    activeCategory = this.getAttribute('data-category');
                    
                    // Reset to first page when changing categories
                    currentPage = 1;
                    updateIndicators();
                    
                    // Update gallery
                    updateGallery();
                });
            });
            
            // Indicator dot click event
            indicatorDots.forEach(dot => {
                dot.addEventListener('click', function() {
                    currentPage = parseInt(this.getAttribute('data-page'));
                    updateIndicators();
                    updateGallery();
                });
            });
            
            // Update gallery based on active category and current page
            function updateGallery() {
                // Show/hide items based on category
                galleryItems.forEach(item => {
                    const itemCategory = item.getAttribute('data-category');
                    
                    if (activeCategory === 'ALL' || itemCategory === activeCategory) {
                        item.classList.remove('hidden');
                    } else {
                        item.classList.add('hidden');
                    }
                });
            }
            
            // Update indicator dots
            function updateIndicators() {
                indicatorDots.forEach(dot => {
                    const page = parseInt(dot.getAttribute('data-page'));
                    
                    if (page === currentPage) {
                        dot.classList.add('active');
                    } else {
                        dot.classList.remove('active');
                    }
                });
            }
        });
    </script>
</body>
</html>