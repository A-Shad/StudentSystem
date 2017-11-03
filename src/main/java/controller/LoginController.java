 package controller;

import model.beans.LoginSystem;
import model.dao.DAOLoginInterface;
import org.hibernate.ObjectNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.apache.log4j.Logger;
@Controller
@RequestMapping("/login")
public class LoginController {
	final static Logger logger = Logger.getLogger(LoginController.class);
    @Autowired
    private DAOLoginInterface da;
    
    @RequestMapping(value = "/signout", method=RequestMethod.GET)
    public ModelAndView doSignOut() {
    	String url = "redirect:/";
    	ModelAndView model = new ModelAndView(url);
    	return model;
    }

    @RequestMapping(value = "/signup", method=RequestMethod.POST)
    public ModelAndView doSignup(
            @ModelAttribute("new_user") LoginSystem log) {
        try {
            da.insert(log);
        } catch (ObjectNotFoundException|ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        String url = "redirect:/";
        ModelAndView model = new ModelAndView(url);
        return model;
    }
    
    @RequestMapping(value="/process", method=RequestMethod.POST)
    public ModelAndView doLogin(
            @RequestParam("userName") String un,
            @RequestParam("password") String pass) {
        String url = "redirect:/";
        LoginSystem lg = null;
        try {
            lg = da.SelectByID(un);
            if (lg != null && lg.getPassword().equals(pass)) {
                url = "welcome";
            }
        } catch (ObjectNotFoundException ex) { }
    
        ModelAndView model = new ModelAndView(url);
        if (url.equals("welcome")) {
            model.addObject("user", lg);
        }
     
        return model;
    }
}
