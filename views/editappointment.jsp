<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Appointment</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminDashboard.css">
     
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    
    
    <style>
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        
        .container {
            max-width: 800px;
            margin:30px auto;
            padding: 20px;
            margin-top:100px;
        }
        
        .edit-form {
            background-color: #fff;
            border-radius: 6px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        
        h1 {
            color: #2c3e50;
            margin-top: 0;
            margin-bottom: 20px;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #2c3e50;
        }
        
        input[type="text"],
        input[type="tel"],
        input[type="date"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }
        
        textarea {
            height: 100px;
            resize: vertical;
        }
        
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        
        .btn:hover {
            background-color: #2980b9;
        }
        
        .btn-save {
            background-color: #2ecc71;
        }
        
        .btn-save:hover {
            background-color: #27ae60;
        }
        
        .btn-cancel {
            background-color: #95a5a6;
            margin-left: 10px;
        }
        
        .btn-cancel:hover {
            background-color: #7f8c8d;
        }
        
        .form-actions {
            margin-top: 30px;
            text-align: right;
        }
        
        .icon {
            margin-right: 5px;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }
            
            .edit-form {
                padding: 20px;
            }
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
                <li><a href="${pageContext.request.contextPath}/userRead_getAll">
                    <i class="uil uil-users-alt"></i>
                    <span class="link-name">User Management</span>
                </a></li>
                <li><a href="${pageContext.request.contextPath}/adminReadServlet">
                    <i class="uil uil-users-alt"></i>
                    <span class="link-name">Admin Management</span>
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
	    
	     <div class="container">
        <div class="edit-form">
            <h1><i class="fas fa-edit"></i> Edit Appointment</h1>
            
            <form action="${pageContext.request.contextPath}/AppointmentUpdateServlet" method="post">
                <input type="hidden" name="aId" value="${appointment.aId}" />
                
                <div class="form-group">
                    <label for="aDate"><i class="fas fa-calendar-alt icon"></i> Date</label>
                    <input type="date" id="aDate" name="aDate" value="${appointment.aDate}" required />
                </div>
                
                <div class="form-group">
                    <label for="aTime"><i class="fas fa-clock icon"></i> Time</label>
                    <select id="aTime" name="aTime" required>
                        <option value="">Select Time</option>
                        <option value="09:00 AM" ${appointment.aTime == '09:00 AM' ? 'selected' : ''}>09:00 AM</option>
                        <option value="10:00 AM" ${appointment.aTime == '10:00 AM' ? 'selected' : ''}>10:00 AM</option>
                        <option value="11:00 AM" ${appointment.aTime == '11:00 AM' ? 'selected' : ''}>11:00 AM</option>
                        <option value="12:00 PM" ${appointment.aTime == '12:00 PM' ? 'selected' : ''}>12:00 PM</option>
                        <option value="01:00 PM" ${appointment.aTime == '01:00 PM' ? 'selected' : ''}>01:00 PM</option>
                        <option value="02:00 PM" ${appointment.aTime == '02:00 PM' ? 'selected' : ''}>02:00 PM</option>
                        <option value="03:00 PM" ${appointment.aTime == '03:00 PM' ? 'selected' : ''}>03:00 PM</option>
                        <option value="04:00 PM" ${appointment.aTime == '04:00 PM' ? 'selected' : ''}>04:00 PM</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="aName"><i class="fas fa-user icon"></i> Name</label>
                    <input type="text" id="aName" name="aName" value="${appointment.aName}" required />
                </div>
                
                <div class="form-group">
                    <label for="aPhone"><i class="fas fa-phone icon"></i> Phone</label>
                    <input type="tel" id="aPhone" name="aPhone" value="${appointment.aPhone}" required pattern="[0-9]{10}" />
                </div>
                
                <div class="form-group">
                    <label for="aMessage"><i class="fas fa-comment icon"></i> Message</label>
                    <textarea id="aMessage" name="aMessage">${appointment.aMessage}</textarea>
                </div>
                
                <div class="form-group">
                    <label for="aStatus"><i class="fas fa-tag icon"></i> Status</label>
                    <select id="aStatus" name="aStatus" required>
                        <option value="Pending" ${appointment.aStatus == 'Pending' ? 'selected' : ''}>Pending</option>
                        <option value="Confirmed" ${appointment.aStatus == 'Confirmed' ? 'selected' : ''}>Confirmed</option>
                        <option value="Cancelled" ${appointment.aStatus == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                        <option value="Completed" ${appointment.aStatus == 'Completed' ? 'selected' : ''}>Completed</option>
                    </select>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn btn-save"><i class="fas fa-save"></i> Save Changes</button>
                    <a href="${pageContext.request.contextPath}/AppointmentReadServlet" class="btn btn-cancel"><i class="fas fa-times"></i> Cancel</a>
                </div>
            </form>
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

 
