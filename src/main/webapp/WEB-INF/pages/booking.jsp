<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Parampara Events - Cart</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
      :root {
        --primary: #e54e50;
        --primary-light: #ff7a7c;
        --secondary: #ffffff;
        --accent: #c1050b;
        --gray-light: #f0f2f5;
        --gray-medium: #e1e4e8;
        --gray-dark: #666666;
        --text-dark: #333333;
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

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      }

      body {
        background-color: var(--secondary);
        color: var(--text-dark);
        margin: 0;
        padding: 0;
      }

      /* Main content container */
      .main-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
      }

      .container {
        display: flex;
        flex-direction: column;
        gap: 20px;
      }

      .hero-header {
        text-align: center;
        padding: 20px 0;
        font-size: 24px;
        font-weight: 600;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
      }

      .header i {
        color: var(--primary);
      }

      .cart-container {
        display: flex;
        gap: 20px;
        flex-wrap: wrap;
      }

      .cart-items {
        flex: 1;
        min-width: 300px;
      }

      .cart-item {
        display: flex;
        align-items: center;
        background-color: var(--gray-light);
        border-radius: 12px;
        padding: 15px;
        margin-bottom: 15px;
        position: relative;
      }

      .item-image {
        width: 50px;
        height: 50px;
        border-radius: 8px;
        background-color: var(--gray-medium);
        overflow: hidden;
        margin-right: 15px;
      }

      .item-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }

      .item-details {
        flex: 1;
      }

      .item-name {
        font-weight: 600;
        margin-bottom: 5px;
      }

      .item-price {
        color: var(--accent);
        font-weight: 500;
      }

      .delete-btn {
        background: none;
        border: none;
        color: var(--gray-dark);
        cursor: pointer;
        font-size: 18px;
        padding: 5px;
        transition: color 0.2s;
      }

      .delete-btn:hover {
        color: var(--primary);
      }

      .cart-summary {
        background-color: var(--gray-light);
        border-radius: 12px;
        padding: 20px;
        min-width: 300px;
        flex: 0 0 300px;
      }

      .summary-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
        font-size: 14px;
      }

      .summary-label {
        color: var(--gray-dark);
      }

      .summary-value {
        font-weight: 500;
      }

      .total-row {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
        padding-top: 15px;
        border-top: 1px solid var(--gray-medium);
        font-weight: 600;
      }

      .checkout-btn {
        display: block;
        width: 100%;
        background-color: var(--primary);
        color: var(--secondary);
        border: none;
        border-radius: 25px;
        padding: 12px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        margin-top: 20px;
        transition: background-color 0.2s;
      }

      .checkout-btn:hover {
        background-color: var(--accent);
      }

      @media (max-width: 768px) {
        .cart-container {
          flex-direction: column;
        }

        .cart-summary {
          flex: 1;
          width: 100%;
        }
      }

      
 

      .social-icons {
        display: flex;
      }

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
        text-decoration: none;
        color: var(--text-color);
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
        max-width: 1200px;
        margin: 0 auto;
        padding-left: 2rem;
        padding-right: 2rem;
      }

      /* Responsive adjustments */
      @media (max-width: 768px) {
        .header-container,
        .footer-content {
          flex-direction: column;
          align-items: center;
        }

        nav ul {
          margin: 1rem 0;
        }

        .nav-buttons {
          margin-top: 1rem;
        }

        .footer-column {
          margin-bottom: 1.5rem;
          text-align: center;
        }

        .social-icons {
          justify-content: center;
        }
      }

      .payment-methods {
        margin-top: 20px;
        text-align: center;
      }

      .payment-methods p {
        margin-bottom: 10px;
        font-size: 14px;
        color: var(--gray-dark);
      }

      .payment-image {
        max-width: 100%;
        height: auto;
        border-radius: 5px;
      }
    </style>
  </head>
  <body>
	<jsp:include page="header.jsp" />

    <div class="main-container">
      <div class="container">
        <div class="hero-header">
          Your next event, just a tap away <i class="fas fa-glass-cheers"></i>
        </div>

        <div class="cart-container">
          <div class="cart-items">
            <!-- Item 1 -->
            <div class="cart-item">
              <div class="item-image">
                <img src="photos/logo.jpg" alt="Decoration item" />
              </div>
              <div class="item-details">
                <div class="item-name">Decoration/Item</div>
                <div class="item-price">Rs. 40000</div>
              </div>
              <button class="delete-btn">
                <i class="fas fa-trash"></i>
              </button>
            </div>

            <!-- Item 2 -->
            <div class="cart-item">
              <div class="item-image">
                <img src="photos/logo.jpg" alt="Decoration item" />
              </div>
              <div class="item-details">
                <div class="item-name">Decoration/Item</div>
                <div class="item-price">Rs. 40000</div>
              </div>
              <button class="delete-btn">
                <i class="fas fa-trash"></i>
              </button>
            </div>

            <!-- Item 3 -->
            <div class="cart-item">
              <div class="item-image">
                <img src="photos/logo.jpg" alt="Decoration item" />
              </div>
              <div class="item-details">
                <div class="item-name">Decoration/Item</div>
                <div class="item-price">Rs. 40000</div>
              </div>
              <button class="delete-btn">
                <i class="fas fa-trash"></i>
              </button>
            </div>

            <!-- Item 4 -->
            <div class="cart-item">
              <div class="item-image">
                <img src="photos/logo.jpg" alt="Decoration item" />
              </div>
              <div class="item-details">
                <div class="item-name">Decoration/Item</div>
                <div class="item-price">Rs. 40000</div>
              </div>
              <button class="delete-btn">
                <i class="fas fa-trash"></i>
              </button>
            </div>
            <div class="cart-item">
              <div class="item-image">
                <img src="photos/logo.jpg" alt="Decoration item" />
              </div>
              <div class="item-details">
                <div class="item-name">Decoration/Item</div>
                <div class="item-price">Rs. 40000</div>
              </div>
              <button class="delete-btn">
                <i class="fas fa-trash"></i>
              </button>
            </div>
            <div class="cart-item">
              <div class="item-image">
                <img src="photos/logo.jpg" alt="Decoration item" />
              </div>
              <div class="item-details">
                <div class="item-name">Decoration/Item</div>
                <div class="item-price">Rs. 40000</div>
              </div>
              <button class="delete-btn">
                <i class="fas fa-trash"></i>
              </button>
            </div>
          </div>

          <div class="cart-summary">
            <div class="summary-row">
              <div class="summary-label">Estimated Cost:</div>
              <div class="summary-value">Rs. 160000</div>
            </div>
            <div class="summary-row">
              <div class="summary-label">Discount Price:</div>
              <div class="summary-value">Rs. 0</div>
            </div>
            <div class="summary-row">
              <div class="summary-label">VAT:</div>
              <div class="summary-value">Rs. 20800</div>
            </div>
            <div class="total-row">
              <div>Total Amount:</div>
              <div>Rs. 180800</div>
            </div>
            <button class="checkout-btn">Check Out</button>
            <div class="payment-methods">
              <p>Thank You!</p>
              <img
                src="photos/weeding.jpg"
                alt="Payment methods"
                class="payment-image" />
            </div>
          </div>
        </div>
      </div>
    </div>
    	<jsp:include page="footer.jsp" />
    
  </body>
</html>
