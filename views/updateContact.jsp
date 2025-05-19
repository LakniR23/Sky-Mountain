<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
	<title>View Messages/Inquiries</title>
	
	<!----======== CSS ======== -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminDashboard.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateContact.css">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    
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
            <!-- <i class="uil uil-bars sidebar-toggle"></i> -->

            
            
            <img src="${pageContext.request.contextPath}/images/sky-mountain-high-resolution-logo-transparent (1).png" alt="Logo">
            
            <div class="welcome-message">
                Hi <span class="font-bold">${admin.adminName}</span>! Welcome back!
            </div>
        </div>
        
    	<%
			String cID = request.getParameter("cID");
			String cName = request.getParameter("cName");
			String cEmail = request.getParameter("cEmail");
			String cPhone = request.getParameter("cPhone");
			String cMessage = request.getParameter("cMessage");
			String cStatus = request.getParameter("cStatus");
		%>
		
		<div class="container">
	    	 <h2><i class="fas fa-address-book"></i> Update Message/Inquiry</h2>
				<form id="contactForm" action="${pageContext.request.contextPath}/contactUpdateServlet" method="post" onsubmit="return validateStatus()">
					<div class="input-group">
		                <input type="hidden" id="id" name="cID" placeholder="Enter your name" value='<%=cID%>' readonly>
		                <span class="error" id="nameError"></span>
		            </div>
					
					<div class="input-group">
		                <label for="name"><i class="fas fa-user"></i> Name</label>
		                <input type="text" id="name" name="cName" placeholder="Enter your name" value='<%=cName%>' readonly>
		                <span class="error" id="nameError"></span>
		            </div>
		
		            <div class="input-group">
		                <label for="email"><i class="fas fa-envelope"></i> Email</label>
		                <input type="email" id="email" name="cEmail" placeholder="Enter your email" value='<%=cEmail%>' readonly>
		                <span class="error" id="emailError"></span>
		            </div>
		
		            <div class="input-group">
		                <label for="phone"><i class="fas fa-phone"></i> Phone Number</label>
		                <input type="tel" id="phone" name="cPhone" placeholder="Enter your phone number" value='<%=cPhone%>' readonly>
		                <span class="error" id="phoneError"></span>
		            </div>    
		            
			 		<div class="input-group">
					    <label for="status"><i class="fas fa-tasks"></i> Update Message/Inquiry Status</label>
					    <select id="status" name="cStatus">
					        <option value="Pending">Pending</option>
					        <option value="Processing">Processing</option>
					        <option value="Done">Done</option>
					    </select>
					    <span class="error" id="statusError"></span>
					</div>

		            <div class="button-group">
                <a href="${pageContext.request.contextPath}/contactReadServlet"><button type="button" class="cancel-btn"><i class="fas fa-times"></i> Cancel</button></a>
                <button type="submit"><i class="fas fa-save"></i> Save Changes</button>
            </div>
		        </form>
        </div>
        
        <script>
	        function validateStatus() {
	            var statusValue = document.getElementById("status").value;
	
	            if (statusValue === "") {
	                alert("Please select a status.");
	                return false;
	            }
	            return true;
	        }
		</script>
    </section>
    
    <script src="js/adminDashboard.js"></script>
    
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