<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Parampara Events</title>
    
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
/* Your existing CSS styles here */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background-color: #ffeded;
}

.container {
    display: flex;
    min-height: 100vh;
}

/* Sidebar Styles */
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

.nav-menu li i {
    margin-right: 10px;
    width: 20px;
    text-align: center;
}

.bottom-nav {
    margin-top: auto;
}

/* Main Content Styles */
.main-content {
    flex: 1;
    padding: 20px;
    overflow-y: auto;
}

/* Header Styles */
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.search-container {
    position: relative;
    width: 300px;
}

.search-input {
    width: 100%;
    padding: 10px 15px 10px 40px;
    border: 1px solid #e1e1e1;
    border-radius: 5px;
    font-size: 14px;
    outline: none;
}

.search-container i {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: #999;
}

.user-info {
    display: flex;
    align-items: center;
}

.notification {
    margin-right: 20px;
    position: relative;
    cursor: pointer;
}

.notification i {
    font-size: 18px;
    color: #666;
}

.user {
    display: flex;
    align-items: center;
}

.user-img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    object-fit: cover;
    margin-right: 10px;
}

.user-details h4 {
    font-size: 14px;
    margin-bottom: 2px;
}

.user-details span {
    font-size: 12px;
    color: #999;
}

/* Stats Section Styles */
.stats-section {
    margin-bottom: 20px;
}

.stats-section h2 {
    margin-bottom: 15px;
    font-size: 18px;
    color: #333;
}

.stats-cards {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
}

.stat-card {
    background-color: #fff;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
    background-color: #fff5f5;
}

.stat-info h3 {
    font-size: 14px;
    color: #666;
    margin-bottom: 10px;
}

.stat-info h2 {
    font-size: 24px;
    color: #333;
    margin-bottom: 0;
}

/* Welcome Section Styles */
.welcome-section {
    background-color: white;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
}

.welcome-section h2 {
    font-size: 20px;
    color: #333;
    margin-bottom: 5px;
}

.welcome-section p {
    color: #666;
    font-size: 14px;
}

/* Table Styles */
.events-table {
    width: 100%;
    background-color: white;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
    margin-bottom: 20px;
    border-collapse: collapse;
}

.events-table thead {
    background-color: #f8f9fa;
}

.events-table th {
    padding: 15px 20px;
    text-align: left;
    font-weight: 600;
    color: #333;
    border-bottom: 1px solid #e1e1e1;
}

.events-table td {
    padding: 15px 20px;
    border-bottom: 1px solid #f1f1f1;
}

.events-table tbody tr:last-child td {
    border-bottom: none;
}

/* Event ID styling */
.events-table td:first-child {
    font-weight: 500;
    color: #555;
    font-family: monospace;
}

.status {
    display: inline-flex;
    align-items: center;
    padding: 5px 10px;
    border-radius: 15px;
    font-size: 12px;
}

.status.pending {
    color: #f39c12;
}

.status.in-progress {
    color: #3498db;
}

.status.paid {
    color: #2ecc71;
}

/* Action Buttons */
.actions {
    display: flex;
    gap: 10px;
}

.edit-btn, .delete-btn {
    padding: 6px 12px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 12px;
    display: flex;
    align-items: center;
    gap: 5px;
    transition: background-color 0.3s;
}

.edit-btn {
    background-color: #3498db;
    color: white;
}

.edit-btn:hover {
    background-color: #2980b9;
}

.delete-btn {
    background-color: #e74c3c;
    color: white;
}

.delete-btn:hover {
    background-color: #c0392b;
}

/* Hover effect for rows */
.events-table tbody tr:hover {
    background-color: #f9f9f9;
}

/* Responsive Styles */
@media (max-width: 768px) {
    .events-table {
        display: block;
        overflow-x: auto;
    }
    
    .actions {
        flex-direction: column;
        gap: 5px;
    }
    
    .edit-btn, .delete-btn {
        padding: 4px 8px;
    }
}

/* Action Buttons */
.actions {
    display: flex;
    gap: 10px;
}

.edit-btn, .delete-btn {
    padding: 6px 12px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 12px;
    display: flex;
    align-items: center;
    gap: 5px;
    transition: background-color 0.3s;
}

.edit-btn {
    background-color: #3498db;
    color: white;
}

.edit-btn:hover {
    background-color: #2980b9;
}

.delete-btn {
    background-color: #e74c3c;
    color: white;
}

.delete-btn:hover {
    background-color: #c0392b;
}

/* Responsive Styles */
@media (max-width: 768px) {
    .events-table {
        display: block;
        overflow-x: auto;
    }
    
    .actions {
        flex-direction: column;
        gap: 5px;
    }
    
    .edit-btn, .delete-btn {
        padding: 4px 8px;
    }
}

/* Bottom Section Styles */
.bottom-section {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
}

/* Calendar Widget Styles */
.calendar-widget {
    background-color: white;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
}

.calendar-header {
    margin-bottom: 15px;
}

.month-nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.month-nav span {
    font-weight: 600;
    color: #333;
}

.nav-arrows i {
    margin-left: 10px;
    cursor: pointer;
    color: #666;
}

.calendar-days {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    text-align: center;
    margin-bottom: 10px;
}

.weekday {
    font-weight: 600;
    color: #666;
    padding: 5px;
}

.calendar-dates {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    gap: 5px;
}

.date {
    text-align: center;
    padding: 8px;
    border-radius: 50%;
    cursor: pointer;
    font-size: 14px;
}

.date.prev-month, .date.next-month {
    color: #ccc;
}

.date.active {
    background-color: #e74c3c;
    color: white;
}

/* Chart Container Styles */
.chart-container {
    background-color: white;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
}

.chart-tabs {
    display: flex;
    border-bottom: 1px solid #f1f1f1;
    margin-bottom: 20px;
}

.tab {
    padding: 10px 15px;
    cursor: pointer;
    color: #666;
    position: relative;
}

.tab.active {
    color: #e74c3c;
}

.tab.active::after {
    content: '';
    position: absolute;
    bottom: -1px;
    left: 0;
    width: 100%;
    height: 2px;
    background-color: #e74c3c;
}

.chart {
    height: 200px;
    position: relative;
    border-bottom: 1px solid #f1f1f1;
    margin-bottom: 10px;
}

.chart-points {
    position: relative;
    height: 100%;
}

.point {
    position: absolute;
    width: 10px;
    height: 10px;
    background-color: #e74c3c;
    border-radius: 50%;
    transform: translate(-50%, 50%);
}

.chart-x-axis {
    display: flex;
    justify-content: space-between;
    padding-top: 10px;
}

.month {
    font-size: 12px;
    color: #666;
}

/* Responsive Styles */
@media (max-width: 1024px) {
    .stats-cards {
        grid-template-columns: repeat(2, 1fr);
    }
    
    .bottom-section {
        grid-template-columns: 1fr;
    }
}

@media (max-width: 768px) {
    .container {
        flex-direction: column;
    }
    
    .sidebar {
        width: 100%;
        padding: 10px 0;
    }
    
    .nav-menu {
        flex-direction: row;
        flex-wrap: wrap;
        justify-content: center;
    }
    
    .nav-menu li {
        padding: 8px 15px;
    }
    
    .stats-cards {
        grid-template-columns: 1fr;
    }
    
    .table-header, .table-row {
        grid-template-columns: 1fr;
    }
    
    .column {
        padding: 5px 0;
    }
}
</style>
</head>
<body>
    <div class="container">
    <!-- Sidebar -->
<jsp:include page="sidebar.jsp"/>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Header -->
            <div class="header">
                <div class="search-container">
                    <i class="fas fa-search"></i>
                    <input type="text" placeholder="Search......" class="search-input">
                </div>
                <div class="user-info">
                    <div class="notification">
                        <i class="fas fa-bell"></i>
                    </div>
                    <div class="user">
                        <img src="https://hebbkx1anhila5yf.public.blob.vercel-storage.com/screencapture-127-0-0-1-5500-fvgffb-html-2025-05-06-20_30_07-SrYtW0bhqAbmDos6wr5g1uGikPLPQv.png" alt="User Profile" class="user-img">
                        <div class="user-details">
                            <h4>Sneha Sapkota</h4>
                            <span>ADMIN</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Stats Section -->
            <div class="stats-section">
                <h2>Last Month</h2>
                <div class="stats-cards">
                    <div class="stat-card">
                        <div class="stat-info">
                            <h3>Total Users</h3>
                            <h2>${totalUsers}</h2>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-info">
                            <h3>Upcoming Event</h3>
                            <h2>100</h2>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-info">
                            <h3>Revenue This Month</h3>
                            <h2>Rs. 592380</h2>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-info">
                            <h3>Pending Payment</h3>
                            <h2>Rs. 320000</h2>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Welcome Section -->
            <div class="welcome-section">
                <h2>Welcome to Admin Dashboard!</h2>
                <p>Event Management System</p>
            </div>

            <!-- Users Table -->
            <table class="events-table">
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Phone Number</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty recentUsers}">
                            <c:forEach var="user" items="${recentUsers}">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.userName}</td>
                                    <td>${user.email}</td>
                                    <td>${user.number}</td>
                                    <td class="actions">
                                        <a style="text-decoration:none" href="UserController?action=edit&id=${user.id}">
                                            <button class="edit-btn"><i class="fas fa-edit"></i> Edit</button>
                                        </a>
                                        <a style="text-decoration:none" href="UserController?action=delete&id=${user.id}" onclick="return confirm('Are you sure you want to delete this user?');">
                                            <button class="delete-btn"><i class="fas fa-trash"></i> Delete</button>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="5" style="text-align: center;">No users found</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
            
            <!-- Calendar and Chart Section -->
            <div class="bottom-section">
                <div class="calendar-widget">
                    <div class="calendar-header">
                        <div class="month-nav">
                            <span>March 2021</span>
                            <div class="nav-arrows">
                                <i class="fas fa-chevron-left"></i>
                                <i class="fas fa-chevron-right"></i>
                            </div>
                        </div>
                    </div>
                    <div class="calendar-days">
                        <div class="weekday">M</div>
                        <div class="weekday">T</div>
                        <div class="weekday">W</div>
                        <div class="weekday">T</div>
                        <div class="weekday">F</div>
                        <div class="weekday">S</div>
                        <div class="weekday">S</div>
                    </div>
                    <div class="calendar-dates">
                        <div class="date prev-month">27</div>
                        <div class="date prev-month">28</div>
                        <div class="date">1</div>
                        <div class="date">2</div>
                        <div class="date">3</div>
                        <div class="date">4</div>
                        <div class="date">5</div>
                        <div class="date">6</div>
                        <div class="date">7</div>
                        <div class="date">8</div>
                        <div class="date">9</div>
                        <div class="date">10</div>
                        <div class="date">11</div>
                        <div class="date">12</div>
                        <div class="date active">13</div>
                        <div class="date">14</div>
                        <div class="date">15</div>
                        <div class="date">16</div>
                        <div class="date">17</div>
                        <div class="date">18</div>
                        <div class="date">19</div>
                        <div class="date">20</div>
                        <div class="date">21</div>
                        <div class="date">22</div>
                        <div class="date">23</div>
                        <div class="date">24</div>
                        <div class="date">25</div>
                        <div class="date">26</div>
                        <div class="date">27</div>
                        <div class="date">28</div>
                        <div class="date">29</div>
                        <div class="date">30</div>
                        <div class="date">31</div>
                        <div class="date next-month">1</div>
                        <div class="date next-month">2</div>
                        <div class="date next-month">3</div>
                    </div>
                </div>
                <div class="chart-container">
                    <div class="chart-tabs">
                        <div class="tab active">Users</div>
                        <div class="tab">Projects</div>
                        <div class="tab">Operating Status</div>
                    </div>
                    <div class="chart">
                        <div class="chart-points">
                            <div class="point" style="bottom: 30%; left: 10%"></div>
                            <div class="point" style="bottom: 50%; left: 25%"></div>
                            <div class="point" style="bottom: 20%; left: 40%"></div>
                            <div class="point" style="bottom: 60%; left: 55%"></div>
                            <div class="point" style="bottom: 40%; left: 70%"></div>
                            <div class="point" style="bottom: 70%; left: 85%"></div>
                        </div>
                        <div class="chart-x-axis">
                            <div class="month">Jan</div>
                            <div class="month">Feb</div>
                            <div class="month">Mar</div>
                            <div class="month">Apr</div>
                            <div class="month">May</div>
                            <div class="month">Jun</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
