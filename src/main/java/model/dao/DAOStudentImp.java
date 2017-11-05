package model.dao;

import java.util.List;

import org.hibernate.Criteria;
//import org.apache.catalina.Session;
import org.hibernate.Hibernate;

import org.hibernate.criterion.Restrictions;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.beans.Student;

@Repository
@Transactional
public class DAOStudentImp extends HibernateUtil implements DAOStudentInterface {
//    @Autowired
//    private SessionFactory sessionFactory;
    
//	private static final Object Student = null;

	@Override
	public void save(Student entity) {
		getSession().saveOrUpdate(entity);

	}

	@Override
	public Student findById(int id) {
		Student st = (Student) getSession().load(Student.class, id);
		Hibernate.initialize(st);
		return st;

	}

	@Override
	public void delete(int id) {
		getSession().delete(findById(id));
		

	}

	@Override
	public List<Student> findAll() {

        Criteria criteria = getSession().createCriteria(Student.class);        
        return criteria.list();
	}

	@Override
	public List<Student> searchAll(String fn, String ln) {

		Criteria criteria1 = getSession().createCriteria(Student.class);

		criteria1.add(Restrictions.like("firstName", fn + "%"));
		criteria1.add(Restrictions.like("lastName", ln + "%"));

		List<Student> list1 = criteria1.list();

		return list1;
	}

}
