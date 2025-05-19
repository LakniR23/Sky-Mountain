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
    <title>Reset Password</title>
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_footer.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,opsz,wght@0,18..144,300..900;1,18..144,300..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&family=Rouge+Script&display=swap" rel="stylesheet">
	<style>
/* Reset page basics */
body {
    margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
    background-color: #f0f2f5;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

/* Center main container */
.container {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px 20px;
}

/* Card styling */
.card {
    background-color: #ffffff;
    padding: 35px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    max-width: 500px;
    width: 100%;
    text-align: center;
}

/* Heading and description */
.card h1 {
    margin-bottom: 10px;
    font-size: 28px;
    color: #333;
}

.card p {
    font-size: 14px;
    color: #666;
    margin-bottom: 20px;
}

/* Form group styling */
.form-group {
    margin-bottom: 20px;
    text-align: left;
}

.form-group label {
    display: block;
    margin-bottom: 6px;
    font-size: 14px;
    color: #444;
}

.form-group input {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 8px;
    font-size: 14px;
    outline: none;
}

.form-group input:focus {
    border-color: #007bff;
    box-shadow: 0 0 3px #007bff33;
}

/* Password row styling */
.password-row {
    display: flex;
    gap: 15px;
    flex-wrap: wrap;
}

.password-row .form-group {
    flex: 1;
}

/* Password requirements note */
.password-requirements {
    font-size: 13px;
    color: #888;
    text-align: left;
    margin-bottom: 20px;
}

/* Submit button */
button[type="submit"] {
    background-color: #007bff;
    color: #fff;
    padding: 14px;
    border: none;
    border-radius: 8px;
    width: 100%;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
    background-color: #0056b3;
}

/* Back link */
.back-link {
    display: block;
    margin-top: 18px;
    font-size: 14px;
    color: #007bff;
    text-decoration: none;
}

.back-link:hover {
    text-decoration: underline;
}


/* Responsive tweaks */
@media (max-width: 500px) {
    .password-row {
        flex-direction: column;
    }
}

	</style>
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
	            <li>New Listings</li></a>
	            <li>Contact us</li>
            </ul>
        </div>

        <div class="profile">
            <a href="userProfileServlet"><i class="fa-solid fa-user fa-2x"></i></a>
        </div>
    </div>
	
    <div class="container">
        <div class="card">
            <h1>Reset Password</h1>
            <p>Please enter your email and new password</p>
            
            <form action="${pageContext.request.contextPath}/userResetPasswordServlet" method="post">
                <input type="hidden" name="action" value="resetPassword">
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                </div>
                
                <div class="password-row">
                    <div class="form-group">
                        <label for="newPassword">New Password</label>
                        <input type="password" id="newPassword" name="newPassword" placeholder="Enter new password" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm new password" required>
                    </div>
                </div>
                
                <div class="password-requirements">
                    Password must be at least 8 characters long and include uppercase, lowercase, number, and special character.
                </div>
                
                <button type="submit">Update Password</button>
            </form>
            
            <a href="${pageContext.request.contextPath}/views/userLogin.jsp" class="back-link">Back to Login</a>
        </div>
    </div>

    <script>
        // Form validation
        document.querySelector('form').addEventListener('submit', function(event) {
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (newPassword !== confirmPassword) {
                event.preventDefault();
                alert('Passwords do not match!');
                return false;
            }
            
            // Basic password strength validation
            const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            if (!passwordRegex.test(newPassword)) {
                event.preventDefault();
                alert('Password must be at least 8 characters long and include uppercase, lowercase, number, and special character.');
                return false;
            }
            
            return true;
        });
    </script>
    
    
 <!--Footer-->

  <br><br>

  <footer class="footer">
    <div class="footer-container">
        <!-- Column 1: Company -->
        <div class="footer-column">
            <h3>Company</h3>
            <ul>
                <li><a href="about2.html">About Us</a></li>
                <li><a href="contactInsertServlet">Contact Us</a></li>
                <li><a href="PropertyAdddServlet">List your property</a></li>
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
            <a href="privacy2.html">Privacy & Cookies</a>
            <a href="terms.html">Terms & Conditions</a>
        </div>
    </div>
  </footer>
</html>