# Student System
1- This system is developed using Maven, Spring MVC, Hibernate, TomCat 8.0, Log4J, Java 8, JSTL, JavaScript, JSP, HTML, JQuery, CSS, Bootstrap 
    and .... I tested this system on both Linux and Windows platforms and both MySQL 5.5 and Oracle 11.2 but I chose MySQL for the final 
    version.  

2- I used both Eclipse and Netbeans as IDE, but I found Eclipse a better option because I believe the debugging is easier with Eclipse. 
   I also used Tomcat 8.0; because I had different versions of Eclipses installed on different operating systems and computers 
   and some of them could just support upto TomCat 8.0. I used both SQLDeveloper and DBeaver as database IDE. Although, I 
   could use SQLDeveloper for both MySQL and Oracle, I found DBeaver more friendly to work with MySQL.
   
3- This system is tested on Windows 10, 7 and Linux Mint 18.1. In case you choose to work with Linux and Oracle, my suggestion is to
   select RedHat since I guess Oracle is apparently designed specifically for RedHat and with Linux Mint it's not that straight forward.

4- This system has four sub-systems: Students, Courses, Results and Logins. Here are some of the functions available in the system:
   a- You can signup and the login. 
   b- You can register/edit/search/list student, course and marks. 
   c- There are two types of email functions in the system: in Student subsystem you can send a general email located as a hiperlink 
      in the list of students or can send the result as PDF attachment to students, located in the Result subsystem as a hiperlink 
      in the list of results. Making PDF file as attachment is taking place in the memory and nothing get saved on harddisk. 
      In case you wanna check the email functions, the email linked to the user must be set to be allowed to send email inside 
      the application. Please check the relevant documents for each mail server for the proper settings. 
  
 5- To run the application: a-Create "studentadmission" database in your MySQL. b- Set your MySQL "username" and "password" in     "hibernate.properties" file and it's good to go!  Don't forget to change "hibernate.hbm2ddl.auto" to "update" 
    after the first run to not re-create database tables each time.
      
 Happy J2EE development!
 
