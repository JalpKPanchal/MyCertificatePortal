package com.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.entity.StudentEntity;
import com.repository.StudentRepository;


@Controller
public class StudentController {

	@Autowired
	StudentRepository studentRepository;

	@GetMapping(value = { "/home", "/" })
	public String home() {
		return "Home";
	}

	@GetMapping("Certificate")
	public String Certificate(@RequestParam("studentId") String studentId, Model model) {
//		model.addAttribute("student", studentRepository.findById(studentId).get());
		StudentEntity student = studentRepository.findById(studentId).get();
		
		Double avg =(student.getCommunication()+student.getRegularity()+student.getDiscipline()+student.getTestPerformance())/4.0;
		avg = avg*20;
		Integer avgPerformance= avg.intValue();
		
		String grade="";
		if (avgPerformance>=90) {
			grade="A+";
		}else if(avgPerformance>=80){
			grade="A";
		}else if(avgPerformance>=70) {
			grade="B+";
		}else if(avgPerformance>=60) {
			grade="B";
		}else if(avgPerformance>=50) {
			grade="C+";
		}else if(avgPerformance>=40) {
			grade="C";
		}else {
			grade="D";
		}
//		System.out.println(avgPerformance);
		
		model.addAttribute("grade",grade);
		model.addAttribute("student",student);
		model.addAttribute("avg",avgPerformance);

//		System.out.println(avgPerformance);

		return "Report";
	}

	@GetMapping("/newstudent")
	public String newStudent() {
		return "StudentDetail";
	}

	@PostMapping("/savestudentdetail")
	public String saveStudentDetail(StudentEntity studentEntity) {
		// how to read jsp form data here ?
		studentRepository.save(studentEntity);
		return "redirect:/ListStudent";
	}

	@GetMapping("/ListStudent")
	public String listStudent(Model model) {

		List<StudentEntity> students = studentRepository.findAll();
		model.addAttribute("students", students);

		return "ListStudent";
	}

	@GetMapping("/deleteStudent")
	public String deleteStudent(StudentEntity studentEntity) {
		studentRepository.deleteById(studentEntity.getStudentId());

		return "redirect:/ListStudent";
	}

	@GetMapping("/viewStudent")
	public String viewStudent(StudentEntity studentEntity, Model model) {
		Optional<StudentEntity> op = studentRepository.findById(studentEntity.getStudentId());
		if (op.isPresent()) {
			StudentEntity studentEntity2 = op.get();
			model.addAttribute("student", studentEntity2);
			return "ViewStudent";
		} else {
			return "error";
		}

	}

	@PostMapping("/searchStudents")
	public String searchStudents(@RequestParam("query") String query, Model model) {
		// Assuming the repository has a suitable query method, like
		// findByFirstNameStartingWith
		List<StudentEntity> students = studentRepository.findByFirstNameStartingWith(query);
		model.addAttribute("students", students);
		return "Search"; // Matches the Search.jsp page to display results
	}

	@GetMapping("/search")
	public String searchPage() {
		return "Search"; // This should match the name of your JSP file (Search.jsp)
	}

	@GetMapping("/editStudent")
	public String editStudent(@RequestParam("StudentId") String studentId, Model model) {
		Optional<StudentEntity> studentOptional = studentRepository.findById(studentId);
		if (studentOptional.isPresent()) {
			model.addAttribute("student", studentOptional.get());
			return "EditStudent";
		} else {
			return "error"; // Handle error if student is not found
		}
	}

	// Update student details after the form submission
	@PostMapping("/updateStudent")
	public String updateStudent(StudentEntity studentEntity) {
		studentRepository.save(studentEntity); // Saves or updates the student
		return "redirect:/ListStudent"; // Redirect back to the ListStudent page
	}
	


}