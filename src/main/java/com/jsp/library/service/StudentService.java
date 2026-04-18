package com.jsp.library.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jsp.library.dao.StudentDao;
import com.jsp.library.entity.Student;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class StudentService {
	
	private final StudentDao studentDao;
	
	public void saveStudent( Student student) {
		studentDao.saveStudent(student);
	}
	public Student findStudentById(int id) {
        return studentDao.fetchStudentById(id);
    }

    public List<Student> fetchAllStudents() {
        return studentDao.fetchAllStudents();
    }

    public void updateStudent(Student student) {
        studentDao.updateStudent(student);
    }

}
