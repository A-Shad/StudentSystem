package model.dao;

import org.hibernate.Hibernate;
import org.hibernate.ObjectNotFoundException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.beans.LoginSystem;

@Repository
@Transactional
public class DAOLoginImp extends HibernateUtil implements DAOLoginInterface {
    @Override
    public void insert(LoginSystem s) {
        getSession().saveOrUpdate(s);
    }

    @Override
    public LoginSystem SelectByID(String userName) throws ObjectNotFoundException {
    	System.out.println("User name is : " + userName);
        LoginSystem lg = (LoginSystem) getSession().load(LoginSystem.class, userName);
        
        Hibernate.initialize(lg);
        return lg;
    }

}
