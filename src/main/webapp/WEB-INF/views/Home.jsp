<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Student Evaluation Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f1f5f8;
            font-family: 'Arial', sans-serif;
            padding-top: 56px;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            overflow-x: hidden; /* Prevent horizontal scroll bar */
        }
        .navbar {
            background-color: #2c3e50;
        }
        .navbar-brand, .navbar-nav .nav-link {
            color: #ecf0f1 !important;
        }
        .navbar-brand:hover, .navbar-nav .nav-link:hover {
            color: #f39c12 !important;
        }
        .container {
            max-width: 900px;
            margin-top: 30px;
            flex: 1;
        }
        .hero {
            background: linear-gradient(135deg, #2980b9, #6dd5fa);
            color: white;
            padding: 50px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .hero h1 {
            font-size: 40px;
            font-weight: bold;
        }
        .hero p {
            font-size: 18px;
            margin-bottom: 30px;
        }
        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            height: 100%;
        }
        .card-body {
            padding: 30px;
            text-align: center;
        }
        .card-title {
            font-size: 24px;
            color: #2c3e50;
            font-weight: bold;
        }
        .card-text {
            color: #7f8c8d;
            font-size: 16px;
            margin-bottom: 20px;
        }
        .btn-custom {
            background-color: #f39c12;
            color: white;
            padding: 10px 25px;
            border-radius: 25px;
            font-size: 16px;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #e67e22;
            transform: translateY(-2px);
        }
        .footer {
            background-color: #2c3e50;
            color: #ecf0f1;
            text-align: center;
            padding: 20px 10px;
            font-size: 14px;
            position: relative;
            border-top: 3px solid #f39c12;
        }
        .footer-content a {
            color: #ecf0f1;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }
        .footer-content a:hover {
            color: #f39c12;
        }
        .footer-creator {
            margin-top: 15px;
            padding-top: 10px;
            border-top: 1px solid #7f8c8d;
        }
        .footer-creator p {
            margin: 0;
            font-size: 14px;
            color: #bdc3c7;
        }
        .footer-creator h5 {
            margin: 5px 0;
            color: #f39c12;
            font-weight: bold;
            font-size: 18px;
            text-transform: uppercase;
        }
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 32px;
            }
            .hero p {
                font-size: 16px;
            }
            .card-body {
                padding: 20px;
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
                    <span class="navbar-text" id="currentDate"></span>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="container hero">
        <h1>Welcome to the Student Evaluation Portal</h1>
        <p>Your one-stop solution for managing student evaluations, tracking progress, and making informed decisions. Get started by choosing one of the options below.</p>
    </div>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-4 d-flex align-items-stretch">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Add New Student</h5>
                        <p class="card-text">Enter details of new students to begin evaluations and track progress.</p>
                        <a href="newstudent" class="btn-custom">Add New Student</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 d-flex align-items-stretch">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Search Students</h5>
                        <p class="card-text">Quickly search for students and view their evaluation records.</p>
                        <a href="search" class="btn-custom">Search Students</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 d-flex align-items-stretch">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">List of Students</h5>
                        <p class="card-text">View all students and manage their evaluations easily.</p>
                        <a href="ListStudent" class="btn-custom">List of Students</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-content">
            <p>&copy; 2024 Evaluation Portal. All rights reserved.</p>
            <p>
                <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>
            </p>
            <div class="footer-creator">
                <p>Created By</p>
                <h5>Jalp Panchal</h5>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- JavaScript for Date -->
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
