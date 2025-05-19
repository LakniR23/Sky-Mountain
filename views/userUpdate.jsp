<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
	<title>View Messages/Inquiries</title>
	
	<!----======== CSS ======== -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminDashboard.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userUpdate.css">
	
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
	<nav>
        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/views/adminDashboard.jsp">
                    <i class="uil uil-dashboard"></i>
                    <span class="link-name">Dashboard</span>
                </a></li>
                <li><a href="${pageContext.request.contextPath}/userRead_getAll">
                    <i class="uil uil-users-alt"></i>
                    <span class="link-name">User Management</span>
                </a></li>
                <li><a href="${pageContext.request.contextPath}/adminReadServlet">
                    <i class="uil uil-users-alt"></i>
                    <span class="link-name">Admin Management</span>
                </a></li>
                
                <li><a href="${pageContext.request.contextPath}/contactReadServlet">
                    <i class="uil uil-envelope-alt"></i>
                    <span class="link-name">View Messages/Inquiries</span>
                </a></li>
                <li><a href="${pageContext.request.contextPath}/AppointmentReadServlet">
                    <i class="uil uil-calendar-alt"></i>
                    <span class="link-name">View Appointments</span>
                </a></li>
                <li><a href="${pageContext.request.contextPath}/views/adminProfile.jsp">
                    <i class="uil uil-user-circle"></i>
                    <span class="link-name">My Profile</span>
                </a></li>                
            </ul>
            
            <ul class="logout-mode">
                <li><a href="${pageContext.request.contextPath}/views/adminLogin.jsp">
                    <i class="uil uil-signout"></i>
                    <span class="link-name">Logout</span>
                </a></li>

                
            </ul>
        </div>
    </nav>
    
    <section class="dashboard">
        <div class="top">
            <!--<i class="uil uil-bars sidebar-toggle"></i>  -->

            <img src="${pageContext.request.contextPath}/images/sky-mountain-high-resolution-logo-transparent (1).png" alt="">
            
            <div class="welcome-message">
                Hi <span class="font-bold">${admin.adminName}</span>! Welcome back!
            </div>
        </div>
    
    <%
 
    String id = request.getParameter("id");
	String name =request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");
	String nic = request.getParameter("nic");
	String password = request.getParameter("password");
 
 %>
  
  <div class="container">
        <h2>Update User Details</h2>
        <form action="${pageContext.request.contextPath}/userUpdateServlet" method="post">

            <input type="hidden" name="uID" value="<%=id%>" />

            <div class="input-field">
                <i class="fas fa-user"></i>
                <input type="text" name="uName" value="<%=name%>" placeholder="Full Name" required />
            </div>

            <div class="input-field">
                <i class="fas fa-envelope"></i>
                <input type="email" name="uEmail" value="<%=email%>" placeholder="Email" required />
            </div>

            <div class="input-field">
                <i class="fas fa-phone"></i>
                <input type="text" name="uPhone" value="<%=phone%>" placeholder="Phone Number" required />
            </div>

            <label class="gender-label">Gender</label>
            <div class="gender">
                <input type="radio" name="uGender" value="Male" <%= gender != null && gender.equals("Male") ? "checked" : "" %> /> Male
                <input type="radio" name="uGender" value="Female" <%= gender != null && gender.equals("Female") ? "checked" : "" %> /> Female
            </div>

            <div class="input-field">
                <i class="fas fa-id-card"></i>
                <input type="text" name="uNIC" value="<%=nic%>" placeholder="National Identity Card Number" required />
            </div>

            <div class="input-field">
                <i class="fas fa-lock"></i>
                <input type="password" name="uPassword" value="<%=password%>" placeholder="Password" required />
            </div>

            <button class="btn green-btn" type="submit">Update</button>
        </form>
        
        <br>
        
        <a href="${pageContext.request.contextPath}/userReadServlet" class="button-return"><button type="button" >Cancel</button></a>
        
    </div>
</section>

    <script src="${pageContext.request.contextPath}/js/registration.js"></script>
   
   <!-- Added Footer -->
    <footer class="footer">
        <div class="footer-content">
            <p>&copy; 2025 Sky Mountain Properties. All rights reserved.</p>
            <p class="footer-links">
                <a href="../terms.html" class="text">Terms of Service</a>
                 <a href="../privacy2.html" class="text">Privacy Policy</a>
            </p>
        </div>
    </footer>
</body>
</html>