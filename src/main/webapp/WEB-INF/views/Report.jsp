<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Student Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- AOS CSS (for scroll animations) -->
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <!-- jsPDF and html2canvas Libraries -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<!-- jsPDF CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.2/jspdf.umd.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
	   <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.2/jspdf.umd.min.js"></script> <!-- jsPDF -->
	   <script src="https://cdn.jsdelivr.net/npm/jspdf@2.5.2/dist/jspdf.umd.min.js"></script>
   
<script>
function makePDF() {
    const { jsPDF } = window.jspdf;  // Destructure jsPDF from the global window object

    // Select elements to hide during export
    const footer = document.querySelector('.footer');
    const exportButton = document.querySelector('button');

    // Hide the footer and button
    footer.style.display = 'none';
    exportButton.style.display = 'none';
	
    const captureElement = document.getElementById('capture');
    html2canvas(captureElement, {
        scale: 2, // High-resolution capture
        useCORS: true
    }).then(canvas => {
        const imgData = canvas.toDataURL('image/png');
        const pdf = new jsPDF('p', 'mm', 'a4');
        const pageWidth = pdf.internal.pageSize.getWidth();
        const pageHeight = pdf.internal.pageSize.getHeight();
        const imgWidth = pageWidth;
        const imgHeight = (canvas.height * pageWidth) / canvas.width;

        pdf.addImage(imgData, 'PNG', 0, 0, imgWidth, imgHeight);
        pdf.save('Student_Report.pdf');

        // Restore the visibility of the footer and button
        footer.style.display = 'block';
        exportButton.style.display = 'inline-block';
    }).catch(error => {
        console.error('Error generating PDF:', error);

        // Restore the visibility in case of error
        footer.style.display = 'block';
        exportButton.style.display = 'inline-block';
    });
}
</script>
    

       
     <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
            color: #333;
            animation: fadeIn 1.5s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        .container {
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .header-bar {
            text-align: center;
            padding: 15px;
            background: linear-gradient(135deg, #5f5fff, #ab6ccf);
            color: #fff;
            border-radius: 10px 10px 0 0;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .profile-card,
        .chart-card,
        .grading-scale {
            background-color: #fff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            min-width: 280px;
        }

        .circle {
            width: 100px;
            height: 100px;
            margin: 20px auto;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #e8e9ff;
            color: #5f5fff;
            font-size: 1.5rem;
            font-weight: bold;
            animation: popUp 1s ease-in-out;
        }

        /* Mobile responsiveness */
        @media (max-width: 768px) {
            .header-bar h1 {
                font-size: 1.5rem;
            }

            .circle {
                width: 80px;
                height: 80px;
                font-size: 1.2rem;
            }

            .chart-container {
                flex-direction: column;
            }

            .table-responsive {
                margin-bottom: 20px;
            }

            .footer {
                font-size: 0.9rem;
                padding: 10px;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 10px;
                max-width: 100%;
            }

            .chart-card {
                padding: 10px;
            }

            .header-bar {
                padding: 10px;
            }

            .footer {
                padding: 8px;
            }

            .table th, .table td {
                padding: 8px;
                font-size: 0.9rem;
            }
        }

        .footer {
            text-align: center;
            padding: 15px;
            background-color: #e0e0e0;
            border-radius: 10px;
            margin-top: 20px;
            color: #666;
        }

        .footer a {
            color: #5f5fff;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <div class="container" data-aos="fade-up" id="capture">
        <!-- Header -->
        <div class="header-bar" data-aos="zoom-in">
            <h1>Responsive Student Dashboard</h1>
        </div>

        <!-- Profile Section -->
        <div class="profile-card" data-aos="fade-right">
            <h3 class="text-center">Student Information</h3>
            <div class="table-responsive">
                <table class="table table-striped mt-3">
                    <tbody>
                        <tr>
                            <th>First Name</th>
                            <td>${student.firstName}</td>
                            <th>Last Name</th>
                            <td>${student.lastName}</td>
                        </tr>
                        <tr>
                            <th>College</th>
                            <td>${student.college}</td>
                            <th>Email</th>
                            <td>${student.email}</td>
                        </tr>
                        <tr>
                            <th>Mobile</th>
                            <td>${student.mobile}</td>
                            <th>Batch Type</th>
                            <td>${student.batchType}</td>
                        </tr>
                        <tr>
                            <th>Subject</th>
                            <td>${student.subject}</td>
                            <th>Faculty</th>
                            <td>${student.faculty}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Chart Section -->
        <div class="row g-3">
            <div class="col-lg-6 col-md-12 chart-card" data-aos="fade-left">
                <h3 class="text-center">Ratings Overview</h3>
                <canvas id="ratingsChart" class="mt-4"></canvas>
            </div>
            <div class="col-lg-6 col-md-12 chart-card" data-aos="fade-left">
                <h3 class="text-center">Performance Trend</h3>
                <canvas id="trendChart" class="mt-4"></canvas>
            </div>
        </div>

        <!-- Final Score and Grade -->
        <div class="profile-card text-center" data-aos="flip-up">
            <h3>Final Score</h3>
            
            
            
            <div class="circle">
             ${avg}%
                
            </div>
            <h4>${grade} </h4>
            <p class="text-muted">Based on overall ratings</p>
        </div>

        <!-- Grading Scale -->
        <div class="grading-scale" data-aos="fade-up">
            <h3>Grading Scale</h3>
            <p>A+: 91-100 | A: 81-90 | B+: 71-80 | B: 61-70 | C+: 51-60 | C: 41-50 | D: Below 41</p>
        </div>
        <!-- Export PDF Button -->
        <button class="btn btn-primary mt-3" onclick="makePDF()">Export Full Report as PDF</button>
        
        <!-- Footer -->
        <footer class="footer">
            <p>&copy; 2024 Evaluation Portal. All rights reserved. <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
        </footer>
    </div>

    <script>
        // Initialize AOS (scroll animations)
        AOS.init({
            duration: 1200,
            once: true
        });


        // Chart.js Code for Ratings and Performance Trend
        const ratingsCtx = document.getElementById('ratingsChart').getContext('2d');
        new Chart(ratingsCtx, {
            type: 'bar',
            data: {
                labels: ['Regularity', 'Communication', 'Discipline', 'Test Performance'],
                datasets: [{
                    label: 'Ratings',
                    data: [${student.regularity}, ${student.communication}, ${student.discipline},${student.testPerformance}],
                    backgroundColor: ['rgba(95, 95, 255, 0.7)', 'rgba(171, 108, 207, 0.7)', 'rgba(95, 95, 255, 0.7)', 'rgba(171, 108, 207, 0.7)'],
                    borderColor: ['rgba(95, 95, 255, 1)', 'rgba(171, 108, 207, 1)', 'rgba(95, 95, 255, 1)', 'rgba(171, 108, 207, 1)'],
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        max: 5,
                        title: {
                            display: true,
                            text: 'Rating (1-5)'
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Criteria'
                        }
                    }
                },
                plugins: {
                    legend: {
                        display: true,
                        position: 'top'
                    }
                }
            }
        });

        const trendCtx = document.getElementById('trendChart').getContext('2d');
        new Chart(trendCtx, {
            type: 'line',
            data: {
                labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                datasets: [{
                    label: 'Performance Trend',
                    data: [80, 85, 83, 87, 90, 92, 94, 95, 96, 97, 98, 99],
                    backgroundColor: 'rgba(95, 95, 255, 0.2)',
                    borderColor: 'rgba(95, 95, 255, 1)',
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        max: 100,
                        title: {
                            display: true,
                            text: 'Performance (%)'
                        }
                    }
                },
                plugins: {
                    legend: {
                        display: true,
                        position: 'top'
                    }
                }
            }
        });
    </script>
</body>

</html>