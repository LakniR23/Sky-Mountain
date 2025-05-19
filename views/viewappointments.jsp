<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Appointment Management</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminDashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/viewappointment.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/viewappointment.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <!-- Navigation Menu -->
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

    <!-- Dashboard Content -->
    <section class="dashboard">
        <div class="top">
            <img src="${pageContext.request.contextPath}/images/sky-mountain-high-resolution-logo-transparent (1).png" alt="">
            <div class="welcome-message">
                Hi <span class="font-bold">${admin.adminName}</span>! Welcome back!
            </div>
        </div>

       <div class="container">
        <!-- Display messages from session if present -->
        <c:if test="${not empty sessionScope.message}">
            <div class="message success">
                ${sessionScope.message}
                <c:remove var="message" scope="session" />
            </div>
        </c:if>
        
        <c:if test="${not empty requestScope.errorMessage}">
            <div class="message error">
                ${requestScope.errorMessage}
            </div>
        </c:if>
        
        <div class="dashboard-header">
            <h2 class="dashboard-title">All Appointments</h2>
            <div class="dashboard-actions">
                <a href="${pageContext.request.contextPath}/views/shedulevisit.jsp" class="btn btn-add">
                    <i class="fas fa-plus"></i> Add New Appointment
                </a>
            </div>
        </div>
        
        <!-- Appointments Table -->
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Message</th>
                    <th>Status</th>
                    <th>Update Action</th>
                    <th>Delete Action</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${empty appointmentList}">
                        <tr>
                            <td colspan="9" style="text-align: center;">No appointments found</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${appointmentList}" var="appointment">
                            <tr>
                                <td>${appointment.aId}</td>
                                <td>${appointment.aDate}</td>
                                <td>${appointment.aTime}</td>
                                <td>${appointment.aName}</td>
                                <td>${appointment.aPhone}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${empty appointment.aMessage}">
                                            <em>No message</em>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="${appointment.aMessage}" />
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <span class="status-badge status-${appointment.aStatus.toLowerCase()}">
                                        ${appointment.aStatus}
                                    </span>
                                </td>
                                <td class="action-cell">
                                    <a href="${pageContext.request.contextPath}/AppointmentUpdateServlet?id=${appointment.aId}" class="btn btn-edit">
                                        <i class="fas fa-edit"></i> Update
                                    </a>
                                </td>
                                <td class="action-cell">
                                    <a href="${pageContext.request.contextPath}/AppointmentDeleteServlet?id=${appointment.aId}" 
                                       class="btn btn-delete"
                                       onclick="return confirm('Are you sure you want to delete this appointment?');">
                                        <i class="fas fa-trash"></i> Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
    </section>

    <script src="${pageContext.request.contextPath}/js/adminDashboard.js"></script>

    <!-- Footer -->
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
