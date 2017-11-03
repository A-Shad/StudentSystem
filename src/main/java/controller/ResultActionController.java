package controller;

import java.text.ParseException;
import java.util.List;

//import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.beans.Course;
import model.beans.EmailBean;
import model.beans.LoginSystem;
import model.beans.Result;
import model.beans.Student;
import model.dao.DAOCourseInterface;
import model.dao.DAOEmailInterface;
import model.dao.DAOLoginInterface;
import model.dao.DAOResultInterface;
import model.dao.DAOStudentInterface;

@Controller
@RequestMapping("login/result")
public class ResultActionController {
	// final static Logger logger = Logger.getLogger(ResultActionController.class);

	@Autowired
	private DAOResultInterface da;

	@Autowired
	private DAOLoginInterface daLogin;
	@Autowired
	private DAOEmailInterface daEmail;

	@Autowired
	private DAOCourseInterface daCourse;

	@Autowired
	private DAOStudentInterface daStudent;

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public ModelAndView doInsertGet(@RequestParam("userName") String un) {

		List<Course> cslist = daCourse.findAll();
		List<Student> stlist = daStudent.findAll();

		ModelAndView model = new ModelAndView("resultInsert");

		model.addObject("courses", cslist);
		model.addObject("students", stlist);
		model.addObject("new_result", new Result());
		model.addObject("userName", un);
		return model;
	}

	//

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView doInsertPost(@RequestParam("userName") String un, @ModelAttribute("new_result") Result rt)
			throws ParseException {
		try {
			rt.getCourse().setCourseId(Integer.valueOf(rt.getCourse().getCourseName())); // getCourseName has courseId
																							// with string format----
																							// because of the error I
																							// had with numeric amount,
																							// I had to trick it in this
																							// way....same applies to
																							// the next line
			rt.getStudent().setStudentId(Integer.valueOf(rt.getStudent().getFirstName()));

			da.save(rt);

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		String url = "redirect:/login/result/list";
		ModelAndView model = new ModelAndView(url);
		model.addObject("userName", un);
		return model;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView doEditGet(@RequestParam("resultId") int rsId, @RequestParam("userName") String un) {

		String url = "resultEdit";
		Result rt1 = da.findById(rsId);

		ModelAndView model = new ModelAndView(url);
		model.addObject("edit_result", new Result());
		model.addObject("userName", un);
		model.addObject("result", rt1);

		return model;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView doEditPost(@RequestParam("userName") String un, @ModelAttribute("edit_result") Result rt)
			throws ParseException {

		rt.getCourse().setCourseId(Integer.valueOf(rt.getCourse().getCourseName())); // getCourseName has courseId with
																						// string format---- because of
																						// the error I had with numeric
																						// amount, I had to trick it in
																						// this way....same applies to
																						// the next line
		rt.getStudent().setStudentId(Integer.valueOf(rt.getStudent().getFirstName()));

		rt.setUserName(un);
		try {
			da.save(rt);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		String url = "redirect:/login/result/list";
		ModelAndView model = new ModelAndView(url);
		model.addObject("userName", un);
		return model;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView doList(@RequestParam("userName") String un,
			@ModelAttribute("listresult") model.beans.Result rt) {

		List<Result> listrt = da.findAll();

		String url = "listOfResults";

		ModelAndView model = new ModelAndView(url);
		model.addObject("userName", un);
		model.addObject("result", listrt);

		return model;
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView doSearchGet(@RequestParam("userName") String un) {

		List<Course> cslist = daCourse.findAll();

		ModelAndView model = new ModelAndView("searchResults");

		model.addObject("courses", cslist);
		model.addObject("search_result", new Result());
		model.addObject("userName", un);
		return model;

	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView doSearchPost(@RequestParam("userName") String un,
			@ModelAttribute("listResult") model.beans.Result rt) {

		rt.getCourse().setCourseId(Integer.valueOf(rt.getCourse().getCourseName()));

		List<Result> listrt = da.searchAllGrades(rt.getCourse().getCourseId(), rt.getSemester(), rt.getYear());

		String url = "listOfResults";
		ModelAndView model = new ModelAndView(url);
		model.addObject("userName", un);
		model.addObject("result", listrt);

		return model;
	}

	@RequestMapping(value = "/email", method = RequestMethod.GET)
	public ModelAndView doEmailGet(@RequestParam("resultId") int rtId, @RequestParam("userName") String un,
			@ModelAttribute("email_result") EmailBean em) {

		String url = "emailResults";
		Result rt1 = da.findById(rtId);

		LoginSystem lg = daLogin.SelectByID(un);
		ModelAndView model = new ModelAndView(url);

		model.addObject("user", lg);
		model.addObject("result", rt1);
		System.out.println("firstname and last name are : " + em.getFirstName() + " " + em.getLastName());
		model.addObject("resultemail", em);

		return model;
	}

	@RequestMapping(value = "/email", method = RequestMethod.POST)
	public ModelAndView doEmailPost(
			// , @ModelAttribute("email_result") EmailBean em)

			@RequestParam("resultId") String resultId, @RequestParam("action") String action,
			@RequestParam("examMidterm") String examMidterm, @RequestParam("examFinal") String examFinal,
			@RequestParam("userName") String userName, @RequestParam("studentId") String studentId,
			@RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName,
			@RequestParam("courseName") String courseName, @RequestParam("emailFrom") String emailFrom,
			@RequestParam("bodyOfEmail") String bodyOfEmail, @RequestParam("titleOfEmail") String titleOfEmail,
			@RequestParam("emailTo") String emailTo, @RequestParam("semester") String semester,
			@RequestParam("year") String year) throws ParseException {

		EmailBean em = new EmailBean();
		em.setCourseName(courseName);
		em.setEmailBody(bodyOfEmail);
		em.setEmailFrom(emailFrom);
		em.setEmailTitle(titleOfEmail);
		em.setEmailTo(emailTo);
		em.setExamFinal(Float.valueOf(examFinal));
		em.setExamMidterm(Float.valueOf(examMidterm));
		em.setFirstName(firstName);
		em.setLastName(lastName);
		em.setSemester(Integer.valueOf(semester));
		em.setStudentId(Integer.valueOf(studentId));
		em.setYear(Integer.valueOf(year));
		em.setUsername(userName);
		LoginSystem lg = daLogin.SelectByID(userName);
		em.setPassword(lg.getPassword());
		try {
			daEmail.emailSend(em, "resultOne");
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		String url = "redirect:/login/result/list";
		ModelAndView model = new ModelAndView(url);
		model.addObject("userName", em.getUsername());
		return model;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView doEmailGet(@RequestParam("resultId") int stId, @RequestParam("userName") String un)

	{
		String url = "redirect:/login/result/list";
		da.delete(stId);
		ModelAndView model = new ModelAndView(url);

		model.addObject("userName", un);

		return model;
	}

}
