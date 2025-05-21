<style>
      .brand-container {
        width: 200px;
        justify-content: center;
        align-items: center;
      }
      #brand-logo {
        width: 80%;
      }
      #brand-name {
        width: 80%;
        font-size: 120%;
      }
      .footer-links {
        display: flex;
        flex: 4;
        justify-content: space-between;
        padding: 25px 25px;
        gap: 20px;
      }
      .footer-column {
        display: block;
        justify-content: center;
        align-items: center;
        width: 25%;
        padding: 0 25px;
      }
      .footer-break {
        background-image: url("/dhaka.png");
        background-repeat: repeat;
        background-size: 350px AUTO;
        background-position-y: bottom;
        opacity: 10%;
        height: 15px;
        width: 100%;
      }
      .footer-legal {
        padding-bottom: 3px;
        display: flex;
        gap: 25px;
        justify-content: center;
        align-items: center;
        height: 45px;
        font-size: 14px;
      }
    </style>
    <footer class="footer" id="footer">
      <div class="footer-links">
        <div class="footer-column">
          <div class="brand-container">
            <img id="brand-logo" src="logo.png" alt="Logo" />
            <p id="brand-name">Parampara Events</p>
          </div>
        </div>
        <div class="footer-column">
          <h3>Quick Links</h3>
          <p>Book Venue</p>
          <p>Decorations</p>
          <p>Talent</p>
          <p>Planner</p>
          <p>Custom Booking</p>
        </div>
        <div class="footer-column">
          <h3>Support</h3>
          <p>help@paramparaevents.com</p>
          <p>+977 9843236988</p>
          <p>Visit Us</p>
        </div>
        <div class="footer-column">
          <h3>Connect</h3>
          <div class="social-icons">
            <a href="#" class="social-icon">FB</a>
            <a href="#" class="social-icon">IG</a>
            <a href="#" class="social-icon">TW</a>
          </div>
        </div>
      </div>
      <div class="footer-break"></div>
      <div class="footer-legal">
        <p>© 2025 Prampara Events</p>
        <p>Terms & Condition</p>
        <p>Privacy Policy</p>
      </div>
    </footer>