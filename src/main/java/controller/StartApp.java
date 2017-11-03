/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.beans.LoginSystem;

/**
 *
 * @author Arash
 */
@Controller
public class StartApp {
	@RequestMapping("/")
	public ModelAndView startupApp() {
		ModelAndView model = new ModelAndView("index");
		model.addObject("new_user", new LoginSystem());
		return model;
	}
}
