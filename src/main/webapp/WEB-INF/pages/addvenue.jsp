<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Add or Edit Venue</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #ffeded;
            padding: 40px;
        }
        .form-container {
            max-width: 600px;
            margin: auto;
            background-color: #ffffff;
            border: 1px solid #ddd;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        h2 {
            color: #E54E50;
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        input[type="text"], input[type="number"], textarea, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        textarea {
            height: 100px;
            resize: vertical;
        }
        input[readonly] {
            background-color: #f2f2f2;
            color: #999;
        }
        button {
            width: 100%;
            margin-top: 20px;
            padding: 12px;
            background-color: #E54E50;
            color: #fff;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #C1050B;
        }
        a {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            color: #E54E50;
            text-align: center;
            width: 100%;
        }
        a:hover {
            color: #C1050B;
        }
        .error-message {
            color: #E54E50;
            margin-top: 10px;
            padding: 10px;
            background-color: #ffeeee;
            border-radius: 5px;
            border-left: 3px solid #E54E50;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>${venue != null ? "Edit Venue" : "Add New Venue"}</h2>
    
    <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/EventManagement" method="post">
        <input type="hidden" name="section" value="venue" />
        
        <!-- Venue ID - Hidden for new venues -->
        <c:if test="${venue != null}">
            <label>Venue ID:</label>
            <input type="text" name="id" value="${venue.id}" readonly />
        </c:if>
        <c:if test="${venue == null}">
            <input type="hidden" name="id" value="0" />
        </c:if>

        <!-- Name -->
        <label>Venue Name:</label>
        <input type="text" name="name" value="${venue.name}" required />

        <!-- Address -->
        <label>Address:</label>
        <textarea name="address" required>${venue.address}</textarea>

        <!-- Capacity -->
        <label>Capacity (people):</label>
        <input type="number" name="capacity" value="${venue.capacity}" min="1" required />
        
        <!-- Facilities -->
        <label>Facilities:</label>
        <textarea name="facilities" placeholder="e.g. Parking, WiFi, Air Conditioning, etc.">${venue.facilities}</textarea>
        
        <!-- Availability -->
        <label>Availability:</label>
        <select name="availability" required>
            <option value="">Select availability</option>
            <option value="Available" ${venue.availability == 'Available' ? 'selected' : ''}>Available</option>
            <option value="Booked" ${venue.availability == 'Booked' ? 'selected' : ''}>Booked</option>
            <option value="Under Maintenance" ${venue.availability == 'Under Maintenance' ? 'selected' : ''}>Under Maintenance</option>
        </select>
        
        <!-- Venue Tags -->
        <label>Venue Tags (comma separated):</label>
        <input type="text" name="venueTags" value="${venue.venueTags}" placeholder="e.g. wedding, corporate, outdoor, indoor" />

        <!-- Submit -->
        <button type="submit">${venue != null ? "Update Venue" : "Add Venue"}</button>
    </form>

    <a href="${pageContext.request.contextPath}/EventManagement?section=venue">← Back to Venue List</a>
</div>

</body>
</html>
