package controller;

import java.text.ParseException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.beans.EmailBean;
import model.beans.LoginSystem;
import model.beans.Student;
import model.dao.DAOEmailInterface;
import model.dao.DAOLoginInterface;
import model.dao.DAOStudentInterface;

@Controller
@RequestMapping("login/student")
public class StudentActionController {
	final static Logger logger = Logger.getLogger(StudentActionController.class);

	@Autowired
	private DAOStudentInterface da;

	@Autowired
	private DAOLoginInterface daLogin;

	@Autowired
	private DAOEmailInterface daEmail;

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public ModelAndView doInsertGet(@RequestParam("userName") String un) {


		ModelAndView model = new ModelAndView("studentInsert");
		model.addObject("new_student", new Student());
		model.addObject("userName", un);
		return model;
	}

	//

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView doInsertPost(@RequestParam("userName") String un, 
			@ModelAttribute("new_student") Student st)
			throws ParseException {

		String gender = "";
		switch (st.getGender()) {
		case "male":
			gender = "1";
			break;
		case "female":
			gender = "2";
			break;
		case "other":
			gender = "3";
			break;
		}

		st.setGender(gender);

		try {
			da.save(st);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		String url = "redirect:/login/student/list";
		ModelAndView model = new ModelAndView(url);
		model.addObject("userName", un);
		return model;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView doEditGet(@RequestParam("studentId") int stId, @RequestParam("userName") String un,
			@ModelAttribute("edit_student") Student st) {

		String url = "studentEdit";
		Student st1 = da.findById(stId);

		ModelAndView model = new ModelAndView(url);
		model.addObject("userName", un);
		model.addObject("student", st1);

		return model;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView doEditPost(@RequestParam("userName") String un, @ModelAttribute("edit_student") Student st)
			throws ParseException {
		String gender = "";
		switch (st.getGender()) {
		case "male":
			gender = "1";
			break;
		case "female":
			gender = "2";
			break;
		case "other":
			gender = "3";
			break;
		}
		st.setGender(gender);

		st.setUserName(un);
		try {
			da.save(st);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		String url = "redirect:/login/student/list";
		ModelAndView model = new ModelAndView(url);
		model.addObject("userName", un);
		return model;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView doList(@RequestParam("userName") String un,
			@ModelAttribute("listStudent") model.beans.Student st) {
		List<Student> listst = da.findAll();

		String url = "listOfStudents";
		ModelAndView model = new ModelAndView(url);
		model.addObject("userName", un);
		model.addObject("student", listst);

		return model;
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView doSearchGet(@RequestParam("userName") String un,
			@ModelAttribute("listStudent") model.beans.Student st) {

		String url = "searchStudents";
		ModelAndView model = new ModelAndView(url);
		model.addObject("userName", un);

		return model;
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView doSearchPost(@RequestParam("userName") String un,
			@ModelAttribute("listStudent") model.beans.Student st) {
		List<Student> listst = da.searchAll(st.getFirstName(), st.getLastName());

		String url = "listOfStudents";
		ModelAndView model = new ModelAndView(url);
		model.addObject("userName", un);
		model.addObject("student", listst);

		return model;
	}

	@RequestMapping(value = "/email", method = RequestMethod.GET)
	public ModelAndView doEmailGet(@RequestParam("studentId") int stId, @RequestParam("userName") String un,
			@ModelAttribute("email_student") EmailBean em) {
		String url = "studentEmail";
		Student st1 = da.findById(stId);

		LoginSystem lg = daLogin.SelectByID(un);
		
		ModelAndView model = new ModelAndView(url);
		model.addObject("userName", un);
		model.addObject("user", lg);
		model.addObject("student", st1);
		model.addObject("studentemail", em);

		return model;
	}

	@RequestMapping(value = "/email", method = RequestMethod.POST)
	public ModelAndView doEmailPost(@RequestParam("userName") String un, @ModelAttribute("email_student") EmailBean em)
			throws ParseException {
		em.setUsername(un);
		LoginSystem lg = daLogin.SelectByID(un);
		em.setPassword(lg.getPassword());
		try {
			daEmail.emailSend(em, "general");
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		String url = "redirect:/login/student/list";
		ModelAndView model = new ModelAndView(url);
		model.addObject("userName", un);
		return model;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView doEmailGet(@RequestParam("studentId") int stId, @RequestParam("userName") String un)

	{
		String url = "redirect:/login/student/list";
		da.delete(stId);
		ModelAndView model = new ModelAndView(url);

		model.addObject("userName", un);

		return model;
	}

}
