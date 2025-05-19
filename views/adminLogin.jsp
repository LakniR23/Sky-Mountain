<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <h1>Welcome Back</h1>
            <p>Please enter your credentials to log in</p>
        </div>
        
        <form action="${pageContext.request.contextPath}/adminLoginServlet" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="adminEmail" placeholder="Enter your email" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="adminPassword" placeholder="Enter your password" required>
            </div>
            
            <button type="submit" class="login-button">Log In</button>
            
            <div class="forgot-password">
                <a href="${pageContext.request.contextPath}/views/adminForgetPassword.jsp">Forgot your password?</a>
            </div>
        </form>
    </div>
</body>
</html>