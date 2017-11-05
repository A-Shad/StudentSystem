package model.dao;
import java.util.List;

import model.beans.Result;

public interface DAOResultInterface {
	    
    
		public void save(Result entity);
		
	
		public Result findById(int id);
		
		public void delete(int id);
		
		public List<Result> findAll();

		public List<Result> searchAll(String cn);
                
                public List<Result> searchAllGrades(int courseId, int semester, int year);

}



