<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
    
<!DOCTYPE html>
<!--=== Coding by CodingLab | www.codinglabweb.com === -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminDashboard.css">
     
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Admin Dashboard Panel</title> 
    
    <style>
        /* You can add any additional custom styles here */
        .data-boxes {
            display: grid;
            /* grid-template-columns: repeat(2, 1fr); */
            grid-gap: 40px;
            margin-top: 100px;
            width: 600px;
            margin: auto;
            margin-top: 100px;
        }
        
        /* Main dashboard boxes styling */
        .boxes {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 20px;
            margin-top: 20px;
        }
        
        .data-box {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            height:200px;
        }
        
        .data-box:hover {
            transform: translateY(-5px);
        }
        
        .data-box.users { background-color: #cfe8ff; }
        .data-box.admin { background-color: #ffd6a5; }
        .data-box.properties { background-color: #fff2c6; }
        .data-box.contacts { background-color: #d4f8d4; }
        .data-box.appointments { background-color: #f2d4f8; margin-bottom: 100px;}
        
        .data-box i {
            font-size: 35px;
            color: #333;
        }
        
        .data-box .text {
            font-size: 18px;
            font-weight: 500;
            color: #333;
            margin: 10px 0 5px 0;
        }
        
        .data-box .number {
            font-size: 30px;
            font-weight: 600;
            color: #000;
        }
        
     
    </style>
    
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
	        <!-- <i class="uil uil-bars sidebar-toggle"></i> -->

	        <img src="${pageContext.request.contextPath}/images/sky-mountain-high-resolution-logo-transparent (1).png" alt="Logo">
	        
	        <div class="welcome-message">
                Hi <span class="font-bold">${admin.adminName}</span>! Welcome back!
            </div>
	    </div>
	
	    <div class="dash-content">
	        
	
	        <!-- System data section with counts from servlets -->
	        <div class="system-data">
	
	            <div class="data-boxes">
	                <div class="data-box users">
	                    <i class="uil uil-users-alt"></i>
	                    <span class="text">User Management</span>
	                    <span class="number">${userCount}</span>
	                </div>
	                <div class="data-box admin">
	                    <i class="uil uil-users-alt"></i>
	                    <span class="text">Admin Management</span>
	                    <span class="number">${adminCount}</span>
	                </div>
	                 <div class="data-box properties">
	                    <i class="uil uil-estate"></i>
	                    <span class="text">Property Management</span>
	                    <span class="number">${propertyCount}</span>
	                </div>
	                <div class="data-box contacts">
	                    <i class="uil uil-envelope-alt"></i>
	                    <span class="text">Contact Messages</span>
	                    <span class="number">${contactCount}</span>
	                </div>
	                <div class="data-box appointments">
	                    <i class="uil uil-calendar-alt"></i>
	                    <span class="text">Appointments</span>
	                    <span class="number">${appointmentCount}</span>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>

    
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