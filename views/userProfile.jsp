<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateAdminProfile.css">
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>

	<div class="header">
        <div class="logo">
                <a href="index.html"><img src="${pageContext.request.contextPath}/images/sky-mountain-high-resolution-logo-transparent (1).png" alt="SkyMountain logo" width="auto" height="40px"></a>
        </div>

        <div class="navigation">
            <ul type="none">
              	<li><a href="index.html">Home</a></li>
			    <li><a href="about2.html">Why Sky Mountain?</a></li>
			    <li><a href="commonProperties.html">Listed Properties</a></li>
			    <li><a href="">New Listings</a></li>
			    <li><a href="contactInsertServlet">Contact us</a></li>
            </ul>
        </div>

        <div class="profile">
            <i class="fa-solid fa-user fa-2x"></i>
        </div>
    </div>
    
    <div class="button-group" style="margin-top: 20px; display: flex; justify-content: space-between;">

   <div style="width: 100%; display: flex; justify-content: space-between; padding: 0 20px;">
   

    <a href="${pageContext.request.contextPath}/propertyDisplay.jsp" 
       style="padding: 10px 20px; background-color: #007bff; color: white; text-decoration: none; border-radius: 5px; font-weight: bold; transition: background-color 0.3s ease;"
       onmouseover="this.style.backgroundColor='#0056b3'"
       onmouseout="this.style.backgroundColor='#007bff'">
       View Properties
    </a>

    <a href="${pageContext.request.contextPath}/LogoutServlet" 
   style="padding: 10px 20px; background-color: #dc3545; color: white; text-decoration: none; border-radius: 5px; font-weight: bold; transition: background-color 0.3s ease;"
   onmouseover="this.style.backgroundColor='#a71d2a'"
   onmouseout="this.style.backgroundColor='#dc3545'">
   Logout
</a>

</div>

</div>

    <div class="container">
        <h2>My Profile</h2>
	        <form action="${pageContext.request.contextPath}/userProfileUpdateServlet" method="post">
	
	    <!-- Hidden ID field -->
	    <div class="input-group">
	        <input type="hidden" name="uID" value="${user.uID}" readonly>
	    </div>
	
	    <!--User Name -->
	    <div class="input-group">
	        <label><i class="fas fa-user"></i> Name</label>
	        <input type="text" name="uName" value="${user.uName}" readonly>
	    </div>
	
		<!-- Email -->
	    <div class="input-group">
	        <label><i class="fas fa-envelope"></i> Email</label>
	        <input type="email" name="uEmail" value="${user.uEmail}" required>
	    </div>
	
	    <!-- Phone -->
	    <div class="input-group">
	        <label><i class="fas fa-phone"></i> Phone</label>
	        <input type="tel" name="uPhone" value="${user.uPhone}" required>
	    </div>
	    
	    <!-- Gender -->
	    <div class="input-group">
	        <label><i class="fas fa-user"></i> Gender</label>
	        <input type="text" name="uGender" value="${user.uGender}" readonly>
	    </div>
	    
	    <!-- NIC -->
	    <div class="input-group">
	        <label><i class="fas fa-user"></i> NIC</label>
	        <input type="text" name="uNIC" value="${user.uNIC}" readonly>
	    </div>
	    
	    <!-- Password -->
	    <div class="input-group">
	        <label><i class="fas fa-lock"></i> Password</label>
	        <input type="text" name="uPassword" value="${user.uPassword}" required>
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

	
  <footer class="footer">
    <div class="footer-container">
        <!-- Column 1: Company -->
        <div class="footer-column">
            <h3>Company</h3>
            <ul>
                <li><a href="about2.html">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/contactInsertServlet">Contact Us</a></li>
                <li><a href="#">List your property</a></li>
            </ul>
        </div>
        
        <!-- Column 2: Contact us -->
        <div class="footer-column">
          <h3>Contact Us</h3>
          <ul>
            <li><i class="fas fa-phone"></i> <a href="tel:+941123892830">011 238 9283</a></li>
            <li><i class="fas fa-envelope"></i> <a href="mailto:info@skymountain.com">info@skymountain.com</a></li>
            <li><i class="fas fa-map-marker-alt"></i> 23, De Mel Road, Colombo, Sri Lanka</li>
            <li><i class="fas fa-clock"></i> Mon-Fri: 9AM-5PM, Sat: 10AM-4PM</li>
          </ul>
        </div>

        <!-- Column 4: Logo -->
        <div class="footer-column">
            <div class="footer-logo"><img src="images/sky-mountain-high-resolution-logo-transparent (1).png" alt="SkyMountain logo" width="auto" height="40px"></div>
            <div class="social-icons">
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
    </div>
    
    <div class="footer-divider"></div>
    
    <div class="footer-bottom">
        <div class="copyright">
            &copy; Sky Mountain Private Limited. All Rights Reserved.
        </div>
        <div class="footer-links">
            <a href="privacy2.html">Privacy & Cookies</a>
            <a href="#">Terms & Conditions</a>
        </div>
    </div>
  </footer>
</body>
</html>
