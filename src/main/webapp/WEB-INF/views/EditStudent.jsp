<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f6f8;
            padding-top: 60px;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .container {
            max-width: 800px;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-custom {
            background-color: #007bff;
            border: none;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
        footer.footer {
            margin-top: auto;
            text-align: center;
            padding: 15px 0;
            background-color: #343a40;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Edit Student Details</h2>

        <form action="/updateStudent" method="post">
            <input type="hidden" name="studentId" value="${student.studentId}">
            <div class="form-group">
                <label for="firstName">First Name</label>
                <input type="text" name="firstName" class="form-control" value="${student.firstName}" required>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input type="text" name="lastName" class="form-control" value="${student.lastName}" required>
            </div>
             <div class="form-group">
                <label for="college">College</label>
                <input type="text" name="college" class="form-control" value="${student.college}" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" class="form-control" value="${student.email}" required>
            </div>
            <div class="form-group">
                <label for="mobile">Mobile</label>
                <input type="tel" name="mobile" class="form-control" value="${student.mobile}" required>
            </div>
            <div class="form-group">
                <label for="batchType">Batch</label>
                <input type="text" name="batchType" class="form-control" value="${student.batchType}" required>
            </div>
            <div class="form-group">
                <label for="subject">Subject</label>
                <input type="text" name="subject" class="form-control" value="${student.subject}" required>
            </div>
            <div class="form-group">
                <label for="faculty">Faculty</label>
                <input type="text" name="faculty" class="form-control" value="${student.faculty}" required>
            </div>
            <div class="form-group">
                <label for="regularity">Regularity (1-5)</label>
                <input type="number" name="regularity" class="form-control" min="1" max="5" value="${student.regularity}" required>
            </div>
            <div class="form-group">
                <label for="communication">Communication (1-5)</label>
                <input type="number" name="communication" class="form-control" min="1" max="5" value="${student.communication}" required>
            </div>
            <div class="form-group">
                <label for="discipline">Discipline (1-5)</label>
                <input type="number" name="discipline" class="form-control" min="1" max="5" value="${student.discipline}" required>
            </div>
            <div class="form-group">
                <label for="testPerformance">Test Performance (1-5)</label>
                <input type="number" name="testPerformance" class="form-control" min="1" max="5" value="${student.testPerformance}" required>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-custom">Update</button>
                <a href="${pageContext.request.contextPath}/ListStudent" class="btn btn-secondary ml-2">Back to List</a>
            </div>
        </form>
    </div>

    <footer class="footer">
        <p>&copy; 2024 Evaluation Portal. All rights reserved.</p>
    </footer>
</body>
</html>
