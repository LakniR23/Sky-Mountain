<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        
        body {
            background-image: url('../images/forget.jpg');
            background-size: cover;
		    background-position: center;
		    background-repeat: no-repeat;
		    height: 100vh;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    position: relative;
        }
        
        body::before {
		   	content: "";
		    position: fixed;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    background-color: rgba(255, 255, 255, 0.5); /* 0.5 is opacity */
		    z-index: 0;
		}
		        
        .container {
            width: 100%;
            max-width: 500px;
            margin: 60px auto;
        }
        
        .card {
            background-color: white;
            border-radius: 8px;
            padding: 40px;
            width: 100%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin: 60px auto;
            position: relative; /* To appear above the overlay */
        }
        
        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 28px;
        }
        
        p {
            color: #666;
            margin-bottom: 30px;
            font-size: 14px;
        }
        
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
        }
        
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        
        button {
            background-color: #3f51b5;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 14px;
            width: 100%;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s;
        }
        
        button:hover {
            background-color: #303f9f;
        }
        
        .back-link {
            display: block;
            margin-top: 20px;
            color: #3f51b5;
            text-decoration: none;
            font-size: 14px;
        }
        
        .back-link:hover {
            text-decoration: underline;
        }
        
        .password-requirements {
            background-color: #f8f9fa;
            border-left: 4px solid #3f51b5;
            padding: 12px;
            border-radius: 2px;
            margin: 10px 0 20px;
            text-align: left;
            font-size: 13px;
            color: #666;
        }
        
        /* Password fields in one row */
        .password-row {
            display: flex;
            gap: 15px;
        }
        
        .password-row .form-group {
            flex: 1;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <h1>Reset Password</h1>
            <p>Please enter your email and new password</p>
            
            <form action="${pageContext.request.contextPath}/adminResetPasswordServlet" method="post">
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
            
            <a href="${pageContext.request.contextPath}/views/adminLogin.jsp" class="back-link">Back to Login</a>
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
</body>
</html>