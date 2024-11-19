<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Student Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f6f8;
            padding-top: 60px;
            font-family: Arial, sans-serif;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar-brand, .navbar-nav .nav-link, .navbar-text {
            color: #f8f9fa !important;
        }
        .container {
            max-width: 700px;
            margin-top: 30px;
        }
        .table th {
            width: 30%;
            background-color: #f8f9fa;
            font-weight: bold;
        }
        .btn-primary {
            margin-top: 20px;
            margin-bottom: 60px; /* Adds space above footer */
        }
        .footer {
            background-color: #343a40;
            color: #f8f9fa;
            text-align: center;
            padding: 15px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
        .navbar-text.date-text {
            margin-left: auto; /* Pushes date to the far right */
            font-size: 0.9rem;
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
                <!-- Date displayed in the top right corner as non-clickable text -->
                <li class="nav-item">
                    <span class="navbar-text date-text" id="currentDate"></span>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Student Details -->
    <div class="container mt-5">
        <h2 class="text-center mb-4">Student Details</h2>
        <table class="table table-bordered">
            <tbody>
                <tr><th>Student ID</th><td>${student.studentId}</td></tr>
                <tr><th>First Name</th><td>${student.firstName}</td></tr>
                <tr><th>Last Name</th><td>${student.lastName}</td></tr>
                <tr><th>College</th><td>${student.college}</td></tr>
                <tr><th>Email</th><td>${student.email}</td></tr>
                <tr><th>Mobile</th><td>${student.mobile}</td></tr>
                <tr><th>Batch</th><td>${student.batchType}</td></tr>
                <tr><th>Subject</th><td>${student.subject}</td></tr>
                <tr><th>Faculty</th><td>${student.faculty}</td></tr>
                <tr><th>Regularity</th><td>${student.regularity}</td></tr>
                <tr><th>Communication</th><td>${student.communication}</td></tr>
                <tr><th>Discipline</th><td>${student.discipline}</td></tr>
                <tr><th>Test Performance</th><td>${student.testPerformance}</td></tr>
            </tbody>
        </table>
        <a href="${pageContext.request.contextPath}/ListStudent" class="btn btn-primary w-100">Back to List</a>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 Evaluation Portal. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS and Date Script -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Format and display current date and day in the navbar
        function formatDate(date) {
            const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
            return date.toLocaleDateString('en-US', options);
        }
        document.getElementById('currentDate').textContent = formatDate(new Date());
    </script>
</body>
</html>
