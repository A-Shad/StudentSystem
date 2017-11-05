package model.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

//import org.apache.catalina.Session;
import model.beans.Course;


@Repository
@Transactional
public class DAOCourseImp  extends HibernateUtil implements DAOCourseInterface {

	@Override
	public void save(Course entity) {
		getSession().saveOrUpdate(entity);
		
	}

	@Override
	public Course findById(int id) {
		Course cs = (Course) getSession().load(Course.class, id);
		Hibernate.initialize(cs);
		return cs;
	}

	@Override
	public void delete(int id) {
		getSession().delete(findById(id));
		
	}

	@Override
	public List<Course> findAll() {
        Criteria criteria = getSession().createCriteria(Course.class);        
        return criteria.list();
	}

	@Override
	public List<Course> searchAll(String cn) {
		Criteria criteria1 = getSession().createCriteria(Course.class);


		criteria1.add(Restrictions.like("courseName", "%" + cn + "%"));
		List<Course> list1 = criteria1.list();

		return list1;
	}



}
