<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Evaluation Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* General body style */
        body {
            background-color: #f4f6f8;
            font-family: 'Arial', sans-serif;
            padding-top: 56px;
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Ensure the body takes up full height */
        }

        /* Navbar style */
        .navbar {
            background-color: #343a40;
        }
        .navbar-brand, .navbar-nav .nav-link {
            color: #f8f9fa !important;
        }

        /* Container for form */
        .container {
            flex: 1; /* Allow container to grow and take available space */
            max-width: 100%;
            margin-top: 30px;
            padding: 0 15px; /* Add horizontal padding */
        }

        /* Form container style */
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

        /* Form group spacing */
        .form-group {
            margin-bottom: 15px;
        }

        /* Footer styling */
        .footer {
            background-color: #343a40;
            color: #f8f9fa;
            text-align: center;
            padding: 15px;
            margin-top: auto; /* Push footer to the bottom */
        }

        /* Submit button styling */
        .btn-primary {
            width: 100%; /* Ensure submit button spans the full width */
            padding: 12px; /* Add padding for better visibility */
        }

        /* Make the form more responsive */
        @media (max-width: 767px) {
            .container {
                padding: 0 10px; /* Less padding for smaller screens */
            }

            .form-container {
                padding: 20px; /* Less padding inside form */
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
   <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <a class="navbar-brand" href="/">Evaluation Portal</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
           
            <li class="nav-item">
                <!-- Use a span to display date, not clickable -->
                <span class="navbar-text" id="currentDate"></span>
            </li>
        </ul>
    </div>
</nav>
    <!-- Form Content -->
    <div class="container">
        <div class="form-container">
            <h2>Student Evaluation Form</h2>
            <form action="savestudentdetail" method="POST">
                <h3 class="mb-3">Student Details</h3>
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" required>
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" required>
                </div>
                <div class="form-group">
                    <label for="college">College Name</label>
                    <input type="text" class="form-control" id="college" name="college" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="mobile">Mobile</label>
                    <input type="tel" class="form-control" id="mobile" name="mobile" required>
                </div>
                <div class="form-group">
                    <label for="batchType">Batch</label>
                    <input type="text" class="form-control" id="batchType" name="batchType" required>
                </div>
                <div class="form-group">
                    <label for="subject">Subject</label>
                    <input type="text" class="form-control" id="subject" name="subject" required>
                </div>
                <div class="form-group">
                    <label for="faculty">Faculty</label>
                    <select class="form-select" id="faculty" name="faculty" required>
                        <option value="" disabled selected>Select a faculty</option>
                        <option value="Dhiraj Sir">Dhiraj Sir</option>
                        <option value="Tejas Sir">Tejas Sir</option>
                        <option value="Alakh Sir">Alakh Sir</option>
                        <option value="Samir Sir">Samir Sir</option>
                        <option value="MD Sir">MD Sir</option>
                        <option value="Rahul Sir">Rahul Sir</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="regularity">Regularity (1-5)</label>
                    <input type="number" class="form-control" id="regularity" name="regularity" min="1" max="5" required>
                </div>
                <div class="form-group">
                    <label for="communication">Communication (1-5)</label>
                    <input type="number" class="form-control" id="communication" name="communication" min="1" max="5" required>
                </div>
                <div class="form-group">
                    <label for="discipline">Discipline (1-5)</label>
                    <input type="number" class="form-control" id="discipline" name="discipline" min="1" max="5" required>
                </div>
                <div class="form-group">
                    <label for="testPerformance">Test Performance (1-5)</label>
                    <input type="number" class="form-control" id="testPerformance" name="testPerformance" min="1" max="5" required>
                </div>
                <button type="submit" class="btn btn-primary mt-3">Submit Evaluation</button>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 Evaluation Portal. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    // Function to format date in "DD MMMM YYYY" format
    function formatDate(date) {
        const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
        return date.toLocaleDateString('en-US', options);
    }

    // Get current date and set it in the navbar
    const currentDate = new Date();
    document.getElementById('currentDate').textContent = formatDate(currentDate);
</script>
</body>
</html>
