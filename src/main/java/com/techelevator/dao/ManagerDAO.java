package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Instructor;
import com.techelevator.model.ScheduledClass;

public interface ManagerDAO {
	public String saveInstructorEmail(String email);
	public boolean checkForEmail (String email);
	public List<Instructor> getAllInstructors();
	List<ScheduledClass> GetAllScheduledClassesByManager(int managerId);

}
