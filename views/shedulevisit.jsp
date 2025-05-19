<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     <title>Schedule a Viewing</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_footer.css">
     <link rel="preconnect" href="https://fonts.googleapis.com">
     <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
     <link href="https://fonts.googleapis.com/css2?family=Merriweather&family=Nanum+Myeongjo&family=Roboto+Mono&family=Rouge+Script&display=swap" rel="stylesheet">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shedule.css">
</head>
<body>
    <div class="header">
        <div class="logo">
            <a href="index.html"><img src="${pageContext.request.contextPath}/images/sky-mountain-high-resolution-logo-transparent (1).png" alt="SkyMountain logo" height="40px"></a>
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
    
    <!-- Content wrapper -->
    <div class="content-wrapper">
        <!-- Modal always visible on this page -->
        <div class="modal" id="formModal" style="display: block;">
            <div class="modal-content">
                <button class="close-btn" onclick="closeModal()"><i class="fas fa-times"></i></button>
                <h2>Schedule a Viewing</h2>
                <p>Please fill out the form and our team will contact you.</p>

                <form id="viewingForm" action="${pageContext.request.contextPath}/AppointmentInsertServlet" method="post">
                    <div class="form-row">
                        <div class="form-group">
                            <i class="fas fa-calendar-alt"></i>
                            <input type="date" name="aDate" required />
                        </div>
                        <div class="form-group">
                            <i class="fas fa-clock"></i>
                            <select name="aTime" required>
                                <option value="">Select Time</option>
                                <option value="09:00 AM">09:00 AM</option>
                                <option value="10:00 AM">10:00 AM</option>
                                <option value="11:00 AM">11:00 AM</option>
                                <option value="12:00 PM">12:00 PM</option>
                                <option value="01:00 PM">01:00 PM</option>
                                <option value="02:00 PM">02:00 PM</option>
                                <option value="03:00 PM">03:00 PM</option>
                                <option value="04:00 PM">04:00 PM</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <i class="fas fa-user"></i>
                            <input type="text" name="aName" placeholder="Your Name *" required />
                        </div>
                        <div class="form-group">
                            <i class="fas fa-phone"></i>
                            <input type="tel" name="aPhone" placeholder="Contact Number *" required pattern="[0-9]{10}" />
                        </div>
                    </div>
                    <div class="form-row">
                        <textarea name="aMessage" placeholder="Message (optional)"></textarea>
                    </div>
                    <input type="hidden" name="aStatus" value="Pending">
                    <button type="submit" class="submit-btn">Submit</button>
                </form>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/shedule.js"></script>

    <script>
        // If your modal hides via JS, keep it visible on page load
        window.onload = function() {
            document.getElementById('formModal').style.display = 'block';
        }

        function closeModal() {
            document.getElementById('formModal').style.display = 'none';
        }
    </script>

    <!-- Footer -->
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
