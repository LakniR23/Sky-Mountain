<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Registration</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_footer.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/registration.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Merriweather:ital,opsz,wght@0,18..144,300..900;1,18..144,300..900&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&family=Rouge+Script&display=swap"
        rel="stylesheet">
</head>
<body>

    <div class="header">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/images/sky-mountain-high-resolution-logo-transparent (1).png"
                    alt="SkyMountain logo" width="auto" height="40px">
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

    <div class="container">
        <h2>Registration</h2>
        <form action="${pageContext.request.contextPath}/userInsertServlet" method="post" id="registerForm" onsubmit="return validateForm()">

            <div class="input-field">
                <i class="fas fa-user"></i>
                <input type="text" name="uName" placeholder="Full Name" required />
            </div>

            <div class="input-field">
                <i class="fas fa-envelope"></i>
                <input type="email" name="uEmail" placeholder="Email" required />
            </div>

            <div class="input-field">
                <i class="fas fa-phone"></i>
                <input type="tel" name="uPhone" placeholder="Phone Number" pattern="[0-9]{10}" required />
            </div>

            <label style="color: rgb(67, 171, 85);">Gender</label>
            <div class="gender">
                <label><input type="radio" name="uGender" value="Male" required /> Male</label>
                <label><input type="radio" name="uGender" value="Female" required /> Female</label>
            </div>

            <div class="input-field">
                <i class="fas fa-id-card"></i>
                <input type="text" id="nic" name="uNIC" placeholder="National Identity Card Number" required maxlength="13" minlength="13" pattern="\d{13}"/>
            </div>

            <div class="input-field">
                <i class="fas fa-lock"></i>
                <input type="password" id="password" name="uPassword" placeholder="Password" required />
            </div>

            <div class="input-field">
                <i class="fas fa-lock"></i>
                <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm Password" required />
            </div>

            <div class="checkbox">
                <label>
                    <input type="checkbox" id="terms" onchange="toggleButton()" />
                    I agree to the Terms & Conditions
                </label>
            </div>

            <button type="submit" id="registerBtn" disabled>Register</button>
            <p class="error" id="errorMsg"></p>

        </form>
        
       
    </div>



    <script src="${pageContext.request.contextPath}/js/registration.js"></script>

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
