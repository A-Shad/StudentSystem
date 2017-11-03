package model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class HibernateUtil {
	@Autowired
	private SessionFactory sf;

	public Session getSession() {
		return sf.getCurrentSession();
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sf = sessionFactory;
	}
}