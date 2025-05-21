
<div class="sidebar">
    <div class="logo">
        <h2>Parampara</h2>
        <h2>Events</h2>
    </div>
    <ul class="nav-menu">
        <a href="${pageContext.request.contextPath}/dashboard" style="text-decoration: none; color: inherit;">
        <li id="dashboard">            
            <i class="fas fa-th-large"></i>
                <span>Dashboard</span>
        </li>
        </a>
            <a href="${pageContext.request.contextPath}/UserController" style="text-decoration: none; color: inherit;">
       <li id="users">
            <i class="fas fa-users"></i>
                <span>Users</span>
        </li>
            </a>
              <a href="${pageContext.request.contextPath}/EventManagement" style="text-decoration: none; color: inherit;">
      <li id="events">
            <i class="fas fa-calendar-check"></i>
                <span>Events</span>
        </li>
            </a>
            <a href="${pageContext.request.contextPath}/EventManagement?section=venue&action=add" style="text-decoration: none; color: inherit;">
        <li>
            <i class="fas fa-building"></i>
                <span>Add Venue</span>
        </li>
            </a>
        <li>
             <a href="${pageContext.request.contextPath}/EventManagement?section=service&action=add" style="text-decoration: none; color: inherit;">
           <i class="fas fa-concierge-bell"></i>
                <span>Add Service</span>
        </li>
            </a>
        <li>
            <i class="fas fa-credit-card"></i>
            <span>Payment</span>
        </li>
        <li>
            <i class="fas fa-calendar"></i>
            <span>Calendar</span>
        </li>
        <li>
            <i class="fas fa-file-alt"></i>
            <span>Report</span>
        </li>
        <a href="${pageContext.request.contextPath}/logout" style="text-decoration: none; color: inherit;">
        <li class="bottom-nav" style="margin-top:50px">
            <i class="fas fa-sign-out-alt"></i>
            <span>Logout</span>
        </li>
        </a>
    </ul>
</div>
<script>
    const url = window.location.pathname + window.location.search;
    
    const menuMappings = {
      "/dashboard": "dashboard",
      "/UserController": "users",
      "/EventManagement": "events",
      "/EventManagement?section=venue&action=add": "addVenue",
      "/EventManagement?section=service&action=add": "addService",
      "/logout": "logout"
    };

    for (const [path, id] of Object.entries(menuMappings)) {
      if (url.includes(path)) {
        document.getElementById(id)?.classList.add("active");
        break;
      }
    }
  </script>
