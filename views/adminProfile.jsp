<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Profile</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminDashboard.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateAdminProfile.css">
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>

<nav>
        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/views/adminDashboard.jsp">
                    <i class="uil uil-dashboard"></i>
                    <span class="link-name">Dashboard</span>
                </a></li>
                <li><a href="${pageContext.request.contextPath}/userReadServlet">
                    <i class="uil uil-users-alt"></i>
                    <span class="link-name">User Management</span>
                </a></li>
                <li><a href="${pageContext.request.contextPath}/adminReadServlet">
                    <i class="uil uil-users-alt"></i>
                    <span class="link-name">Admin Management</span>
                </a></li>
                <li><a href="${pageContext.request.contextPath}/propertyAdminDisplay.jsp">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">Property Management</span>
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
        <!--  <i class="uil uil-bars sidebar-toggle"></i>-->
        <img src="${pageContext.request.contextPath}/images/sky-mountain-high-resolution-logo-transparent (1).png" alt="">
        <div class="welcome-message">
                Hi <span class="font-bold">${admin.adminName}</span>! Welcome back!
            </div>
    </div>


    <div class="container">
        <h2>My Profile</h2>
	        <form action="${pageContext.request.contextPath}/adminProfileUpdateServlet" method="post">
	
	    <!-- Hidden ID field -->
	    <div class="input-group">
	        <input type="hidden" name="adminID" value="${admin.adminID}" readonly>
	    </div>
	
	    <!-- Admin Name -->
	    <div class="input-group">
	        <label><i class="fas fa-user"></i> Name</label>
	        <input type="text" name="adminName" value="${admin.adminName}" readonly>
	    </div>
	
	    <!-- Username -->
	    <div class="input-group">
	        <label><i class="fas fa-id-badge"></i> User Name</label>
	        <input type="text" name="adminUserName" value="${admin.adminUserName}" readonly>
	    </div>
	
	    <!-- Password -->
	    <div class="input-group">
	        <label><i class="fas fa-lock"></i> Password</label>
	        <input type="text" name="adminPassword" value="${admin.adminPassword}" required>
	    </div>
	
	    <!-- Email -->
	    <div class="input-group">
	        <label><i class="fas fa-envelope"></i> Email</label>
	        <input type="email" name="adminEmail" value="${admin.adminEmail}" required>
	    </div>
	
	    <!-- Phone -->
	    <div class="input-group">
	        <label><i class="fas fa-phone"></i> Phone</label>
	        <input type="tel" name="adminPhone" value="${admin.adminPhone}" required>
	    </div>
	
	    <!-- Submit Button -->
	    <button type="submit">Update Profile</button>
	</form>

        

        
        <!--<h1>Name : ${admin.adminName}</h1>
        <h1>User Name : ${admin.adminUserName}</h1>
        <h1>Password : ${admin.adminPassword}</h1>
        <h1>Email : ${admin.adminEmail}</h1>
        <h1>Phone : ${admin.adminPhone}</h1>-->
        
    </div>

</section>

<script src="${pageContext.request.contextPath}/js/adminDashboard.js"></script>

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
