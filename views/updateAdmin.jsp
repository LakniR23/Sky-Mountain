<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Profile</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminDashboard.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateContact.css">
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
        <!-- <i class="uil uil-bars sidebar-toggle"></i> -->
        <img src="${pageContext.request.contextPath}/images/sky-mountain-high-resolution-logo-transparent (1).png" alt="">
        
        <div class="welcome-message">
                Hi <span class="font-bold">${admin.adminName}</span>! Welcome back!
            </div>
    </div>

    <%
        String adminID = request.getParameter("adminID");
        String adminName = request.getParameter("adminName");
        String adminUserName = request.getParameter("adminUserName");
        String adminPassword = request.getParameter("adminPassword");
        String adminEmail = request.getParameter("adminEmail");
        String adminPhone = request.getParameter("adminPhone");
    %>

   <div class="container">
        <h2><i class="fas fa-pen"></i> Update Admin Details</h2>
        <form action="${pageContext.request.contextPath}/adminUpdateServlet" method="post">
            
            <div class="input-group">
                <input type="hidden" name="adminID" value='<%=adminID%>' readonly>
            </div>

            <div class="input-group">
                <label><i class="fas fa-user"></i> Name</label>
                <input type="text" name="adminName" value='<%=adminName%>' readonly>
            </div>

            <div class="input-group">
                <label><i class="fas fa-id-badge"></i> User Name</label>
                <input type="text" name="adminUserName" value='<%=adminUserName%>' readonly>
            </div>

            <div class="input-group">
                <label><i class="fas fa-lock"></i> Password</label>
                <input type="text" name="adminPassword" value='<%=adminPassword%>' required>
            </div>

            <div class="input-group">
                <label><i class="fas fa-envelope"></i> Email</label>
                <input type="email" name="adminEmail" value='<%=adminEmail%>' required>
            </div>

            <div class="input-group">
                <label><i class="fas fa-phone"></i> Phone</label>
                <input type="tel" name="adminPhone" value='<%=adminPhone%>' required>
            </div>

            <div class="button-group">
                <a href="${pageContext.request.contextPath}/adminReadServlet"><button type="button" class="cancel-btn"><i class="fas fa-times"></i> Cancel</button></a>
                <button type="submit"><i class="fas fa-save"></i> Save Changes</button>
            </div>
        </form>
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
