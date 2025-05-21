<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PARAMPARA EVENTS</title>
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/home.css" />
    <link
      href="https://fonts.googleapis.com/css?family=Hanken Grotesk"
      rel="stylesheet"
    />
    

  
  </head>
  <body>
	<jsp:include page="header.jsp" />
    <div class="hero">
      <img class="bgimg" src="${pageContext.request.contextPath}/resources/images/system/bgimg.jpg" alt="hero image" />
    </div>

    <div class="hero-blend">
      <div class="wrapper">
        <div class="lid one"></div>
        <div class="lid two"></div>
        <div class="envelope"></div>
        <div class="letter">
          <p>Get 20% off on your first booking.</p>
        </div>
        <button class="book-now-btn">Book Now</button>
      </div>
    </div>
<!-- containers start here -->
    <style>
        .venue-section,
          .decoration-section {
            margin-bottom: 3rem;
            width: 100%;
          }

          .venue-cards{
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 1.5rem;
            width: 100%;
          }


          .section-header {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
          }

          .section-header .icon {
            margin-right: 1rem;
            margin-bottom: 0;
          }

          .section-header h2 {
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
                                    border:1px solid black;
            
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

         

          .select-btn {
            display: inline-block;
            background-color: var(--primary-color);
            color:#;
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
    </style>
    <div class="container1">
      <div class="venue-section">
        <div
          class="venue-header"
          style="
            display: flex;
            align-items: center;
            justify-content: space-between
          "
        >
          <!-- Left side: icon + title -->
          <div style="display: flex; align-items: center; gap: 10px">
            <div class="icon venue-icon"></div>
            <h2 style="margin: 0">Venue</h2>
          </div>

          <!-- Right side: button -->
          <button class="view-all">View All</button>
        </div>

        <div
          class="venue-cards"
          style="
            display: flex;
            justify-content: space-between;
            flex-wrap: nowrap;
            overflow-x: hidden;
            padding: 1rem;
          "
        >
          <div
            class="venue-card"
            style="width: 250px; margin-right: 1rem; flex-shrink: 0"
          >
            <div class="card-image" style="height: 200px; width: 100%">
              <img
                src="images/venue5.jpg"
                alt="Hotel"
                style="
                  width: 100%;
                  height: 100%;
                  object-fit: cover;
                  border-radius: 1rem 1rem 0 0;
                "
              />
            </div>
            <div class="card-info" style="padding: 0.5rem">
              <h4 style="margin: 0">Beach Venue</h4>
              <span class="price">NPR 1,80,000</span><br />
              <button class="select-btn" style="margin-top: 0.5rem">
                Select
              </button>
            </div>
          </div>

          <div
            class="venue-card"
            style="width: 250px; margin-right: 1rem; flex-shrink: 0"
          >
            <div class="card-image" style="height: 200px; width: 100%">
              <img
                src="images/venue2.jpg"
                alt="Party Hall"
                style="
                  width: 100%;
                  height: 100%;
                  object-fit: cover;
                  border-radius: 1rem 1rem 0 0;
                "
              />
            </div>
            <div class="card-info" style="padding: 0.5rem">
              <h4 style="margin: 0">Party Hall</h4>
              <span class="price">NPR 1,67,000</span><br />
              <button class="select-btn" style="margin-top: 0.5rem">
                Select
              </button>
            </div>
          </div>

          <div
            class="venue-card"
            style="width: 250px; margin-right: 1rem; flex-shrink: 0"
          >
            <div class="card-image" style="height: 200px; width: 100%">
              <img
                src="images/venue3.jpg"
                alt="Garden Venue"
                style="
                  width: 100%;
                  height: 100%;
                  object-fit: cover;
                  border-radius: 1rem 1rem 0 0;
                "
              />
            </div>
            <div class="card-info" style="padding: 0.5rem">
              <h4 style="margin: 0">Hotel Venue</h4>
              <span class="price">NPR 1,56,000</span><br />
              <button class="select-btn" style="margin-top: 0.5rem">
                Select
              </button>
            </div>
          </div>

          <div
            class="venue-card"
            style="width: 250px; margin-right: 1rem; flex-shrink: 0"
          >
            <div class="card-image" style="height: 200px; width: 100%">
              <img
                src="images/venue4.jpg"
                alt="Beach Venue"
                style="
                  width: 100%;
                  height: 100%;
                  object-fit: cover;
                  border-radius: 1rem 1rem 0 0;
                "
              />
            </div>
            <div class="card-info" style="padding: 0.5rem">
              <h4 style="margin: 0">Temple Venue</h4>
              <span class="price">NPR 70,000</span><br />
              <button class="select-btn" style="margin-top: 0.5rem">
                Select
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <style>
      .container2 {
        text-align: center;
        padding: 40px 0px;
        background-color: #fff;
      }

      .container2 h1 {
        font-size: 2.5rem;
        margin-bottom: 10px;
      }

      .container2 h3 {
        font-weight: normal;
        color: #777;
        margin-bottom: 40px;
      }

      .frame-container {
        display: flex;
        flex-wrap: nowrap; /* Keep in a single horizontal row */
        overflow-x: auto; /* Enable horizontal scroll */
        overflow-y: hidden;
        gap: 0;
        padding: 0;
        margin: 0;
      }

      .frame {
        flex: 0 0 auto; /* Prevent shrinking and allow natural width */
        position: relative;
        overflow: hidden;
        width: 275px; /* Match partitionpillar.png width */
        height: 400px; /* Match partitionpillar.png height */
        margin: 0;
      }

      .frame-photo {
        width: 100%;
        height: 100%;
        object-fit: cover;
        display: block;
      }

      .frame-border {
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
        z-index: 2;
        pointer-events: none;
      }

      .frame-frame {
        height: 100%;
        width: 100%;
        object-fit: cover;
        display: block;
      }
    </style>
    <div class="container2">
      <h1>Memories</h1>
      <h3>If only you could relive again...</h3>
            <marquee direction="right" loop="infinite" >
      
      <div class="frame-container">
        <div class="frame">
          <img src="${pageContext.request.contextPath}/resources/images/system/bgimg.jpg" class="frame-photo" alt="gallery-photo" />
          <div class="frame-border">
            <img src="${pageContext.request.contextPath}/resources/images/home/partitionpillar.png" class="frame-frame" />
          </div>
        </div>
        <div class="frame">
          <img src="${pageContext.request.contextPath}/resources/images/blogs/couple set.jpeg" class="frame-photo" alt="gallery-photo" />
          <div class="frame-border">
            <img src="${pageContext.request.contextPath}/resources/images/home/partitionpillar.png" class="frame-frame" />
          </div>
        </div>
        <div class="frame">
          <img src="${pageContext.request.contextPath}/resources/images/blogs/outdoorwedding.jpeg" class="frame-photo" alt="gallery-photo" />
          <div class="frame-border">
            <img src="${pageContext.request.contextPath}/resources/images/home/partitionpillar.png" class="frame-frame" />
          </div>
        </div>
        <div class="frame">
          <img src="${pageContext.request.contextPath}/resources/images/blogs/Maternity Photographer _ Sutro Baths, San Francisco.jpeg" class="frame-photo" alt="gallery-photo" />
          <div class="frame-border">
            <img src="${pageContext.request.contextPath}/resources/images/home/partitionpillar.png" class="frame-frame" />
          </div>
        </div>
        <div class="frame">
          <img src="${pageContext.request.contextPath}/resources/images/blogs/outdoorwedding.jpeg" class="frame-photo" alt="gallery-photo" />
          <div class="frame-border">
            <img src="${pageContext.request.contextPath}/resources/images/home/partitionpillar.png" class="frame-frame" />
          </div>
        </div>
        <div class="frame">
          <img src="${pageContext.request.contextPath}/resources/images/blogs/outdoorwedding.jpeg" class="frame-photo" alt="gallery-photo" />
          <div class="frame-border">
            <img src="${pageContext.request.contextPath}/resources/images/home/partitionpillar.png" class="frame-frame" />
          </div>
        </div>
        <div class="frame">
          <img src="${pageContext.request.contextPath}/resources/images/blogs/outdoorwedding.jpeg" class="frame-photo" alt="gallery-photo" />
          <div class="frame-border">
            <img src="${pageContext.request.contextPath}/resources/images/home/partitionpillar.png" class="frame-frame" />
          </div>
        </div>
        <div class="frame">
          <img src="${pageContext.request.contextPath}/resources/images/blogs/outdoorwedding.jpeg" class="frame-photo" alt="gallery-photo" />
          <div class="frame-border">
            <img src="${pageContext.request.contextPath}/resources/images/home/partitionpillar.png" class="frame-frame" />
          </div>
        </div>      </div></marquee>

    </div>

    <style>
      .container3 {
        font-family: Arial, Helvetica, sans-serif;
        line-height: 1.6;
        color: #333;
        margin: 0 auto;
        padding: 50px 10%;
        background-color: #fff;
        display: flex;
        position: relative;
        justify-content: end;
        background-image: url("${pageContext.request.contextPath}/resources/images/home/pattern.png");
      }
      /* heading styles */
      .c6-header {
        position: absolute;
        margin-bottom: 20px;
        height: 200px;
		top: 50px;
		right:60%;
        
      }

      .title-decoration {
        font-family: "Brush Script MT", cursive;
        color: #c91c1c;
        font-size: 2.5rem;
        line-height: 1.2;
      }

      .title-main {
        font-size: 3rem;
        font-weight: 600;
        color: #333;
        line-height: 1.3;
      }

      /* Gallery layout */
      .gallery-container {
        display: grid;
        grid-template-columns: repeat(38, 12px);
        grid-template-rows: repeat(25, 16px);
        gap: 10px;
        position: relative;
        margin-right: 50px;
      }

      .gallery-item {
        overflow: hidden;
        border-radius: 4px;
      }

      .gallery-item img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        display: block;
      }

      /* Specific positioning based on the reference image and adjustments */
      .item-1 {
        grid-column: 14 / 28;
        grid-row: 1 / 9;
      }

      .item-2 {
        grid-column: 28 / 37;
        grid-row: 3 / 13; /* Only extend to half the height of Middle right image */
      }

      .item-3 {
        grid-column: 4 / 18;
        grid-row: 9/17; /* Same height as Middle right image */
      }

      .item-4 {
        grid-column: 18 /28;
        grid-row: 9/17;
      }

      .item-5 {
        grid-column: 28 / 39;
        grid-row: 13 / 17; /* Take up remaining height of Middle right image */
      }

      .item-6 {
        grid-column: 12 / 21;
        grid-row: 17 / 23;
      }

      .item-7 {
        grid-column: 21 /33;
        grid-row: 17 / 25;
      }

      /* Responsive adjustments */
      @media (max-width: 768px) {
        .gallery-container {
          grid-template-columns: 1fr;
          grid-template-rows: repeat(7, auto);
        }

        .gallery-item {
          grid-column: 1 / 2 !important;
        }

        .item-1 {
          grid-row: 1 / 2;
        }
        .item-2 {
          grid-row: 2 / 3;
        }
        .item-3 {
          grid-row: 3 / 4;
        }
        .item-4 {
          grid-row: 4 / 5;
        }
        .item-5 {
          grid-row: 5 / 6;
        }
        .item-6 {
          grid-row: 6 / 7;
        }
        .item-7 {
          grid-row: 7 / 8;
        }

        .header {
          height: 150px;
        }

        .title-main {
          font-size: 2.5rem;
        }
      }
    </style>
    <div class="container3">
      <div class="c6-header">
        <h1 class="title-decoration">Decoration</h1>
        <h2 class="title-main">When Day & <br />Aesthetic&nbsp;Blends</h2>
      </div>

      <div class="gallery-container">
        <!-- Top right image - Red floral arch -->
        <div class="gallery-item item-1">
          <img
            src="${pageContext.request.contextPath}/resources/images/home/decore3.png"
            alt="Red floral arch with hanging gold decorations"
          />
        </div>

        <!-- Top far right image - Red floral dome -->
        <div class="gallery-item item-2">
          <img
            src="${pageContext.request.contextPath}/resources/images/home/decore7.png"
            alt="Red floral dome with hanging decorations"
          />
        </div>

        <!-- Large left image - White floral stage -->
        <div class="gallery-item item-3">
          <img
            src="${pageContext.request.contextPath}/resources/images/home/decore2.png"
            alt="Elegant white and pastel floral wedding stage with hanging decorations"
          />
        </div>

        <!-- Middle right image - Purple mandap -->
        <div class="gallery-item item-4">
          <img
            src="${pageContext.request.contextPath}/resources/images/home/decore1.png"
            alt="Purple themed wedding mandap with floral decorations"
          />
        </div>

        <!-- Middle far right image - Circular mandap -->
        <div class="gallery-item item-5">
          <img
            src="${pageContext.request.contextPath}/resources/images/home/decore6.png"
            alt="Circular mandap with floral top ring and hanging lights"
          />
        </div>

        <!-- Bottom left image - Pink floral mandap -->
        <div class="gallery-item item-6">
          <img
            src="${pageContext.request.contextPath}/resources/images/home/decore4.png"
            alt="Pink and floral wedding mandap with golden thrones"
          />
        </div>

        <!-- Bottom right image - White and gold stage -->
        <div class="gallery-item item-7">
          <img
            src="${pageContext.request.contextPath}/resources/images/home/decore5.png"
            alt="White and gold wedding stage with golden sofa"
          />
        </div>
      </div>
    </div>
    <div class="container4">
      <div id="container4" class="services-container">
        <h2 class="services-subtitle">Our Services</h2>
        <h1 class="services-title">Choose. Book. Experience.</h1>

        <div class="services-grid">
          <!-- Row 1 -->
          <div class="service-card">
            <div class="service-image-container">
              <img
                src="/decore7.png"
                alt="Wedding venue with white building"
                class="service-image"
              />
              <h3 class="service-name">Wedding Celebration</h3>
            </div>
          </div>

          <div class="service-card">
            <div class="service-image-container">
              <img
                src="/decore1.png"
                alt="Person singing at an event"
                class="service-image"
              />
              <h3 class="service-name">Event Hosting</h3>
            </div>
          </div>

          <div class="service-card">
            <div class="service-image-container">
              <img
                src="/decore1.png"
                alt="Person operating a camera"
                class="service-image"
              />
              <h3 class="service-name">Photography & Videography</h3>
            </div>
          </div>

          <div class="service-card">
            <div class="service-image-container">
              <img
                src="/decore1.png"
                alt="Hands with henna design"
                class="service-image"
              />
              <h3 class="service-name">Mehendi</h3>
            </div>
          </div>

          <!-- Row 2 -->
          <div class="service-card">
            <div class="service-image-container">
              <img
                src="/decore1.png"
                alt="Child in traditional clothing"
                class="service-image"
              />
              <h3 class="service-name">Bratabandha</h3>
            </div>
          </div>

          <div class="service-card">
            <div class="service-image-container">
              <img
                src="/decore1.png"
                alt="DJ performing at an event"
                class="service-image"
              />
              <h3 class="service-name">Sound System and DJ</h3>
            </div>
          </div>

          <div class="service-card">
            <div class="service-image-container">
              <img
                src="/decore1.png"
                alt="People celebrating with a birthday cake"
                class="service-image"
              />
              <h3 class="service-name">Birthday Celebration</h3>
            </div>
          </div>

          <div class="service-card">
            <div class="service-image-container">
              <img
                src="/decore1.png"
                alt="Traditional Nwaran ceremony"
                class="service-image"
              />
              <h3 class="service-name">Nwaran</h3>
            </div>
          </div>
        </div>

        <div class="view-all-container">
          <a href="#" class="view-all-button"
            >View all <span class="arrow"><svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"/></svg></span></a
          >
        </div>

        <style>
          .services-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
            font-family: Arial, sans-serif;
          }

          .services-subtitle {
            color: #c00;
            font-size: 2rem;
            margin-bottom: 0;
            font-weight: bold;
            font-family: "Brush Script MT", cursive;
          }

          .services-title {
            color: #333;
            font-size: 3.5rem;
            margin-top: 10px;
            margin-bottom: 40px;
            font-weight: bold;
          }

          .services-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 40px;
          }

          .service-card {
            display: flex;
            flex-direction: column;
            align-items: center;
          }

          .service-image-container {
            width: 100%;
            height: 220px;
            overflow: hidden;
            border-radius: 8px;
            position: relative;
          }

          .service-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
          }

          .service-card:hover .service-image {
            transform: scale(1.05);
          }

          .service-name {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: rgba(255, 255, 255, 0.8);
            margin: 0;
            padding: 10px;
            text-align: center;
            font-size: 1rem;
            color: #333;
            transition: background-color 0.3s ease;
          }

          .service-card:hover .service-name {
            background-color: rgba(255, 255, 255, 0.9);
          }

          .view-all-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
          }

          .view-all-button {
            display: inline-flex;
            align-items: center;
            padding: 5px 25px;
            border: 1px solid #333;
            border-radius: 30px;
            color: #333;
            text-decoration: none;
            font-size: 1rem;
            transition: all 0.3s ease;
            position: relative;
          }
          

          .view-all-button:hover {
            background-color: #f5f5f5;
          }

          .arrow {
            display:flex;
            align-items:center;
            margin-left:3px;
          }

          /* Responsive styles */
          @media (max-width: 1024px) {
            .services-grid {
              grid-template-columns: repeat(3, 1fr);
            }
          }

          @media (max-width: 768px) {
            .services-grid {
              grid-template-columns: repeat(2, 1fr);
            }

            .services-title {
              font-size: 2.5rem;
            }
          }

          @media (max-width: 480px) {
            .services-grid {
              grid-template-columns: 1fr;
            }

            .services-subtitle {
              font-size: 1.5rem;
            }

            .services-title {
              font-size: 2rem;
            }
          }
        </style>
      </div>
    </div>
    <div class="container5">
      <div class="container5">
        <!-- Heading -->
        <div class="testimonial-heading">
          <h2>Discover What our Satisfied Clients have to Say</h2>
        </div>

        <!-- Testimonial 1 - Top Left -->
        <div class="testimonial-card" style="top: 0; left: 15%">
          <div class="testimonial-header">
            <img
              src="/placeholder.svg?height=80&width=80"
              alt="Client profile picture"
              class="profile-img"
            />
            <div class="client-info">
              <h3 class="client-name">Pragun Maskey</h3>
              <div class="rating">
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star">☆</span>
              </div>
            </div>
          </div>
          <p class="testimonial-text">
            I really appreciated the experience and had a fantastic time at the
            events. The staff was wonderful and the management was top-notch.
          </p>
        </div>

        <!-- Testimonial 2 - Top Right -->
        <div class="testimonial-card" style="top: 4%; right: 14%">
          <div class="testimonial-header">
            <img
              src="/placeholder.svg?height=80&width=80"
              alt="Client profile picture"
              class="profile-img"
            />
            <div class="client-info">
              <h3 class="client-name">Anshu Maskey</h3>
              <div class="rating">
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star">☆</span>
              </div>
            </div>
          </div>
          <p class="testimonial-text">
            I really appreciated the experience and had a fantastic time at the
            events. The staff was wonderful and the management was top-notch.
          </p>
        </div>

        <!-- Testimonial 3 - Middle Left -->
        <div
          class="testimonial-card"
          style="top: 50%; left: 0; transform: translateY(-50%)"
        >
          <div class="testimonial-header">
            <img
              src="/placeholder.svg?height=80&width=80"
              alt="Client profile picture"
              class="profile-img"
            />
            <div class="client-info">
              <h3 class="client-name">Sheenchaan</h3>
              <div class="rating">
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star">☆</span>
              </div>
            </div>
          </div>
          <p class="testimonial-text">
            I really appreciated the experience and had a fantastic time at the
            events. The staff was wonderful and the management was top-notch.
          </p>
        </div>

        <!-- Testimonial 4 - Middle Right -->
        <div
          class="testimonial-card"
          style="top: 54%; right: 10px; transform: translateY(-50%)"
        >
          <div class="testimonial-header">
            <img
              src="/placeholder.svg?height=80&width=80"
              alt="Client profile picture"
              class="profile-img"
            />
            <div class="client-info">
              <h3 class="client-name">Rabina Lama</h3>
              <div class="rating">
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star">☆</span>
              </div>
            </div>
          </div>
          <p class="testimonial-text">
            I really appreciated the experience and had a fantastic time at the
            events. The staff was wonderful and the management was top-notch.
          </p>
        </div>

        <!-- Testimonial 5 - Bottom Center -->
        <div
          class="testimonial-card"
          style="bottom: 15%; left: 50%; transform: translateX(-50%)"
        >
          <div class="testimonial-header">
            <img
              src="/placeholder.svg?height=80&width=80"
              alt="Client profile picture"
              class="profile-img"
            />
            <div class="client-info">
              <h3 class="client-name">Abhishekshek</h3>
              <div class="rating">
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star filled">★</span>
                <span class="star">☆</span>
              </div>
            </div>
          </div>
          <p class="testimonial-text">
            I really appreciated the experience and had a fantastic time at the
            events. The staff was wonderful and the management was top-notch.
          </p>
        </div>

        <style>
          .container5 {
            font-family: Arial, sans-serif;
            max-width: 1350px;
            margin: 0 auto;
            padding: 70px 20px;
            position: relative;
            height: 100vh; /* Set a fixed height for the container */
          }

          .testimonial-card {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 350px;
            position: absolute; /* Absolute positioning */
          }

          .testimonial-header {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
          }

          .profile-img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px;
          }

          .client-name {
            margin: 0 0 5px 0;
            font-size: 18px;
          }

          .rating {
            color: #ffc107;
            font-size: 18px;
          }

          .star.filled {
            color: #ffc107;
          }

          .star {
            color: #e0e0e0;
          }

          .testimonial-text {
            font-size: 16px;
            line-height: 1.6;
            color: #555;
          }

          .testimonial-heading {
            position: absolute;
            top: 44%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            width: 500px;
            z-index: 10;
          }

          .testimonial-heading h2 {
            font-family: "Brush Script MT", cursive;
            color: #d32f2f;
            font-size: 36px;
            font-weight: normal;
            line-height: 1.3;
          }

          /* Media query for responsive design */
          @media (max-width: 1200px) {
            .container5 {
              height: auto;
              padding-bottom: 600px;
            }

            .testimonial-card {
              width: 80%;
              max-width: 300px;
            }

            /* Adjust positions for smaller screens */
            .testimonial-card:nth-child(2) {
              top: 0;
              left: 5%;
              right: auto;
            }
            .testimonial-card:nth-child(3) {
              top: 0;
              right: 5%;
              left: auto;
            }
            .testimonial-card:nth-child(4) {
              top: 200px;
              left: 5%;
              transform: none;
            }
            .testimonial-card:nth-child(5) {
              top: 200px;
              right: 5%;
              left: auto;
              transform: none;
            }
            .testimonial-card:nth-child(6) {
              top: 400px;
              left: 50%;
              transform: translateX(-50%);
              bottom: auto;
            }

            .testimonial-heading {
              top: 300px;
              width: 90%;
            }
          }
        </style>
      </div>
    </div>
    <style>
      /* FAQ Section */
      .faq {
        background-color: #f8f8f8;
        padding: 80px 100px;
        color: #333;
        background-image: url("${pageContext.request.contextPath}/resources/images/home/nepalipaper.jpg");
        background-repeat: no-repeat;
        background-size: cover;
        background-color: rgba(255, 255, 255, 0.9);
        background-blend-mode: lighten;
      }

      .faq-container1 {
        display: block;
        width: 65%;
        padding-right: 10px;
      }

      .faq-container2 {
        display: block;
        width: 35%;
      }

      .faq section {
        display: flex;
      }

      .faq h2 {
        font-size: 2.5rem;
        margin-bottom: 40px;
        text-align: center;
        position: relative;
        font-weight: 600;
      }

      .faq h2:after {
        content: "";
        display: block;
        width: 60px;
        height: 3px;
        background-color: #e54e50;
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
        border: 1px solid #e0e0e0;
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
        border-left-color: #e54e50;
      }

      .faq-toggle {
        width: 24px;
        height: 24px;
        border-radius: 50%;
        background-color: #f0f0f0;
        color: #e54e50;
        display: flex;
        align-items: center;
        justify-content: center;
        font-family: sans-serif; /* Helps normalize symbol rendering */
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
        border-left-color: #e54e50;
        color: #e54e50;
      }

      .faq-item.active .faq-toggle {
        background-color: #e54e50;
        color: white;
        transform: rotate(45deg);
      }

      .faq-item.active .faq-answer {
        max-height: 300px;
        padding: 0 25px 20px;
      }

      .contact-box {
        background-color: #fff;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
        height: 95%;
        position: relative;
        min-height: 375px;
      }
      .contact-box-content {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
      }

      .chat-icon {
        margin-bottom: 20px;
      }

      .contact-heading {
        font-size: 20px;
        margin-bottom: 30px;
      }

      .contact-btn {
        background-color: #c00000;
        color: white;
        text-decoration: none;
        padding: 15px 20px;
        border-radius: 4px;
        font-weight: 600;
        display: block;
        width: 100%;
        text-align: center;
        transition: background-color 0.3s;
      }

      .contact-btn:hover {
        background-color: #a00000;
        color: #fff;
      }
    </style>
    <!-- FAQ Section -->
    <div class="faq">
      <h2>Frequently Asked Questions</h2>
      <section>
        <div class="faq-container1">
          <div class="faq-content">
            <div class="faq-item">
              <div class="faq-question">
                <span>How do you ensure succession of an event?</span>
                <span class="faq-toggle">+</span>
              </div>
              <div class="faq-answer">
                <p>
                  We ensure the success of every event through meticulous
                  planning, experienced coordination, and attention to detail.
                  Our team follows a comprehensive checklist and timeline,
                  conducts multiple pre-event inspections, and maintains
                  constant communication with all vendors and stakeholders to
                  ensure flawless execution.
                </p>
              </div>
            </div>
            <div class="faq-item">
              <div class="faq-question">
                <span>Do you offer customized event packages?</span>
                <span class="faq-toggle">+</span>
              </div>
              <div class="faq-answer">
                <p>
                  Yes, we specialize in creating bespoke event packages tailored
                  to your specific requirements and budget. Our team works
                  closely with you to understand your vision, preferences, and
                  cultural needs to design a personalized experience that
                  exceeds your expectations while respecting your financial
                  parameters.
                </p>
              </div>
            </div>
            <div class="faq-item">
              <div class="faq-question">
                <span>How far in advance should I book your services?</span>
                <span class="faq-toggle">+</span>
              </div>
              <div class="faq-answer">
                <p>
                  For major events like weddings and large corporate functions,
                  we recommend booking 6-12 months in advance to secure your
                  preferred date and venue. For smaller events, 3-6 months is
                  typically sufficient. However, we also accommodate last-minute
                  requests when possible, depending on our availability and the
                  complexity of your event.
                </p>
              </div>
            </div>
          </div>
        </div>
        <div class="faq-container2">
          <div class="contact-box">
            <div class="contact-box-content">
              <div class="chat-icon">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="60"
                  height="60"
                  viewBox="0 0 24 24"
                  fill="#c00000"
                  stroke="#c00000"
                  stroke-width="0.5"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  class="feather feather-message-square"
                >
                  <path
                    d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"
                  />
                </svg>
                <h3 class="contact-heading">Do you have more questions?</h3>
                <a href="mailto:info@paramparaevents.com" class="contact-btn">
                  Shoot a Direct Mail
                </a>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>

<!-- containers end here -->

    <script src="${pageContext.request.contextPath}/scripts/scripts.js"></script>
	<jsp:include page="footer.jsp" />

  </body>
</html>
