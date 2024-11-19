<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Evaluation List</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f8; /* Light gray background */
            color: #343a40;
            padding-top: 56px; /* Space for fixed navbar */
        }

        .navbar {
            background-color: #343a40; /* Dark background for navbar */
        }

        .navbar-brand, .navbar-nav .nav-link {
            color: #f8f9fa !important; /* Light text color */
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        h2 {
            color: #343a40;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .action-buttons {
            text-align: center;
            margin-bottom: 20px;
        }

        .action-buttons a {
            font-size: 16px;
            padding: 8px 16px;
            margin-right: 10px;
            margin-bottom: 10px;
        }

        /* Table Container with horizontal scroll */
        .table-container {
            overflow-x: auto;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            background-color: #ffffff;
        }

        /* Table Styling */
        table {
            width: 100%;
            table-layout: fixed;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #dee2e6;
        }

        th {
            background-color: white; /* Dark background for column names */
            color: black; /* White text for contrast */
            font-size: 16px;
            font-weight: bold; /* Bold column headers */
            text-align: center;
        }

        td {
            font-size: 14px;
            word-wrap: break-word; /* Ensures wrapping for long text */
            word-break: break-word; /* Breaks long unbroken text */
            white-space: normal; /* Allows text wrapping */
        }

        td a {
            font-size: 14px;
            padding: 6px 10px;
            margin: 3px;
            text-decoration: none;
            border-radius: 4px;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f3f5;
        }

        /* Button Styles */
        .btn-info {
            background-color: #17a2b8;
            border-color: #17a2b8;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-sm {
            font-size: 13px;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            h2 {
                font-size: 24px;
            }

            .table-container {
                margin-top: 15px;
            }

            .table th, .table td {
                font-size: 12px;
            }
        }

        /* Footer Styling */
        .footer {
            background-color: #343a40;
            color: #f8f9fa;
            text-align: center;
            padding: 15px;
            margin-top: 30px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
.btn-certificate {
    background-color: #4CAF50; /* Light Green */
    border-color: #4CAF50;
    color: #ffffff;
}

.btn-certificate:hover {
    background-color: #45A049; /* Slightly darker green for hover */
    border-color: #45A049;
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
                    <span class="navbar-text" id="currentDate"></span>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Content -->
    <div class="container mt-5">
        <h2 class="text-center">Evaluation List</h2>

        <!-- Action Buttons -->
        <div class="action-buttons">
            <a href="search" class="btn btn-info btn-sm">Search Student</a>
            <a href="newstudent" class="btn btn-success btn-sm">Add Student</a>
        </div>

        <!-- Table with Horizontal Scroll -->
        <div class="table-container">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>College</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Batch</th>
                        <th>Subject</th>
                        <th>Faculty</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="evaluation" items="${students}">
                        <tr>
                            <td>${evaluation.firstName}</td>
                            <td>${evaluation.lastName}</td>
                            <td>${evaluation.college}</td>
                            <td>${evaluation.email}</td>
                            <td>${evaluation.mobile}</td>
                            <td>${evaluation.batchType}</td>
                            <td>${evaluation.subject}</td>
                            <td>${evaluation.faculty}</td>
                            <td>
<a href="Certificate?studentId=${evaluation.studentId}" class="btn btn-success btn-sm">Certificate</a>
                                <a href="deleteStudent?StudentId=${evaluation.studentId}" class="btn btn-danger btn-sm">Delete</a>
                                <a href="editStudent?StudentId=${evaluation.studentId}" class="btn btn-warning btn-sm">Edit</a>
                                <a href="viewStudent?StudentId=${evaluation.studentId}" class="btn btn-info btn-sm">View</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 Evaluation Portal. All rights reserved.</p>
    </footer>

    <!-- Bootstrap 5 and JS dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function formatDate(date) {
            const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
            return date.toLocaleDateString('en-US', options);
        }

        const currentDate = new Date();
        document.getElementById('currentDate').textContent = formatDate(currentDate);
    </script>
</body>
</html>
