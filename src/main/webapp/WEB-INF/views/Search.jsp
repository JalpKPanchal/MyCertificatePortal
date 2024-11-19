<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Students</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        /* Ensures full-height layout and positions footer at the bottom */
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background-color: #343a40;
        }

        .navbar-brand, .navbar-nav .nav-link, .navbar-text {
            color: #f8f9fa !important;
        }

        .navbar-text {
            position: absolute;
            right: 20px;
            top: 10px;
            font-size: 0.9rem;
        }

        /* Main content area should take available space */
        .content {
            flex: 1;
            padding-top: 60px;
        }

        .table-container {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
            border-radius: 10px;
        }

        table {
            width: 100%;
            min-width: 800px;
            background-color: #fff;
        }

        th, td {
            white-space: nowrap;
            text-align: left;
            padding: 12px 15px;
        }

        .btn {
            min-width: 75px;
        }

        /* Footer styling to fix it at the bottom */
        .footer {
            background-color: #343a40;
            color: #f8f9fa;
            text-align: center;
            padding: 10px 0;
            margin-top: auto;
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
            <ul class="navbar-nav ml-auto"></ul>
            <span class="navbar-text" id="currentDate"></span>
        </div>
    </nav>

    <!-- Content wrapper -->
    <div class="content container mt-5">
        <h2 class="text-center">Search Students</h2>

        <!-- Search Form -->
        <form action="/searchStudents" method="post" class="mt-4">
            <div class="form-group">
                <input type="text" name="query" placeholder="Enter student name..." class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Search</button>
        </form>

        <!-- Search Results Table -->
        <div id="searchResults" class="mt-5">
            <c:if test="${not empty students}">
                <div class="table-container">
                    <table class="table table-bordered table-hover table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>Mobile</th>
                                <th>Batch</th>
                                <th>Subject</th>
                                <th>Faculty</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="student" items="${students}">
                                <tr>
                                    <td>${student.firstName}</td>
                                    <td>${student.lastName}</td>
                                    <td>${student.email}</td>
                                    <td>${student.mobile}</td>
                                    <td>${student.batchType}</td>
                                    <td>${student.subject}</td>
                                    <td>${student.faculty}</td>
                                    <td>
                                        <a href="viewStudent?StudentId=${student.studentId}" class="btn btn-sm btn-info">View</a>
                                        <a href="editStudent?StudentId=${student.studentId}" class="btn btn-sm btn-warning">Edit</a>
                                        <a href="deleteStudent?StudentId=${student.studentId}" class="btn btn-sm btn-danger">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
            <c:if test="${empty students}">
                <p class="text-muted mt-4">No students found matching your search criteria.</p>
            </c:if>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 Evaluation Portal. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
