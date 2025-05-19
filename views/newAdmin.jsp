<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Admin</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminDashboard.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/addAdmin.css">
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
                <li><a href="#">
                    <i class="uil uil-users-alt"></i>
                    <span class="link-name">User Management</span>
                </a></li>
                 <li><a href="${pageContext.request.contextPath}/adminReadServlet">
                    <i class="uil uil-users-alt"></i>
                    <span class="link-name">Admin Management</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-building"></i>
                    <span class="link-name">Property Management</span>
                </a></li>
                <li><a href="${pageContext.request.contextPath}/contactReadServlet">
                    <i class="uil uil-envelope-alt"></i>
                    <span class="link-name">View Messages/Inquiries</span>
                </a></li>
                <li><a href="#">
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
        <h2>Add New Admin</h2>
	        <form action="${pageContext.request.contextPath}/adminInsertServlet" method="post">
	
			    <!-- Hidden ID field -->
			    <div class="input-group">
			        <input type="hidden" name="adminID">
			    </div>
			
			    <!-- Admin Name -->
			    <div class="input-group">
			        <label><i class="fas fa-user"></i> Name</label>
			        <input type="text" name="adminName" required>
			    </div>
			
			    <!-- Username -->
			    <div class="input-group">
			        <label><i class="fas fa-id-badge"></i> User Name</label>
			        <input type="text" name="adminUserName"  required>
			    </div>
			
			    <!-- Password -->
			    <div class="input-group">
			        <label><i class="fas fa-lock"></i> Password</label>
			        <input type="password" name="adminPassword" required
			            minlength="8"
			            pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
			            title="Password must be at least 8 characters long and include an uppercase letter, a lowercase letter, a number, and a special character.">
			    </div>
			
			    <!-- Email -->
			    <div class="input-group">
			        <label><i class="fas fa-envelope"></i> Email</label>
			        <input type="email" name="adminEmail"  required>
			    </div>
			
			    <!-- Phone -->
			    <div class="input-group">
			        <label><i class="fas fa-phone"></i> Phone</label>
			        <input type="tel" name="adminPhone" required
			            pattern="^\d{10}$"
			            title="Phone number must be exactly 10 digits.">
			    </div>
			
			    <!-- Submit Button -->
			    <button type="submit">Add Details</button>
			</form>


    </div>
    
    <script>
document.getElementById("adminForm").addEventListener("submit", function(event) {
    const password = document.getElementById("adminPassword").value;
    const phone = document.getElementById("adminPhone").value;

    // Password pattern: 8+ characters, uppercase, lowercase, digit, special character
    const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

    // Phone pattern: exactly 10 digits
    const phonePattern = /^\d{10}$/;

    if (!passwordPattern.test(password)) {
        alert("Password must be at least 8 characters long and include an uppercase letter, a lowercase letter, a number, and a special character.");
        event.preventDefault();
        return;
    }

    if (!phonePattern.test(phone)) {
        alert("Phone number must be exactly 10 digits.");
        event.preventDefault();
        return;
    }
});
</script>

</section>

<script src="${pageContext.request.contextPath}/js/adminDashboard.js"></script>

 <!-- Added Footer -->
     <footer class="footer">
         <div class="footer-content">
             <p>&copy; 2025 Sky Mountain Properties. All rights reserved.</p>
             <p class="footer-links">
                 <a href="#" class="text">Terms of Service</a>
                 <a href="#" class="text">Privacy Policy</a>
             </p>
         </div>
     </footer>
</body>
</html>
