package com.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.StudentEntity;
import com.repository.StudentRepository;
import com.service.JasperReportService;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class StudentController {

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private JasperReportService jasperReportService;

    // Home page
    @GetMapping(value = {"/home", "/"})
    public String home() {
        return "Home"; // JSP for home page
    }

    // List all students
    @GetMapping("/ListStudent")
    public String listStudent(Model model) {
        List<StudentEntity> students = studentRepository.findAll();
        model.addAttribute("students", students);
        return "ListStudent"; // JSP for listing students
    }

    // Generate PDF report for students and return as a downloadable response
    @GetMapping("exportpdf")
    public ResponseEntity<byte[]> exportPdf() {
        try {
            // Call JasperReportService to generate the report and get the path
            String pdfPath = jasperReportService.exportStudentListPdf();
            File pdfFile = new File(pdfPath);

            // Check if the file exists
            if (pdfFile.exists()) {
                byte[] pdfBytes = Files.readAllBytes(pdfFile.toPath());

                // Set headers for the response
                HttpHeaders headers = new HttpHeaders();
                headers.setContentType(MediaType.APPLICATION_PDF);
                headers.setContentDisposition(ContentDisposition.attachment().filename(pdfFile.getName()).build());

                // Return the PDF file as a ResponseEntity
                return new ResponseEntity<>(pdfBytes, headers, HttpStatus.OK);
            } else {
                // File not found
                return new ResponseEntity<>("Report file not found.".getBytes(), HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("Error generating report.".getBytes(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Certificate page: Retrieve student and calculate performance
    @GetMapping("Certificate")
    public String Certificate(@RequestParam("studentId") String studentId, Model model) {
        StudentEntity student = studentRepository.findById(studentId).get();

        // Calculate average performance
        Double avg = (student.getCommunication() + student.getRegularity() + student.getDiscipline() + student.getTestPerformance()) / 4.0;
        avg = avg * 20;
        Integer avgPerformance = avg.intValue();

        // Assign grade based on performance
        String grade = "";
        if (avgPerformance >= 90) {
            grade = "A+";
        } else if (avgPerformance >= 80) {
            grade = "A";
        } else if (avgPerformance >= 70) {
            grade = "B+";
        } else if (avgPerformance >= 60) {
            grade = "B";
        } else if (avgPerformance >= 50) {
            grade = "C+";
        } else if (avgPerformance >= 40) {
            grade = "C";
        } else {
            grade = "D";
        }

        // Add data to model
        model.addAttribute("grade", grade);
        model.addAttribute("student", student);
        model.addAttribute("avg", avgPerformance);

        return "Report"; // JSP for the report
    }

    // New student page
    @GetMapping("/newstudent")
    public String newStudent() {
        return "StudentDetail"; // JSP for new student form
    }

    // Save student details
    @PostMapping("/savestudentdetail")
    public String saveStudentDetail(StudentEntity studentEntity) {
        studentRepository.save(studentEntity);
        return "redirect:/ListStudent"; // Redirect to list after saving
    }

    // Delete student
    @GetMapping("/deleteStudent")
    public String deleteStudent(StudentEntity studentEntity) {
        studentRepository.deleteById(studentEntity.getStudentId());
        return "redirect:/ListStudent"; // Redirect to list after deletion
    }

    // View student details
    @GetMapping("/viewStudent")
    public String viewStudent(StudentEntity studentEntity, Model model) {
        Optional<StudentEntity> op = studentRepository.findById(studentEntity.getStudentId());
        if (op.isPresent()) {
            StudentEntity studentEntity2 = op.get();
            model.addAttribute("student", studentEntity2);
            return "ViewStudent"; // JSP for viewing student
        } else {
            return "error"; // Error page if student not found
        }
    }

    // Search students by first name
    @PostMapping("/searchStudents")
    public String searchStudents(@RequestParam("query") String query, Model model) {
        List<StudentEntity> students = studentRepository.findByFirstNameStartingWith(query);
        model.addAttribute("students", students);
        return "Search"; // JSP for search results
    }

    // Search page
    @GetMapping("/search")
    public String searchPage() {
        return "Search"; // JSP for search input
    }

    // Edit student details
    @GetMapping("/editStudent")
    public String editStudent(@RequestParam("StudentId") String studentId, Model model) {
        Optional<StudentEntity> studentOptional = studentRepository.findById(studentId);
        if (studentOptional.isPresent()) {
            model.addAttribute("student", studentOptional.get());
            return "EditStudent"; // JSP for editing student details
        } else {
            return "error"; // Handle error if student is not found
        }
    }

    // Update student details
    @PostMapping("/updateStudent")
    public String updateStudent(StudentEntity studentEntity) {
        studentRepository.save(studentEntity); // Save updated student
        return "redirect:/ListStudent"; // Redirect back to the ListStudent page
    }
}
