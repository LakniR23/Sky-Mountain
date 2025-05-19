<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>SkyMountain</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,opsz,wght@0,18..144,300..900;1,18..144,300..900&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&family=Rouge+Script&display=swap" rel="stylesheet">
</head>
<body>
    <div class="header">
        <div class="logo">
            <a href="index.html"><img src="${pageContext.request.contextPath}/images/sky-mountain-high-resolution-logo-transparent (1).png" alt="SkyMountain logo" width="auto" height="40px"></a>
        </div>

        <div class="navigation">
            <ul type="none">
                <a href="../index.html"><li>Home</li></a>
	            <a href="../about2.html"><li>Why Sky Mountain?</li></a>
	            <a href="../commonProperties.html"><li>Listed Properties</li></a>
	            <a href="../propertyCard.jsp"><li>New Listings</li></a>
	            <a href="${pageContext.request.contextPath}/contactInsertServlet"><li>Contact us</li></a>
            </ul>
        </div>

        <div class="profile">
            <a href="${pageContext.request.contextPath}/userProfileServlet"><i class="fa-solid fa-user fa-2x"></i></a>
        </div>
    </div>

    <div class="container">
        <h2>Contact Us</h2>
        <form id="contactForm" action="${pageContext.request.contextPath}/contactInsertServlet" method="post">
           <div class="input-group">
		        <label for="name">Name</label>
		        <input type="text" id="name" name="cName" placeholder="Enter your name" required >
		        <span class="error" id="nameError"></span>
		    </div>
		
		    <div class="input-group">
		        <label for="email">Email</label>
		        <input type="email" id="email" name="cEmail" placeholder="Enter your email" required>
		        <span class="error" id="emailError"></span>
		    </div>
		
		    <div class="input-group">
			    <label for="phone">Phone Number</label>
			    <input type="tel" id="phone" name="cPhone" placeholder="Enter your 10-digit phone number" required pattern="^\d{10}$" title="Please enter a valid 10-digit phone number (e.g., 0712345678)">
			    <span class="error" id="phoneError"></span>
			</div>
		
		    <div class="input-group">
		        <label for="message">Message</label>
		        <textarea id="message" name="cMessage" placeholder="Enter your message" required></textarea>
		        <span class="error" id="messageError"></span>
		    </div>
		
		    <div class="input-group">
		        <input type="hidden" name="cStatus" id="cStatus" value="Pending">
		    </div>
		
		    <button type="submit">Submit</button>
        </form>	        
    </div>

    <script src="js/contact.js"></script>

    <!-- JSP Alert Message Handler -->
    <%
	    String message = (String) session.getAttribute("message");
	    if (message != null) {
	%>
	    <script>
	        alert("<%= message %>");
	    </script>
	<%
	        session.removeAttribute("message");  // remove after displaying
	    }
	%>


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
