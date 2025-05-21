<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Event Planning Services</title>
        <style>
          * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Arial", sans-serif;
          }

          html {
            scroll-behavior: smooth;
          }

          :root {
            --primary-color: #e54e50;
            --secondary-color: #ffffff;
            --accent-color: #c1050b;
            --dark-accent: #a00409;
            --text-color: #333;
            --light-gray: #e0e0e0;
            --medium-gray: #8a8a8a;
            --dark-gray: #555;
            --white: #fff;
            --shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            --bg-color: #f8f8f8;
          }

          body {
            background-color: var(--bg-color);
            color: var(--text-color);
            line-height: 1.6;
          }

          a {
            text-decoration: none;
            color: inherit;
          }

          button {
            cursor: pointer;
            border: none;
            outline: none;
          }

          /* ===== HERO BANNER ===== */
          .hero-banner {
            height: 400px;
            background-color: var(--primary-color);
            margin-bottom: 0;
            background-image: linear-gradient(rgba(0, 0, 0, 0.3),
              rgba(0, 0, 0, 0.3)),
            url("${pageContext.request.contextPath}/resources/images/services/banner.jpg");
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: var(--white);
            position: relative;
            z-index: 1;
            cursor: pointer;
          }

          .hero-content {
            max-width: 800px;
            padding: 0 2rem;
          }

          .hero-content h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
          }

          .hero-content p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
          }

          .hero-btn {
            background-color: var(--accent-color);
            color: var(--white);
            padding: 0.8rem 2rem;
            border-radius: 2rem;
            font-weight: 600;
            transition: all 0.3s;
            border: 2px solid var(--accent-color);
            box-shadow: 0 4px 8px rgba(193, 5, 11, 0.3);
          }

          .hero-btn:hover {
            background-color: transparent;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(193, 5, 11, 0.3);
            color: var(--white);
          }

          /* ===== TABS SECTION ===== */
          .tabs-section {
            position: relative;
            z-index: 2;
            max-width: 1000px;
            margin: -50px auto 0;
            padding: 0 2rem;
          }

          /* ===== SERVICES SECTION ===== */
          .services-section {
            padding: 2rem 2rem 3rem;
            max-width: 1200px;
            margin: 0 auto;
          }

          .services-tabs {
            background-color: var(--white);
            border-radius: 1rem;
            padding: 1rem;
            margin-bottom: 2rem;
            box-shadow: var(--shadow);
            border: 1px solid var(--light-gray);
          }

          .tab-buttons {
            display: flex;
            border-bottom: 1px solid var(--light-gray);
            padding-bottom: 1rem;
            margin-bottom: 1rem;
            flex-wrap: wrap;
          }

          .tab-btn {
            background: none;
            border: none;
            padding: 0.5rem 1rem;
            margin-right: 1rem;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--medium-gray);
            transition: all 0.3s;
            cursor: pointer;
          }

          .tab-btn:hover {
            color: var(--primary-color);
          }

          .tab-btn.active {
            color: var(--text-color);
            position: relative;
            font-weight: 600;
          }

          .tab-btn.active::after {
            content: "";
            position: absolute;
            bottom: -1rem;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: var(--primary-color);
          }

          .search-filter {
            display: flex;
            justify-content: space-between;
            align-items: center;
          }

          .search-bar {
            display: flex;
            align-items: center;
            border: 1px solid var(--light-gray);
            border-radius: 2rem;
            padding: 0.5rem 1rem;
            width: 200px;
          }

          .search-bar input {
            border: none;
            outline: none;
            width: 100%;
          }

          .search-btn {
            background: none;
            border: none;
            cursor: pointer;
          }

          .price-range {
            display: flex;
            align-items: center;
            width: 50%;
          }

          .price-label {
            font-size: 0.8rem;
            color: var(--medium-gray);
          }

          .slider-container {
            position: relative;
            width: 60%;
            height: 5px;
            margin: 0 1rem;
            background-color: var(--light-gray);
            border-radius: 5px;
          }

          .slider-track {
            position: absolute;
            height: 100%;
            background-color: var(--primary-color);
            border-radius: 5px;
            left: 8%;
            right: 8%;
          }

          .slider {
            position: absolute;
            top: -7px;
            width: 100%;
            height: 20px;
            -webkit-appearance: none;
            background: transparent;
            pointer-events: none;
          }

          .slider::-webkit-slider-thumb {
            -webkit-appearance: none;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background: var(--accent-color);
            cursor: pointer;
            pointer-events: auto;
            border: 2px solid var(--white);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            transition: transform 0.2s, box-shadow 0.2s;
          }

          .slider::-moz-range-thumb {
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background: var(--accent-color);
            cursor: pointer;
            pointer-events: auto;
            border: 2px solid var(--white);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            transition: transform 0.2s, box-shadow 0.2s;
          }

          .slider::-webkit-slider-thumb:hover {
            transform: scale(1.1);
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.3);
          }

          .slider::-moz-range-thumb:hover {
            transform: scale(1.1);
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.3);
          }

          #min-price {
            z-index: 1;
          }

          #max-price {
            z-index: 2;
          }

          .price-label {
            font-size: 0.8rem;
            color: var(--medium-gray);
            min-width: 70px;
            text-align: center;
            transition: color 0.3s;
          }

          .section-title {
            text-align: center;
            color: var(--primary-color);
            margin: 2rem 0 0.5rem;
            font-size: 1.8rem;
            font-weight: 700;
          }

          .section-description {
            text-align: center;
            color: var(--medium-gray);
            margin-bottom: 2rem;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            font-size: 0.9rem;
          }

          /* ===== Original SERVICE CARDS (for the top image grid) ===== */
          .service-cards {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 1rem;
            margin-bottom: 2rem;
          }

          .service-card {
            background-color: var(--light-gray);
            border-radius: 1rem;
            height: 120px;
            background-image: linear-gradient(45deg,
                rgba(255, 255, 255, 0.2),
                rgba(255, 255, 255, 0));
            transition: transform 0.3s, box-shadow 0.3s;
          }

          .service-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(229, 78, 80, 0.15);
            cursor: pointer;
          }

          .card-link-wrapper:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
            cursor: pointer;
          }

          /* ===== CATEGORY ICONS ===== */
          .category-icons {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            margin-bottom: 2rem;
            padding: 1rem 0;
            border-top: 1px solid var(--light-gray);
            border-bottom: 1px solid var(--light-gray);
          }

          .category {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            width: 12.5%;
            margin-bottom: 1rem;
          }

          .icon-c {
            width: 60px;
            height: 60px;
            background-color: var(--light-gray);
            border-radius: 50%;
            margin-bottom: 0.8rem;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: all 0.3s;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
          }
          
          .category:hover .icon-c {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(229, 78, 80, 0.3);
            background-color: var(--primary-color);
          }

          .category span {
            font-size: 0.8rem;
            color: var(--text-color);
            font-weight: 500;
            transition: color 0.3s;
          }

          .category:hover span {
            color: var(--primary-color);
          }

          /* ===== CTA SECTION ===== */
          .cta-section {
            background-color: var(--white);
            border-radius: 1rem;
            padding: 2rem;
            text-align: center;
            margin-bottom: 2rem;
            box-shadow: var(--shadow);
          }

          .cta-section h3 {
            margin-bottom: 0.5rem;
            font-size: 1.2rem;
          }

          .cta-section p {
            color: var(--medium-gray);
            margin-bottom: 1.5rem;
            font-size: 0.9rem;
          }

          .book-now-btn {
            background-color: var(--accent-color);
            color: var(--white);
            padding: 0.8rem 2rem;
            border-radius: 2rem;
            font-weight: 600;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(193, 5, 11, 0.3);
          }

          .book-now-btn:hover {
            background-color: var(--dark-accent);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(193, 5, 11, 0.4);
          }

          .book-now-btn:active {
            transform: translateY(-1px);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
          }

          .book-now-btn::after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.2);
            transform: scaleX(0);
            transform-origin: right;
            transition: transform 0.3s;
            z-index: -1;
          }

          .book-now-btn:hover::after {
            transform: scaleX(1);
            transform-origin: left;
          }

          /* ===== VENUE, DECORATION, AND OTHER SERVICE CATEGORY SECTIONS ===== */
          .venue-section,
          .decoration-section {
            margin-bottom: 3rem;
            width: 100%;
          }

          .venue-cards,
          .decoration-cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 1.5rem;
            width: 100%;
          }

          .venue-section .venue-card {}

          .section-header {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
          }

          .section-header .icon {
            margin-right: 1rem;
            margin-bottom: 0;
          }

          .section-header h3 {
            flex-grow: 1;
          }

          .view-all {
            background-color: var(--primary-color);
            color: var(--white);
            padding: 0.3rem 1rem;
            border-radius: 2rem;
            font-size: 0.8rem;
            transition: all 0.3s;
          }

          .view-all:hover {
            background-color: var(--accent-color);
            transform: translateY(-2px);
            box-shadow: 0 3px 8px rgba(193, 5, 11, 0.3);
          }

          .card-link-wrapper {
            display: block;
            text-decoration: none;
            color: inherit;
            border-radius: 1rem;
            overflow: hidden;
            background-color: var(--white);
            box-shadow: var(--shadow);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
          }

          .card-image {
            height: 180px;
            background-color: var(--light-gray);
            border-radius: 1rem 1rem 0 0;
            background-size: cover;
            background-position: center;
          }

          .card-info {
            padding: 1rem;
            position: relative;
            min-height: 130px;
            padding-top: 1.5rem;
          }

          .card-info h4 {
            margin-bottom: 0.5rem;
            font-size: 1rem;
            color: var(--text-color);
          }

          .card-info .price {
            color: var(--accent-color);
            font-size: 0.95rem;
            font-weight: bold;
            display: block;
            margin-bottom: 0.5rem;
            margin-top: 0.2rem;
          }

          .price {
            color: var(--medium-gray);
            font-size: 0.9rem;
            display: block;
            margin-bottom: 0.5rem;
            margin-top: 0.2rem;
          }

          .service-type-label {
            display: inline-block;
            background-color: var(--primary-color);
            color: var(--white);
            padding: 0.2rem 0.6rem;
            border-radius: 0.3rem;
            font-size: 0.7rem;
            font-weight: 600;
            position: absolute;
            left: 1rem;
            top: -0.8rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
          }

          .service-description-preview {
            font-size: 0.85rem;
            color: var(--dark-gray);
            margin-bottom: 0.8rem;
            height: 40px;
            line-height: 1.3;
            overflow: hidden;
          }

          .select-btn {
            display: inline-block;
            background-color: var(--primary-color);
            color: var(--white);
            padding: 0.3rem 0.8rem;
            border-radius: 0.3rem;
            font-size: 0.8rem;
            font-weight: 600;
            position: absolute;
            right: 1rem;
            bottom: 1rem;
            transition: all 0.3s;
            cursor: pointer;
            border: none;
            box-shadow: 0 2px 4px rgba(193, 5, 11, 0.2);
          }

          .select-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 3px 8px rgba(193, 5, 11, 0.3);
            background-color: var(--accent-color);
          }

          /* Footer related styles */
          .social-icon {
            width: 30px;
            height: 30px;
            background-color: var(--light-gray);
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-right: 0.5rem;
            font-size: 0.8rem;
            transition: background-color 0.3s;
          }

          .social-icon:hover {
            background-color: var(--primary-color);
            color: var(--white);
          }

          .copyright {
            text-align: center;
            color: var(--medium-gray);
            font-size: 0.8rem;
            padding-top: 1rem;
            border-top: 1px solid var(--light-gray);
          }

          /* ===== RESPONSIVE STYLES ===== */
          /* ===== TABLET STYLES (768px - 1023px) ===== */
          @media screen and (max-width: 1023px) {

            .hero-content h1 {
              font-size: 2.5rem;
            }

            .hero-content p {
              font-size: 1.1rem;
            }

            .tabs-section {
              margin-top: -40px;
            }

            .service-cards {
              grid-template-columns: repeat(3, 1fr);
            }

            .category-icons {
              flex-wrap: wrap;
              justify-content: center;
            }

            .category {
              width: 33.33%;
              margin-bottom: 1rem;
            }

            .venue-cards,
            .decoration-cards {
              grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            }
          }

          /* ===== MOBILE STYLES (up to 767px) ===== */
          @media screen and (max-width: 767px) {

            .hero-banner {
              height: 350px;
            }

            .hero-content h1 {
              font-size: 2rem;
            }

            .hero-content p {
              font-size: 1rem;
            }

            .tabs-section {
              margin-top: -30px;
            }

            .services-section {
              padding: 0 1rem 2rem;
            }

            .search-filter {
              flex-direction: column;
            }

            .search-bar {
              width: 100%;
              margin-bottom: 1.5rem;
            }

            .price-range {
              width: 100%;
              display: flex;
              justify-content: space-between;
              align-items: center;
            }

            .slider-container {
              width: 70%;
            }

            .price-label {
              min-width: 60px;
              font-size: 0.75rem;
            }

            .service-cards {
              grid-template-columns: repeat(2, 1fr);
            }

            .category {
              width: 50%;
            }

            .venue-cards,
            .decoration-cards {
              grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
            }

            .cta-section {
              padding: 1.5rem 1rem;
            }
          }

          /* ===== SMALL MOBILE STYLES (up to 480px) ===== */
          @media screen and (max-width: 480px) {

            .hero-banner {
              height: 300px;
            }

            .hero-content h1 {
              font-size: 1.5rem;
            }

            .hero-content p {
              font-size: 0.9rem;
              margin-bottom: 1.5rem;
            }

            .hero-btn {
              padding: 0.6rem 1.5rem;
              font-size: 0.9rem;
            }

            .tabs-section {
              margin-top: -20px;
            }

            .service-cards {
              grid-template-columns: 1fr;
            }

            .category {
              width: 50%;
            }

            .venue-cards,
            .decoration-cards {
              grid-template-columns: 1fr;
            }

            .tab-buttons {
              justify-content: center;
            }

            .tab-btn {
              margin: 0.3rem 0.5rem;
              font-size: 0.9rem;
              padding: 0.4rem 0.8rem;
            }

            .tab-btn.active::after {
              bottom: -0.5rem;
              height: 3px;
            }

            .section-header {
              flex-direction: column;
              text-align: center;
            }

            .section-header .icon {
              margin-right: 0;
              margin-bottom: 0.5rem;
            }

            .section-header h3 {
              margin-bottom: 0.5rem;
            }

            .card-link-wrapper .card-image {
              height: 200px;
            }
          }
        </style>
      </head>

      <body>
        <!-- Navigation Bar -->
        <jsp:include page="header.jsp" />

        <!-- Hero Banner -->
        <section class="hero-banner">
          <div class="hero-content">
            <h1>Create Unforgettable Events</h1>
            <p>Your one-stop solution for all event planning needs</p>
            <button class="hero-btn" id="explore-btn">Explore Services</button>
          </div>
        </section>

        <div class="main-container" style="max-width: 1200px; margin: 0 auto; padding: 0 20px; width: 100%;">
          <!-- Tabs Section (Overlapping with Hero) -->
          <section class="tabs-section" id="services">
            <div class="services-tabs">
              <div class="tab-buttons">
                <button class="tab-btn active" data-type="all">All Services</button>
                <button class="tab-btn" data-type="venue">Venues</button>
                <button class="tab-btn" data-type="decoration">Decorations</button>
                <button class="tab-btn" data-type="photography">Photography</button>
                <button class="tab-btn" data-type="entrance gate">Entrance Gates</button>
                <button class="tab-btn" data-type="stage">Stages</button>
                <button class="tab-btn" data-type="makeup artist">Makeup Artists</button>
                <button class="tab-btn" data-type="event host">Event Hosts</button>
              </div>
              <div class="search-filter">
                <div class="search-bar">
                  <input type="text" placeholder="Search" id="search-input" />
                  <button class="search-btn" id="search-btn">🔍</button>
                </div>

                <div class="price-range">
                  <span class="price-label" id="min-price-label">NPR 2K</span>
                  <div class="slider-container">
                    <div class="slider-track" id="price-track"></div>
                    <input type="range" min="2000" max="25000" step="1000" value="2000" class="slider" id="min-price" />
                    <input type="range" min="2000" max="25000" step="1000" value="25000" class="slider"
                      id="max-price" />
                  </div>
                  <span class="price-label" id="max-price-label">NPR 25K</span>
                </div>
              </div>
            </div>
          </section>
          <!-- Services Section -->
          <section class="services-section" style="padding-bottom: 0px">
            <h2 class="section-title">OUR SERVICES</h2>
            <p class="section-description">
              Slide text for your offer as it is given. What is excellent? What is so
              nice? Why I find what your might be so nice to have here?
            </p>

            <!-- No Results Message (hidden by default) -->
            <div id="no-results-message"
              style="display: none; text-align: center; padding: 30px; background-color: #f9f9f9; border-radius: 10px; margin: 20px 0;">
              <h3 style="color: var(--medium-gray);">No services match your filters</h3>
              <p style="color: var(--medium-gray);">Try adjusting your search criteria or price range</p>
              <button id="reset-filters-btn"
                style="background-color: var(--primary-color); color: white; border: none; padding: 8px 15px; border-radius: 20px; margin-top: 10px; cursor: pointer;">Reset
                Filters</button>
            </div>
            <!-- Service Cards Grid -->
            <div class="service-cards">
              <div class="service-card" style="position: relative; border-radius: 1rem; margin-bottom: 2rem">
                <img src="${pageContext.request.contextPath}/resources/images/services/weeding.jpg"
                  alt="Wedding Service" style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            " />
              </div>
              <div class="service-card" style="position: relative; border-radius: 1rem; margin-bottom: 2rem">
                <img src="${pageContext.request.contextPath}/resources/images/services/pasni.jpg" alt="Pasni Service"
                  style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            " />
              </div>
              <div class="service-card" style="position: relative; border-radius: 1rem; margin-bottom: 2rem">
                <img src="${pageContext.request.contextPath}/resources/images/services/haldi.jpg" alt="Haldi Service"
                  style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            " />
              </div>
              <div class="service-card" style="position: relative; border-radius: 1rem; margin-bottom: 2rem">
                <img src="${pageContext.request.contextPath}/resources/images/services/Mehendi.jpg"
                  alt="Mehendi Service" style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            " />
              </div>
              <div class="service-card" style="position: relative; border-radius: 1rem; margin-bottom: 2rem">
                <img src="${pageContext.request.contextPath}/resources/images/services/gunyocholi.jpg"
                  alt="Gunyo Choli Service" style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            " />
              </div>
            </div>
            <div class="service-cards">
              <div class="service-card" style="position: relative; border-radius: 1rem; margin-bottom: 2rem">
                <img src="${pageContext.request.contextPath}/resources/images/services/babyshower.jpg"
                  alt="Baby Shower Service" style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            " />
              </div>
              <div class="service-card" style="position: relative; border-radius: 1rem; margin-bottom: 2rem">
                <img src="${pageContext.request.contextPath}/resources/images/services/belbiwaha1.jpg"
                  alt="Bel Biwaha Service" style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            " />
              </div>
              <div class="service-card" style="position: relative; border-radius: 1rem; margin-bottom: 2rem">
                <img src="${pageContext.request.contextPath}/resources/images/services/weedingproposal.jpg"
                  alt="Wedding Proposal Service" style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            " />
              </div>
              <div class="service-card" style="position: relative; border-radius: 1rem; margin-bottom: 2rem">
                <img src="${pageContext.request.contextPath}/resources/images/services/bartamandha.webp"
                  alt="Bartamandha Service" style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            " />
              </div>
              <div class="service-card" style="position: relative; border-radius: 1rem; margin-bottom: 2rem">
                <img src="${pageContext.request.contextPath}/resources/images/services/bachelorpart.jpg"
                  alt="Bachelor Party Service" style="
              width: 100%;
              height: 250px;
              object-fit: cover;
              border-radius: 1rem;
            " />
              </div>
            </div>


            <!-- Category Icons -->
            <div class="category-icons">
              <div class="category">
                <div class="icon-c venue-icon"></div>
                <span>Venues</span>
              </div>
              <div class="category">
                <div class="icon-c decoration-icon"></div>
                <span>Decorations</span>
              </div>
              <div class="category">
                <div class="icon-c photography-icon"></div>
                <span>Photographers</span>
              </div>
              <div class="category">
                <div class="icon-c videography-icon"></div>
                <span>Videographers</span>
              </div>
              <div class="category">
                <div class="icon-c gate-icon"></div>
                <span>Entrance Gates</span>
              </div>
              <div class="category">
                <div class="icon-c stage-icon"></div>
                <span>Stages</span>
              </div>
              <div class="category">
                <div class="icon-c makeup-icon"></div>
                <span>Makeup Artists</span>
              </div>
              <div class="category">
                <div class="icon-c host-icon"></div>
                <span>Event Hosts</span>
              </div>
            </div>
            <!-- Call to Action -->
            <div class="cta-section">
              <h3>Didn't find what you're looking for?</h3>
              <p>Connect with our experts and design your perfect custom event</p>
              <button class="book-now-btn">BOOK US NOW ↗</button>
            </div>
          </section>
          <!-- Venue Section -->
          <section class="venue-section">
            <div class="venue-header" style="display: flex; align-items: center; justify-content: space-between;">
              <!-- Left side: icon + title -->
              <div style="display: flex; align-items: center; gap: 10px;">
                <div class="icon venue-icon"></div>
                <h3 style="margin: 0;">Venue</h3>
              </div>

              <!-- Right side: button -->
              <button class="view-all">View All</button>
            </div>

            <c:if test="${empty serviceList}">
              <p style="text-align: center; padding: 20px; color: var(--medium-gray);">No services have been loaded into
                the system yet.</p>
            </c:if>
            <div class="venue-cards">
              <c:set var="venueCount" value="0" />
              <c:forEach var="service" items="${serviceList}">
                <c:if test="${fn:toLowerCase(service.type) == 'venue' || fn:toLowerCase(service.type) == 'venues'}">
                  <c:set var="venueCount" value="${venueCount + 1}" />
                  <div class="venue-card">
                    <a href="<c:url value='/service-detail?id=${service.serviceId}' />" class="card-link-wrapper">
                      <div class="card-image"
                        style="background-image: url('${pageContext.request.contextPath}/resources/${fn:replace(service.imgPath, '\\', '/')}');">
                      </div>
                      <div class="card-info">
                        <span class="service-type-label">${fn:escapeXml(service.type)}</span>
                        <h4>${fn:escapeXml(service.name)}</h4>
                        <p class="service-description-preview">
                          <c:set var="desc" value="${service.description}" />
                          ${fn:escapeXml(fn:substring(desc, 0, 60))}${fn:length(desc) > 60 ? '...' : ''}
                        </p>
                        <span class="price">NPR ${service.cost}</span>
                      </div>
                    </a>
                  </div>
                </c:if>
              </c:forEach>
            </div>
            <c:if test="${not empty serviceList && venueCount == 0}">
              <p style="text-align: center; padding: 20px; color: var(--medium-gray);">No 'Venue' type services
                currently available.</p>
            </c:if>
          </section>
          <!-- decoration Section -->
          <section class="venue-section">
            <div class="venue-header" style="display: flex; align-items: center; justify-content: space-between;">
              <!-- Left side: icon + title -->
              <div style="display: flex; align-items: center; gap: 10px;">
                <div class="icon decoration-icon"></div>
                <h3 style="margin: 0;">Decorations</h3>
              </div>

              <!-- Right side: button -->
              <button class="view-all">View All</button>
            </div>

            <c:if test="${empty serviceList}">
              <p style="text-align: center; padding: 20px; color: var(--medium-gray);">No services have been loaded into
                the system yet.</p>
            </c:if>
            <div class="venue-cards">
              <c:set var="decorationCount" value="0" />
              <c:forEach var="service" items="${serviceList}">
                <c:if
                  test="${fn:toLowerCase(service.type) == 'decoration' || fn:toLowerCase(service.type) == 'decorations'}">
                  <c:set var="decorationCount" value="${decorationCount + 1}" />
                  <div class="venue-card">
                    <a href="<c:url value='/service-detail?id=${service.serviceId}' />" class="card-link-wrapper">
                      <div class="card-image"
                        style="background-image: url('${pageContext.request.contextPath}/resources/${fn:replace(service.imgPath, '\\', '/')}');">
                      </div>
                      <div class="card-info">
                        <span class="service-type-label">${fn:escapeXml(service.type)}</span>
                        <h4>${fn:escapeXml(service.name)}</h4>
                        <p class="service-description-preview">
                          <c:set var="desc" value="${service.description}" />
                          ${fn:escapeXml(fn:substring(desc, 0, 60))}${fn:length(desc) > 60 ? '...' : ''}
                        </p>
                        <span class="price">NPR ${service.cost}</span>
                      </div>
                    </a>
                  </div>
                </c:if>
              </c:forEach>
            </div>
            <c:if test="${not empty serviceList && decorationCount == 0}">
              <p style="text-align: center; padding: 20px; color: var(--medium-gray);">No 'Decoration' type services
                currently available.</p>
            </c:if>
          </section>
          <!-- Photography Section -->
          <section class="venue-section">
            <div class="venue-header" style="display: flex; align-items: center; justify-content: space-between;">
              <!-- Left side: icon + title -->
              <div style="display: flex; align-items: center; gap: 10px;">
                <div class="icon photography-icon"></div>
                <h3 style="margin: 0;">Photography</h3>
              </div>

              <!-- Right side: button -->
              <button class="view-all">View All</button>
            </div>

            <c:if test="${empty serviceList}">
              <p style="text-align: center; padding: 20px; color: var(--medium-gray);">No services have been loaded into
                the system yet.</p>
            </c:if>
            <div class="venue-cards">
              <c:set var="photographyCount" value="0" />
              <c:forEach var="service" items="${serviceList}">
                <c:if
                  test="${fn:toLowerCase(service.type) == 'photography' || fn:toLowerCase(service.type) == 'photographer' || fn:toLowerCase(service.type) == 'photographers'}">
                  <c:set var="photographyCount" value="${photographyCount + 1}" />
                  <div class="venue-card">
                    <a href="<c:url value='/service-detail?id=${service.serviceId}' />" class="card-link-wrapper">
                      <div class="card-image"
                        style="background-image: url('${pageContext.request.contextPath}/resources/${fn:replace(service.imgPath, '\\', '/')}');">
                      </div>
                      <div class="card-info">
                        <span class="service-type-label">${fn:escapeXml(service.type)}</span>
                        <h4>${fn:escapeXml(service.name)}</h4>
                        <p class="service-description-preview">
                          <c:set var="desc" value="${service.description}" />
                          ${fn:escapeXml(fn:substring(desc, 0, 60))}${fn:length(desc) > 60 ? '...' : ''}
                        </p>
                        <span class="price">NPR ${service.cost}</span>
                      </div>
                    </a>
                  </div>
                </c:if>
              </c:forEach>
            </div>
            <c:if test="${not empty serviceList && photographyCount == 0}">
              <p style="text-align: center; padding: 20px; color: var(--medium-gray);">No 'Photography' type services
                currently available.</p>
            </c:if>
          </section>
          <!-- entrancegate Section -->
          <section class="venue-section">
            <div class="venue-header" style="display: flex; align-items: center; justify-content: space-between;">
              <!-- Left side: icon + title -->
              <div style="display: flex; align-items: center; gap: 10px;">
                <div class="icon gate-icon"></div>
                <h3 style="margin: 0;">Entrance Gate</h3>
              </div>

              <!-- Right side: button -->
              <button class="view-all">View All</button>
            </div>

            <c:if test="${empty serviceList}">
              <p style="text-align: center; padding: 20px; color: var(--medium-gray);">No services have been loaded into
                the system yet.</p>
            </c:if>
            <div class="venue-cards">
              <c:set var="entranceGateCount" value="0" />
              <c:forEach var="service" items="${serviceList}">
                <c:if
                  test="${fn:toLowerCase(service.type) == 'entrance gate' || fn:toLowerCase(service.type) == 'entrance gates'}">
                  <c:set var="entranceGateCount" value="${entranceGateCount + 1}" />
                  <div class="venue-card">
                    <a href="<c:url value='/service-detail?id=${service.serviceId}' />" class="card-link-wrapper">
                      <div class="card-image"
                        style="background-image: url('${pageContext.request.contextPath}/resources/${fn:replace(service.imgPath, '\\', '/')}');">
                      </div>
                      <div class="card-info">
                        <span class="service-type-label">${fn:escapeXml(service.type)}</span>
                        <h4>${fn:escapeXml(service.name)}</h4>
                        <p class="service-description-preview">
                          <c:set var="desc" value="${service.description}" />
                          ${fn:escapeXml(fn:substring(desc, 0, 60))}${fn:length(desc) > 60 ? '...' : ''}
                        </p>
                        <span class="price">NPR ${service.cost}</span>
                      </div>
                    </a>
                  </div>
                </c:if>
              </c:forEach>
            </div>
            <c:if test="${not empty serviceList && entranceGateCount == 0}">
              <p style="text-align: center; padding: 20px; color: var(--medium-gray);">No 'Entrance Gate' type services
                currently available.</p>
            </c:if>
          </section>
          <!-- Stage Section -->
          <section class="venue-section">
            <div class="venue-header" style="display: flex; align-items: center; justify-content: space-between;">
              <!-- Left side: icon + title -->
              <div style="display: flex; align-items: center; gap: 10px;">
                <div class="icon stage-icon"></div>
                <h3 style="margin: 0;">Stages</h3>
              </div>

              <!-- Right side: button -->
              <button class="view-all">View All</button>
            </div>

            <c:if test="${empty serviceList}">
              <p style="text-align: center; padding: 20px; color: var(--medium-gray);">No services have been loaded into
                the system yet.</p>
            </c:if>
            <div class="venue-cards">
              <c:set var="stageCount" value="0" />
              <c:forEach var="service" items="${serviceList}">
                <c:if test="${fn:toLowerCase(service.type) == 'stage' || fn:toLowerCase(service.type) == 'stages'}">
                  <c:set var="stageCount" value="${stageCount + 1}" />
                  <div class="venue-card">
                    <a href="<c:url value='/service-detail?id=${service.serviceId}' />" class="card-link-wrapper">
                      <div class="card-image"
                        style="background-image: url('${pageContext.request.contextPath}/resources/${fn:replace(service.imgPath, '\\', '/')}');">
                      </div>
                      <div class="card-info">
                        <span class="service-type-label">${fn:escapeXml(service.type)}</span>
                        <h4>${fn:escapeXml(service.name)}</h4>
                        <p class="service-description-preview">
                          <c:set var="desc" value="${service.description}" />
                          ${fn:escapeXml(fn:substring(desc, 0, 60))}${fn:length(desc) > 60 ? '...' : ''}
                        </p>
                        <span class="price">NPR ${service.cost}</span>
                      </div>
                    </a>
                  </div>
                </c:if>
              </c:forEach>
            </div>
            <c:if test="${not empty serviceList && stageCount == 0}">
              <p style="text-align: center; padding: 20px; color: var(--medium-gray);">No 'Stage' type services
                currently available.</p>
            </c:if>
          </section>
          <!-- makeup Section -->
          <section class="venue-section">
            <div class="venue-header" style="display: flex; align-items: center; justify-content: space-between;">
              <!-- Left side: icon + title -->
              <div style="display: flex; align-items: center; gap: 10px;">
                <div class="icon makeup-icon"></div>
                <h3 style="margin: 0;">Makeup Artist</h3>
              </div>

              <!-- Right side: button -->
              <button class="view-all">View All</button>
            </div>

            <c:if test="${empty serviceList}">
              <p style="text-align: center; padding: 20px; color: var(--medium-gray);">No services have been loaded into
                the system yet.</p>
            </c:if>
            <div class="venue-cards">
              <c:set var="makeupArtistCount" value="0" />
              <c:forEach var="service" items="${serviceList}">
                <c:if
                  test="${fn:toLowerCase(service.type) == 'makeup artist' || fn:toLowerCase(service.type) == 'makeup artists'}">
                  <c:set var="makeupArtistCount" value="${makeupArtistCount + 1}" />
                  <div class="venue-card">
                    <a href="<c:url value='/service-detail?id=${service.serviceId}' />" class="card-link-wrapper">
                      <div class="card-image"
                        style="background-image: url('${pageContext.request.contextPath}/resources/${fn:replace(service.imgPath, '\\', '/')}');">
                      </div>
                      <div class="card-info">
                        <span class="service-type-label">${fn:escapeXml(service.type)}</span>
                        <h4>${fn:escapeXml(service.name)}</h4>
                        <p class="service-description-preview">
                          <c:set var="desc" value="${service.description}" />
                          ${fn:escapeXml(fn:substring(desc, 0, 60))}${fn:length(desc) > 60 ? '...' : ''}
                        </p>
                        <span class="price">NPR ${service.cost}</span>
                      </div>
                    </a>
                  </div>
                </c:if>
              </c:forEach>
            </div>
            <c:if test="${not empty serviceList && makeupArtistCount == 0}">
              <p style="text-align: center; padding: 20px; color: var(--medium-gray);">No 'Makeup Artist' type services
                currently available.</p>
            </c:if>
          </section>
          <!-- evevnthost Section -->
          <section class="venue-section">
            <div class="venue-header" style="display: flex; align-items: center; justify-content: space-between;">
              <!-- Left side: icon + title -->
              <div style="display: flex; align-items: center; gap: 10px;">
                <div class="icon host-icon"></div>
                <h3 style="margin: 0;">Event Host</h3>
              </div>
              <!-- Right side: button -->
              <button class="view-all">View All</button>
            </div>
            <c:if test="${empty serviceList}">
              <p style="text-align: center; padding: 20px; color: var(--medium-gray);">No services have been loaded into
                the system yet.</p>
            </c:if>
            <div class="venue-cards">
              <c:set var="eventHostCount" value="0" />
              <c:forEach var="service" items="${serviceList}">
                <c:if
                  test="${fn:toLowerCase(service.type) == 'event host' || fn:toLowerCase(service.type) == 'event hosts'}">
                  <c:set var="eventHostCount" value="${eventHostCount + 1}" />
                  <div class="venue-card">
                    <a href="<c:url value='/service-detail?id=${service.serviceId}' />" class="card-link-wrapper">
                      <div class="card-image"
                        style="background-image: url('${pageContext.request.contextPath}/resources/${fn:replace(service.imgPath, '\\', '/')}');">
                      </div>
                      <div class="card-info">
                        <span class="service-type-label">${fn:escapeXml(service.type)}</span>
                        <h4>${fn:escapeXml(service.name)}</h4>
                        <p class="service-description-preview">
                          <c:set var="desc" value="${service.description}" />
                          ${fn:escapeXml(fn:substring(desc, 0, 60))}${fn:length(desc) > 60 ? '...' : ''}
                        </p>
                        <span class="price">NPR ${service.cost}</span>
                      </div>
                    </a>
                  </div>
                </c:if>
              </c:forEach>
            </div>
            <c:if test="${not empty serviceList && eventHostCount == 0}">
              <p style="text-align: center; padding: 20px; color: var(--medium-gray);">No 'Event Host' type services
                currently available.</p>
            </c:if>
          </section>
        </div><!-- End of main-container -->
        </div><!-- End of container -->

        <!-- JavaScript for tab, search, and price range functionality -->
        <script>
          document.addEventListener('DOMContentLoaded', function () {
            // Get all tab buttons and service sections
            const tabButtons = document.querySelectorAll('.tab-btn');
            const venueSections = document.querySelectorAll('.venue-section');
            const serviceCards = document.querySelectorAll('.venue-card');

            // Get search elements
            const searchInput = document.getElementById('search-input');
            const searchBtn = document.getElementById('search-btn');

            // Get price range elements
            const minPriceSlider = document.getElementById('min-price');
            const maxPriceSlider = document.getElementById('max-price');
            const minPriceLabel = document.getElementById('min-price-label');
            const maxPriceLabel = document.getElementById('max-price-label');
            const priceTrack = document.getElementById('price-track');

            // Get no results message and reset button
            const noResultsMessage = document.getElementById('no-results-message');
            const resetFiltersBtn = document.getElementById('reset-filters-btn');

            // Current filter state
            let currentFilters = {
              type: 'all',
              search: '',
              minPrice: parseInt(minPriceSlider.value),
              maxPrice: parseInt(maxPriceSlider.value)
            };

            // Format price for display
            function formatPrice(price) {
              if (price >= 1000) {
                return `NPR ${Math.floor(price / 1000)}K`;
              }
              return `NPR ${price}`;
            }

            // Update price labels and slider track
            function updatePriceUI() {
              minPriceLabel.textContent = formatPrice(currentFilters.minPrice);
              maxPriceLabel.textContent = formatPrice(currentFilters.maxPrice);

              // Update slider track position
              const minPercent = ((currentFilters.minPrice - minPriceSlider.min) / (minPriceSlider.max - minPriceSlider.min)) * 100;
              const maxPercent = ((currentFilters.maxPrice - minPriceSlider.min) / (minPriceSlider.max - minPriceSlider.min)) * 100;

              priceTrack.style.left = minPercent + '%';
              priceTrack.style.right = (100 - maxPercent) + '%';
            }

            // Apply all filters (type, search, price)
            function applyFilters() {
              // First, handle section visibility based on type
              if (currentFilters.type === 'all') {
                venueSections.forEach(section => {
                  section.style.display = 'block';
                });
              } else {
                venueSections.forEach(section => {
                  const sectionTitle = section.querySelector('h3').textContent.toLowerCase();

                  if (sectionTitle.includes(currentFilters.type)) {
                    section.style.display = 'block';
                  } else {
                    section.style.display = 'none';
                  }
                });
              }

              // Then filter individual service cards
              serviceCards.forEach(card => {
                // Get card data for filtering
                const serviceType = card.querySelector('.service-type-label').textContent.toLowerCase();
                const serviceName = card.querySelector('h4').textContent.toLowerCase();
                const serviceDesc = card.querySelector('.service-description-preview').textContent.toLowerCase();
                const priceText = card.querySelector('.price').textContent;
                const servicePrice = parseInt(priceText.replace(/[^0-9]/g, ''));

                // Check if card matches all filters
                const matchesType = currentFilters.type === 'all' || serviceType.includes(currentFilters.type);
                const matchesSearch = currentFilters.search === '' ||
                  serviceName.includes(currentFilters.search) ||
                  serviceDesc.includes(currentFilters.search);
                const matchesPrice = servicePrice >= currentFilters.minPrice &&
                  servicePrice <= currentFilters.maxPrice;

                // Show/hide card based on filter matches
                if (matchesType && matchesSearch && matchesPrice) {
                  card.style.display = 'block';
                } else {
                  card.style.display = 'none';
                }
              });

              // Check if any services are visible after filtering
              let totalVisibleCards = 0;

              venueSections.forEach(section => {
                if (section.style.display === 'block') {
                  const visibleCards = section.querySelectorAll('.venue-card[style="display: block;"]');
                  const noResultsMsg = section.querySelector('p[style*="text-align: center"]');

                  totalVisibleCards += visibleCards.length;

                  if (visibleCards.length === 0) {
                    // If no cards are visible in this section, show the section's "no results" message
                    if (noResultsMsg) {
                      noResultsMsg.style.display = 'block';
                    }
                  } else {
                    // If cards are visible, hide the section's "no results" message
                    if (noResultsMsg) {
                      noResultsMsg.style.display = 'none';
                    }
                  }
                }
              });

              // Show/hide the global "No results" message
              if (totalVisibleCards === 0) {
                noResultsMessage.style.display = 'block';
              } else {
                noResultsMessage.style.display = 'none';
              }
            }

            // Add click event listeners to all tab buttons
            tabButtons.forEach(button => {
              button.addEventListener('click', function () {
                // Remove active class from all buttons
                tabButtons.forEach(btn => btn.classList.remove('active'));

                // Add active class to clicked button
                this.classList.add('active');

                // Update current filter type
                currentFilters.type = this.getAttribute('data-type').toLowerCase();

                // Apply all filters
                applyFilters();

                // Scroll to the services section
                document.getElementById('services').scrollIntoView({ behavior: 'smooth' });
              });
            });

            // Add event listener for search input
            searchInput.addEventListener('input', function () {
              currentFilters.search = this.value.toLowerCase();
              applyFilters();
            });

            // Add event listener for search button
            searchBtn.addEventListener('click', function () {
              currentFilters.search = searchInput.value.toLowerCase();
              applyFilters();
            });

            // Add event listener for Enter key in search input
            searchInput.addEventListener('keypress', function (e) {
              if (e.key === 'Enter') {
                currentFilters.search = this.value.toLowerCase();
                applyFilters();
              }
            });

            // Add event listeners for price range sliders
            minPriceSlider.addEventListener('input', function () {
              // Ensure min price doesn't exceed max price
              if (parseInt(this.value) > currentFilters.maxPrice) {
                this.value = currentFilters.maxPrice;
              }

              currentFilters.minPrice = parseInt(this.value);
              updatePriceUI();
              applyFilters();
            });

            maxPriceSlider.addEventListener('input', function () {
              // Ensure max price doesn't go below min price
              if (parseInt(this.value) < currentFilters.minPrice) {
                this.value = currentFilters.minPrice;
              }

              currentFilters.maxPrice = parseInt(this.value);
              updatePriceUI();
              applyFilters();
            });

            // Initialize UI
            updatePriceUI();

            // Add event listener for reset filters button
            resetFiltersBtn.addEventListener('click', function () {
              // Reset all filters to default values
              currentFilters.type = 'all';
              currentFilters.search = '';
              currentFilters.minPrice = parseInt(minPriceSlider.min);
              currentFilters.maxPrice = parseInt(maxPriceSlider.max);

              // Reset UI elements
              searchInput.value = '';
              minPriceSlider.value = minPriceSlider.min;
              maxPriceSlider.value = maxPriceSlider.max;

              // Reset active tab
              tabButtons.forEach(btn => btn.classList.remove('active'));
              tabButtons[0].classList.add('active'); // Select the "All Services" tab

              // Update UI and apply filters
              updatePriceUI();
              applyFilters();

              // Scroll to the services section
              document.getElementById('services').scrollIntoView({ behavior: 'smooth' });
            });

            // Initialize - show all sections by default
            venueSections.forEach(section => {
              section.style.display = 'block';
            });
          });
        </script>
      </body>

      </html>