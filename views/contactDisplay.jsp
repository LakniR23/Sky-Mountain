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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/contactDisplay.css">
	
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
            <!--<i class="uil uil-bars sidebar-toggle"></i>  -->

            <img src="${pageContext.request.contextPath}/images/sky-mountain-high-resolution-logo-transparent (1).png" alt="">
            
            <div class="welcome-message">
                Hi <span class="font-bold">${admin.adminName}</span>! Welcome back!
            </div>
        </div>
    
    <div class="container">
    	<h2>Messages & Inquiries</h2>
	
		<table>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Message</th>
				<th>Status</th>
				<th>Update Action</th>
				<th>Delete Action</th>
			</tr>
		
			<c:forEach var="cModel" items="${allContacts}">
				<tr>
					<td>${cModel.cID}</td>
					<td>${cModel.cName}</td>
					<td>${cModel.cEmail}</td>
					<td>${cModel.cPhone}</td>
					<td>${cModel.cMessage}</td>
					<td>${cModel.cStatus}</td>
					<td>
						<a href="${pageContext.request.contextPath}/views/updateContact.jsp?cID=${cModel.cID}&cName=${cModel.cName}&cEmail=${cModel.cEmail}&cPhone=${cModel.cPhone}&cMessage=${cModel.cMessage}">
							<button>Update</button>
						</a>	
					</td>
					<td>
						<form action="${pageContext.request.contextPath}/contactDeleteServlet" method="post">
						<input type="hidden" name="cId" value="${cModel.cID}"/>
							<button>Delete</button>
						</form>
					</td>
				</tr>
			</c:forEach>	
		</table>
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