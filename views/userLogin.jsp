<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Login Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userLogin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_footer.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,opsz,wght@0,18..144,300..900;1,18..144,300..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&family=Rouge+Script&display=swap" rel="stylesheet">
    
</head>
<body>
	<div class="header">
	    <div class="logo">
	        <img src="${pageContext.request.contextPath}/images/sky-mountain-high-resolution-logo-transparent (1).png" alt="SkyMountain logo" height="40px">
	    </div>
	
	    <div class="navigation">
	        <ul type="none">
	            <li>Home</li>
	            <li>Why Sky Mountain?</li>
	            <li>Listed Properties</li>
	            <li>New Listings</li>
	            <li>Contact us</li>
	        </ul>
	    </div>
	     
	    <div class="profile">
	        <i class="fa-solid fa-user fa-2x"></i>
	    </div>
	    
	    
	</div>
    <div class="login-container">
        <div class="login-header">
            <h1>Welcome Back</h1>
            <p>Please enter your credentials to log in</p>
        </div>
        
        <form action="${pageContext.request.contextPath}/userLoginServlet" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="uEmail" placeholder="Enter your email" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="uPassword" placeholder="Enter your password" required>
            </div>
            
            <button type="submit" class="login-button">Log In</button>
            
            <div class="forgot-password">
                <a href="${pageContext.request.contextPath}/views/userForgetPassword.jsp">Forgot your password?</a><br>
                <a href="${pageContext.request.contextPath}/views/userRegistration.jsp">New user? Register</a>
            </div>
        </form>
    </div>
    
    <!--Footer-->

  <br><br>

   <footer class="footer">
    <div class="footer-container">
        <!-- Column 1: Company -->
        <div class="footer-column">
            <h3>Company</h3>
            <ul>
                <li><a href="../about2.html">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/contactInsertServlet">Contact Us</a></li>
                <li><a href="${pageContext.request.contextPath}/PropertyAdddServlet">List your property</a></li>
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
            <div class="footer-logo"><img src="${pageContext.request.contextPath}/images/sky-mountain-high-resolution-logo-transparent (1).png" alt="SkyMountain logo" width="auto" height="40px"></div>
            <div class="social-icons">
                <a href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram"></i></a>
                <a href="https://www.youtube.com/" target="_blank"><i class="fab fa-youtube"></i></a>
                <a href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-f"></i></a>
                <a href="https://www.linkedin.com/feed/" target="_blank"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
    </div>
    
    <div class="footer-divider"></div>
    
    <div class="footer-bottom">
        <div class="copyright">
            &copy; Sky Mountain Private Limited. All Rights Reserved.
        </div>
        <div class="footer-links">
            <a href="../privacy2.html">Privacy & Cookies</a>
            <a href="../terms.html">Terms & Conditions</a>
        </div>
    </div>
  </footer>
</body>
</html>