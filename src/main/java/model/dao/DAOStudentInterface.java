package model.dao;

import java.util.List;

import model.beans.Student;

public interface DAOStudentInterface {

	public void save(Student entity);

	public Student findById(int id);

	public void delete(int id);

	public List<Student> findAll();

	public List<Student> searchAll(String fn, String ln);

}
