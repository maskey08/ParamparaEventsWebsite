<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Modify Services | Parampara Events</title>
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
    <h2>${service != null ? "Edit Service" : "Add New Service"}</h2>
    
    <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/EventManagement" method="post">
        <input type="hidden" name="section" value="service" />
        
        <!-- Service ID - Hidden for new services -->
        <c:if test="${service != null}">
            <label>Service ID:</label>
            <input type="text" name="id" value="${service.serviceId}" readonly />
        </c:if>
        <c:if test="${service == null}">
            <input type="hidden" name="id" value="0" />
        </c:if>

        <!-- Name -->
        <label>Service Name:</label>
        <input type="text" name="name" value="${service.name}" required />

        <!-- Description -->
        <label>Description:</label>
        <textarea name="description" required>${service.description}</textarea>

        <!-- Cost -->
        <label>Cost (Rs.):</label>
        <input type="number" name="cost" value="${service.cost}" step="0.01" min="0" required />
        
        <!-- Type -->
        <label>Type:</label>
        <select name="type" required>
            <option value="">Select a type</option>
            <option value="Catering" ${service.type == 'Catering' ? 'selected' : ''}>Catering</option>
            <option value="Decoration" ${service.type == 'Decoration' ? 'selected' : ''}>Decoration</option>
            <option value="Photography" ${service.type == 'Photography' ? 'selected' : ''}>Photography</option>
            <option value="Entertainment" ${service.type == 'Entertainment' ? 'selected' : ''}>Entertainment</option>
            <option value="Transportation" ${service.type == 'Transportation' ? 'selected' : ''}>Transportation</option>
            <option value="Other" ${service.type == 'Other' ? 'selected' : ''}>Other</option>
        </select>
        
        <!-- Service Tags -->
        <label>Service Tags (comma separated):</label>
        <input type="text" name="serviceTags" value="${service.serviceTags}" placeholder="e.g. premium, wedding, corporate" />

        <!-- Submit -->
        <button type="submit">${service != null ? "Update Service" : "Add Service"}</button>
    </form>

    <a href="${pageContext.request.contextPath}/EventManagement?section=service">← Back to Service List</a>
</div>

</body>
</html>
