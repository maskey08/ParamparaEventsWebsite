<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="jakarta.servlet.http.HttpServletRequest"%>


<%
	// Initialize necessary objects and variables
	HttpSession userSession = request.getSession(false);
	String currentUser = (String) (userSession != null ? userSession.getAttribute("userName") : null);
	// need to add data in attribute to select it in JSP code using JSTL core tag
	pageContext.setAttribute("currentUser", currentUser);
	String contextPath = request.getContextPath();
	// Determine action URL and button label based on user session
	String actionUrl;
	String formMethod; 
	String buttonLabel;
	
	if (currentUser != null) {
		actionUrl=contextPath + "/logout";
		formMethod="POST"; // Call dopost in Logout Controller
		buttonLabel="Logout";
	} else {
		actionUrl = contextPath + "/login";
		formMethod="GET"; // Call dopost in Logout Controller
		buttonLabel="Login";
	}
%>
<%
    Integer userId = (Integer) session.getAttribute("userId");
    pageContext.setAttribute("userId", userId);
%>
<style>
 * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: "Hanken Grotesk", sans-serif;
        line-height: 1.6;
        color: #333;
      }

      .header {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        z-index: 1000;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 10px 30px;
        transition: background-color 0.4s ease, box-shadow 0.4s ease;
        
      }

      .header.scrolled {
background-color: #fbf5f5;
border-bottom: 1px solid rgb(0 0 0 / 10%);
      }
 

      .nav {
        display: flex;
        gap: 50px;
        align-items: center;
      }

       a {
        font-size: 17px;
        text-decoration: none;
        color: #000;
        transition: color 0.3s ease;
      }

       a:hover {
        color: #e74c3c;
      }

      #logo img {
        height: 60px;
      }
      .user-button {
            padding: 10px 20px;
            background-color: #e74346; 
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            color: #fff; 
            transition: all 0.3s;
           
             transform: translateY(-10%);
            
        }
        
        .user-button:hover {
            background-color: #c1050b; 
            color: #fff;
        }

      .icon {
        position: absolute;
        right: 30px;
        top: 50%;
        transform: translateY(-45%);
        display: flex;
        align-items: center;
        align-items: center;
        gap: 15px;
      }

      .search {
        display: flex;
        align-items: center;
        gap: 5px;
         transition: width 0.3s ease;
      }

      .search-bar {
        border: none;
        background-color: inherit;
        width: 125px;
        height: 24px;
        padding: 0 4px;
        font-size: 14px;
        outline: none;
        vertical-align: middle;                	
      }

      .search:has(.search-bar:focus) {
        border-bottom: 1px solid #000;
      }
      .search:hover .search-icon svg {
		  width: 20px;
		  height: 20px;
		  
		}
				

      .search-icon svg {
        width: 23px;
        height: 23px;
        transition: width 0.3s ease, height 0.3s ease;
      }

      .search-bar:focus + .search-icon svg {
        width: 20px;
        height: 20px;
      }

      .search-icon {
        border: none;
        background-color: inherit;
        cursor: pointer;
        padding: 0;
      }

      .search-icon:hover {
        color: #e74c3c;
      }

</style>
<header class="header" id="navbar">
      <div class="nav">
        <a href="${pageContext.request.contextPath}/services">Services</a>
        <a href="${pageContext.request.contextPath}/aboutus">About Us</a>
        <a id="logo" href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/resources/images/system/logo.png" alt="Logo" /></a>
        <a href="${pageContext.request.contextPath}/gallery">Gallery</a>
        <a href="${pageContext.request.contextPath}/contactus">Contact Us</a>
        <div class="icon">
          <div class="search">
            <input type="text" id="search-bar" class="search-bar" />
            <button class="search-icon">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="1.5"
                stroke-linecap="round"
                stroke-linejoin="round"
                class="feather feather-search"
              >
                <circle cx="11" cy="11" r="8" />
                <line x1="21" y1="21" x2="16.65" y2="16.65" />
              </svg>
            </button>
          </div>
<a href="${pageContext.request.contextPath}/profile?id=${userId}">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
              class="feather feather-user"
            >
              <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
              <circle cx="12" cy="7" r="4" />
            </svg>
          </a>
            <c:choose>
				<c:when test="${not empty currentUser}">
					<form action="${pageContext.request.contextPath}/logout" method="POST">
						<input type="submit" class="user-button" value="Logout" />
					</form>
				</c:when>
				<c:otherwise>
					<a class="user-button" href="${pageContext.request.contextPath}/login">Login</a>
				</c:otherwise>
			</c:choose>
			<%
				response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
				response.setHeader("Pragma", "no-cache");
				response.setDateHeader("Expires", 0);
			%>
				
          
        </div>
      </div>
    </header>
   
	
	