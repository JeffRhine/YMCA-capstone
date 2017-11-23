package com.techelevator.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Student;

@Component
public class StudentJdbcDao implements StudentDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void JDBCUserDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void saveStudent(Student student) {
		jdbcTemplate.update("INSERT INTO student (first_name, last_name, birthday, gender) VALUES (?,?,?,?)",
		student.getFirstName(), student.getLastName(), LocalDate.now(), "Trans");
	}
	@Override
	public List<Student> getAllStudentsByClass(int classId){
		List<Student> studentClassList = new ArrayList<Student>();		
		String sqlSearchForStudentsByClass = "SELECT s.first_name, s.last_name FROM student s JOIN class_student cs "
				+" ON s.student_id=cs.student_id JOIN class c ON c.class_id =cs.class_id WHERE cs.class_id= ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForStudentsByClass, classId);
		while(results.next()){
			Student student = new Student();
			student.setFirstName(results.getString("first_name"));
			student.setLastName(results.getString("last_name"));
			studentClassList.add(student);
		}
		return 	studentClassList;	
	}

}
