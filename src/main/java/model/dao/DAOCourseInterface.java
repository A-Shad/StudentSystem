package model.dao;

import java.util.List;

import model.beans.Course;

public interface DAOCourseInterface {
	    
    
		public void save(Course entity);
		
	
		public Course findById(int id);
		
		public void delete(int id);
		
		public List<Course> findAll();


		public List<Course> searchAll(String cn);

}



