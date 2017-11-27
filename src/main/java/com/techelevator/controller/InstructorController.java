package com.techelevator.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.dao.InstructorDAO;
import com.techelevator.dao.StudentDAO;
import com.techelevator.model.Instructor;
import com.techelevator.model.ScheduledClass;
import com.techelevator.model.Student;

@Controller
public class InstructorController {
	
	@Autowired
	private InstructorDAO instructorDao;
	
	@Autowired
	private StudentDAO studentDao;
	
	@RequestMapping(path="/instructorDashboard", method=RequestMethod.GET)
	public String getInstructorHomePage(ModelMap modelHolder, HttpSession session, HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		List<ScheduledClass> classes = instructorDao.GetAllScheduledClassesByInstructor(((Instructor) session.getAttribute("instructor")).getInstructorId());
		modelHolder.put("allScheduledClasses", classes);
		
		//List<Student> students = studentDao.getAllStudentsByInstructor(((Instructor) session.getAttribute("instructor")).getInstructorId());
		//model.put("studentClassList", students);
		
		return "instructorDashboard";
	}
	@RequestMapping(path="/instructorViewClasses", method=RequestMethod.GET)
	public String getInstructorViewClasses(ModelMap modelHolder, HttpSession session, HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		List<ScheduledClass> classes = instructorDao.GetAllScheduledClassesByInstructor(((Instructor) session.getAttribute("instructor")).getInstructorId());
		modelHolder.put("allScheduledClasses", classes);
		return "instructorViewClasses";
	}
	
	@RequestMapping(path="/spreadsheet", method=RequestMethod.GET)
	public String showSpreadsheetTEST(ModelMap modelHolder, ModelMap model, HttpSession session, HttpServletRequest request) {
		List<Student> students = studentDao.getAllStudentsByClass(((Instructor) session.getAttribute("instructor")).getInstructorId());
		modelHolder.put("allStudents", students);
		
		List<ScheduledClass> classes = instructorDao.GetAllScheduledClassesByInstructor(((Instructor) session.getAttribute("instructor")).getInstructorId());
		model.put("allScheduledClasses", classes);
		
		return "spreadsheet";
	}
	
	
//	@RequestMapping(path="/addStudent", method=RequestMethod.POST)
//	public String addInstructor(@Valid @ModelAttribute Student student, BindingResult result, RedirectAttributes flash){
//		flash.addFlashAttribute("student", student);
//
//		instructorDao.addStudent(student);
//		return "redirect:/managerHome";
//}

}
