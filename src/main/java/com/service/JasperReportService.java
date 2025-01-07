package com.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import com.entity.StudentEntity;
import com.repository.StudentRepository;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Service
public class JasperReportService {

    @Autowired
    private StudentRepository studentRepository;

    public String exportStudentListPdf() {
        try {
            // Fetch data from database
            List<StudentEntity> students = studentRepository.findAll();
            if (students.isEmpty()) {
                throw new IllegalStateException("No students found to export!");
            }

            // Load and compile the JRXML template
            File file = ResourceUtils.getFile("classpath:students.jrxml");
            JasperReport jasperReport = JasperCompileManager.compileReport(file.getAbsolutePath());

            // Prepare data source and parameters
            JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(students);
            Map<String, Object> parameters = new HashMap<>();
            parameters.put("createdBy", "Your Name");

            // Fill the report
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);

            // Create output directory and file
            String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
            Path outputPath = Paths.get("reports", "students_" + timestamp + ".pdf");
            Files.createDirectories(outputPath.getParent());

            // Export the report to a PDF file
            JasperExportManager.exportReportToPdfFile(jasperPrint, outputPath.toString());
            return outputPath.toString();

        } catch (FileNotFoundException e) {
            throw new RuntimeException("Report template not found!", e);
        } catch (Exception e) {
            throw new RuntimeException("Failed to generate report.", e);
        }
    }
}
