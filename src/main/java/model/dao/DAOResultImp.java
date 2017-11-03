package model.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

//import org.apache.catalina.Session;
import model.beans.Result;


@Repository
@Transactional
public class DAOResultImp extends HibernateUtil  implements DAOResultInterface {

    @Override
    public void save(Result entity) {

    	getSession().saveOrUpdate(entity);

    }

    @Override
    public Result findById(int id) {
		Result rt = (Result) getSession().load(Result.class, id);
		Hibernate.initialize(rt);
		return rt;
    }

    @Override
    public void delete(int id) {
		getSession().delete(findById(id));
    }

    @Override
    public List<Result> findAll() {
        Criteria criteria = getSession().createCriteria(Result.class); 
        criteria.addOrder(Order.asc("course.courseId"));
        criteria.addOrder(Order.asc("semester"));
        criteria.addOrder(Order.asc("year"));
        return criteria.list();
    }

    @Override
    public List<Result> searchAll(String cn) {
		Criteria criteria1 = getSession().createCriteria(Result.class);

		 criteria1.add(Restrictions.or(Restrictions.like("courseName", cn + "%")));

		List<Result> list1 = criteria1.list();

		return list1;

    }

    @Override
    public List<Result> searchAllGrades(int courseId, int sem, int yr) {
		Criteria crit = getSession().createCriteria(Result.class);
	       crit.add(Restrictions.eq("course.courseId", courseId));
	        crit.add(Restrictions.eq("semester", sem));
	        crit.add(Restrictions.eq("year", yr));
	        crit.addOrder(Order.asc("course.courseId"));
	        crit.addOrder(Order.asc("semester"));
	        crit.addOrder(Order.asc("year"));
		List<Result> list1 = crit.list();

		return list1;
    }
}
