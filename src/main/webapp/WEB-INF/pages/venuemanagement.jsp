<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parampara Events - Venue Management</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Sidebar Styles from Admin Dashboard */
.sidebar {
    width: 250px;
    background-color: white;
    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.05);
    padding: 20px 0;
    display: flex;
    flex-direction: column;
    position: relative;
}

.logo {
    padding: 0 20px 20px;
    border-bottom: 1px solid #f1f1f1;
}

.logo h2 {
    color: #333;
    font-weight: 600;
    line-height: 1.2;
}

.nav-menu {
    list-style: none;
    margin-top: 20px;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
}

.nav-menu li {
    padding: 12px 20px;
    display: flex;
    align-items: center;
    color: #666;
    cursor: pointer;
    transition: all 0.3s;
}

.nav-menu li:hover {
    background-color: #f8f9fa;
    color: #e74c3c;
}

.nav-menu li.active {
    color: #e74c3c;
    background-color: #fff0f0;
    border-left: 3px solid #e74c3c;
}
.active {
    color: #e74c3c;
    background-color: #fff0f0;
    border-left: 3px solid #e74c3c;
}

.nav-menu li i {
    margin-right: 10px;
    width: 20px;
    text-align: center;
}

.bottom-nav {
    margin-top: auto;
}
        /* Reset and base styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            display: flex;
            min-height: 100vh;
            background-color: #ffeded;
        }

        /* Sidebar styles */
        

        .sidebar-header {
            padding: 0 20px 20px;
        }

        .sidebar-header h1 {
            font-size: 24px;
            color: #333;
            font-weight: 600;
        }

        .sidebar-header h2 {
            font-size: 20px;
            color: #333;
            margin-top: -5px;
        }

        .sidebar-menu {
            margin-top: 20px;
        }

        .menu-item {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            color: #555;
            text-decoration: none;
            transition: background-color 0.2s;
        }

        .menu-item:hover {
            background-color: #f5f5f5;
        }

        .menu-item.active {
            background-color: #f0f0f0;
            color: #e74c3c;
            border-left: 3px solid #e74c3c;
        }

        .menu-item i {
            margin-right: 10px;
            font-size: 18px;
        }

        .menu-item span {
            font-size: 16px;
        }

        .sidebar-footer {
            margin-top: auto;
            border-top: 1px solid #e0e0e0;
            padding-top: 10px;
        }

        /* Main content styles */
        .main-content {
            flex: 1;
            padding: 20px;
            background-color: #ffeded;
        }

        /* Header styles */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 20px;
        }

        .search-container {
            flex: 1;
            max-width: 400px;
        }

        .search-input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="%23999" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><path d="M21 21l-4.35-4.35"/></svg>');
            background-repeat: no-repeat;
            background-position: 10px center;
            padding-left: 35px;
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .notification-icon {
            font-size: 20px;
            color: #555;
            margin-right: 20px;
            position: relative;
        }

        .notification-badge {
            position: absolute;
            top: -5px;
            right: -5px;
            background-color: #e74c3c;
            color: white;
            border-radius: 50%;
            width: 8px;
            height: 8px;
        }

        .profile-image {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
        }

        .profile-info {
            display: flex;
            flex-direction: column;
        }

        .profile-name {
            font-weight: 600;
            color: #333;
        }

        .profile-role {
            font-size: 12px;
            color: #777;
        }

        /* Content area styles */
        .content-area {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .content-title {
            font-size: 24px;
            color: #333;
            font-weight: 600;
        }

        .venue-search-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .venue-search {
            width: 300px;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="%23999" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><path d="M21 21l-4.35-4.35"/></svg>');
            background-repeat: no-repeat;
            background-position: 10px center;
            padding-left: 35px;
        }

        .add-venue-btn {
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 14px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
        }

        .add-venue-btn:hover {
            background-color: #d44637;
        }

        /* Table styles */
        .venues-table {
            width: 100%;
            border-collapse: collapse;
        }

        .venues-table th {
            text-align: left;
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
            color: #555;
            font-weight: 600;
        }

        .venues-table td {
            padding: 15px;
            border-bottom: 1px solid #eee;
            color: #666;
        }

        .no-venues {
            padding: 20px 15px;
            color: #777;
            text-align: center;
        }

        /* Action buttons */
        .action-btn {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 4px;
            color: white;
            text-decoration: none;
            margin-right: 5px;
        }
        
        .edit-btn {
            background-color: #3498db;
        }
        
        .delete-btn {
            background-color: #e74c3c;
        }

        /* Responsive styles */
        @media (max-width: 768px) {
            body {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                padding: 10px 0;
            }
            
            .venues-table {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <!-- Sidebar -->
<jsp:include page="sidebar.jsp"/>


    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="header">
            <div class="search-container">
                <input type="text" class="search-input" placeholder="Search......" />
            </div>
            <div class="user-profile">
                <div class="notification-icon">
                    🔔
                    <span class="notification-badge"></span>
                </div>
                <img src="https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%202025-05-06%20205818-LMsShAhNSj2827hB66we2VjO0oKDIP.png" alt="Profile" class="profile-image" />
                <div class="profile-info">
                    <span class="profile-name">Sneha Sapkota</span>
                    <span class="profile-role">ADMIN</span>
                </div>
            </div>
        </div>

        <!-- Content Area -->
        <div class="content-area">
            <div class="content-header">
                <h2 class="content-title">Venue Management</h2>
            </div>
            
            <div class="venue-search-container">
                <input type="text" class="venue-search" placeholder="Search venues..." />
                <a href="${pageContext.request.contextPath}/EventManagement?section=venue&action=add" class="add-venue-btn">
                    <span>➕</span>
                    <span>Add Venue</span>
                </a>
            </div>

            <table class="venues-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>Capacity</th>
                        <th>Facilities</th>
                        <th>Availability</th>
                        <th>Tags</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty venueList && venueList.size() > 0}">
                            <c:forEach var="venue" items="${venueList}">
                                <tr>
                                    <td>${venue.id}</td>
                                    <td>${venue.name}</td>
                                    <td>${venue.address}</td>
                                    <td>${venue.capacity}</td>
                                    <td>${venue.facilities}</td>
                                    <td>${venue.availability}</td>
                                    <td>${venue.venueTags}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/EventManagement?section=venue&action=edit&id=${venue.id}" class="action-btn edit-btn">
                                            ✏️ Edit
                                        </a>
                                        <a href="${pageContext.request.contextPath}/EventManagement?section=venue&action=delete&id=${venue.id}" 
                                           onclick="return confirm('Are you sure you want to delete this venue?');" 
                                           class="action-btn delete-btn">
                                            🗑️ Delete
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="8" class="no-venues">No venues found</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
