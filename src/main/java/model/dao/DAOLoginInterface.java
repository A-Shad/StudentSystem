package model.dao;

import model.beans.LoginSystem;

public interface DAOLoginInterface {

    void insert(LoginSystem l) throws ClassNotFoundException;

    LoginSystem SelectByID(String userName);
}
