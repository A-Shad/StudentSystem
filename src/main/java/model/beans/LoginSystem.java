package model.beans;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Logins")
public class LoginSystem {
   @Id
   private String userName;
   private String password;
   private String firstName;	
   private String lastName;
   private String email;
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}

public String getFirstName() {
	return firstName;
}
public void setFirstName(String firstName) {
	this.firstName = firstName;
}
public String getLastName() {
	return lastName;
}
public void setLastName(String lastName) {
	this.lastName = lastName;
}
public LoginSystem(String firstName, String lastName, String userName, String password, String email) {
	super();
	this.firstName = firstName;
	this.lastName = lastName;
	this.userName = userName;
	this.password = password;
	this.email = email;
}


public LoginSystem() {
	super();
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}

 
   
}
