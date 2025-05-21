<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Add or Edit User</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #ffeded; /* Secondary */
            padding: 40px;
        }
        .form-container {
            max-width: 500px;
            margin: auto;
            background-color: #ffffff;
            border: 1px solid #ddd;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        h2 {
            color: #E54E50; /* Primary */
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
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        input[readonly] {
            background-color: #f2f2f2;
            color: #999;
        }
        button {
            width: 100%;
            margin-top: 20px;
            padding: 12px;
            background-color: #E54E50; /* Primary */
            color: #fff;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #C1050B; /* Accent */
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
            color: #C1050B; /* Accent */
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
    <h2>${editUser != null ? "Edit User" : "Add New User"}</h2>
    
    <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/UserController" method="post">
        <!-- User ID - Hidden for new users -->
        <c:if test="${editUser != null}">
            <label>User ID:</label>
            <input type="text" name="id" value="${editUser.id}" readonly />
        </c:if>
        <c:if test="${editUser == null}">
            <input type="hidden" name="id" value="0" />
        </c:if>

        <!-- Username -->
        <label>Username:</label>
        <input type="text" name="name" value="${editUser.userName}" required />

        <!-- Email -->
        <label>Email:</label>
        <input type="email" name="email" value="${editUser.email}" required />

        <!-- Phone -->
        <label>Phone Number:</label>
        <input type="text" name="phone" value="${editUser.number}" required />
        
        <!-- Password -->
        <label>Password:</label>
        <input type="password" name="password" value="${editUser.password}" required />

        <!-- Submit -->
        <button type="submit">${editUser != null ? "Update User" : "Add User"}</button>
    </form>

    <a href="${pageContext.request.contextPath}/UserController">← Back to User List</a>
</div>

</body>
</html>
