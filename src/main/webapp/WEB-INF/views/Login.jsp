<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f8;
            font-family: 'Arial', sans-serif;
            padding-top: 56px;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .navbar {
            background-color: #343a40;
        }

        .navbar-brand, .navbar-nav .nav-link {
            color: #f8f9fa !important;
        }

        .container {
            flex: 1;
            max-width: 100%;
            margin-top: 30px;
            padding: 0 15px;
        }

        .form-container {
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 0 auto;
        }

        h2 {
            color: #343a40;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
            position: relative;
        }

        .form-group i {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
        }

        .footer {
            background-color: #343a40;
            color: #f8f9fa;
            text-align: center;
            padding: 15px;
            margin-top: auto;
        }

        .btn-primary {
            width: 100%;
            padding: 12px;
        }

        .extra-links {
            text-align: center;
            margin-top: 15px;
        }

        .extra-links a {
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
        }

        .extra-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <a class="navbar-brand" href="#">Login Page</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <span class="navbar-text" id="currentDate"></span>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="form-container">
            <h2>Login</h2>
            <form id="loginForm" action="loginUser" method="POST" novalidate>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                    <div class="invalid-feedback">Please provide a valid email address.</div>
                </div>
                <div class="form-group" style="position: relative;">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                    <div class="invalid-feedback">Please provide your password.</div>
                    <i class="fas fa-eye" id="togglePassword" style="cursor: pointer; position: absolute; right: 10px; top: 45px;"></i>
                </div>
                <button type="submit" class="btn btn-primary mt-3">Login</button>
            </form>

            <!-- Extra links for forgot password and new user -->
            <div class="extra-links">
                <a href="forgotPassword">Forgot Password?</a> | 
                <a href="Signup">New user? Sign up here</a>
            </div>
        </div>
    </div>

    <footer class="footer">
        <p>&copy; 2024 Evaluation Portal. All rights reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Set current date in the navbar
        document.addEventListener('DOMContentLoaded', () => {
            const currentDate = new Date();
            document.getElementById('currentDate').textContent = currentDate.toLocaleDateString('en-US', {
                weekday: 'long',
                year: 'numeric',
                month: 'long',
                day: 'numeric'
            });

            // Password visibility toggle for Login
            document.getElementById('togglePassword').addEventListener('click', function() {
                const passwordField = document.getElementById('password');
                const type = passwordField.type === 'password' ? 'text' : 'password';
                passwordField.type = type;

                // Toggle eye icon
                this.classList.toggle('fa-eye-slash');
            });
        });
    </script>
</body>
</html>
