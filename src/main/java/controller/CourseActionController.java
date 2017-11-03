package controller;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.beans.Course;
import model.beans.Result;
import model.beans.Student;
import model.dao.DAOCourseInterface;

@Controller
@RequestMapping("login/course")
public class CourseActionController {
	@Autowired
	private DAOCourseInterface da;

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public ModelAndView doInsertGet() {

		ModelAndView model = new ModelAndView("courseInsert");
		model.addObject("new_course", new Course());

		return model;
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView doInsertPost(@ModelAttribute("new_course") Course cs) throws ParseException {
		try {
			da.save(cs);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		String url = "redirect:/login/course/list";
		ModelAndView model = new ModelAndView(url);
		return model;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView doEditGet(@RequestParam("courseId") int csId, @ModelAttribute("edit_course") Course cs) {

		String url = "courseEdit";
		Course cs1 = da.findById(csId);

		ModelAndView model = new ModelAndView(url);
		model.addObject("course", cs1);

		return model;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView doEditPost(@ModelAttribute("edit_course") Course cs) throws ParseException {

		try {
			da.save(cs);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		String url = "redirect:/login/course/list";
		ModelAndView model = new ModelAndView(url);
		return model;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView doList(@ModelAttribute("listCourse") model.beans.Course cs) {
		List<Course> listcs = da.findAll();

		String url = "listOfCourses";
		ModelAndView model = new ModelAndView(url);
		model.addObject("course", listcs);

		return model;
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView doSearchGet(@ModelAttribute("listCourse") model.beans.Course cs) {

		String url = "searchCourses";
		ModelAndView model = new ModelAndView(url);

		return model;
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView doSearchPost(@ModelAttribute("listCourse") model.beans.Course cs) {
		// System.out.println("Course is :" + cs.getCourseName());
		List<Course> listcs = da.searchAll(cs.getCourseName());

		String url = "listOfCourses";
		ModelAndView model = new ModelAndView(url);
		model.addObject("course", listcs);

		return model;

	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView doEmailGet(@RequestParam("courseId") int csId)

	{
		String url = "redirect:/login/course/list";
		da.delete(csId);
		ModelAndView model = new ModelAndView(url);

		return model;
	}

}
