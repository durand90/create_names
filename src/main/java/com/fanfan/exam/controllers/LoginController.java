package com.fanfan.exam.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.fanfan.exam.models.LoginUser;
import com.fanfan.exam.models.User;
import com.fanfan.exam.services.UserService;

@Controller
public class LoginController {
	
	@Autowired
	UserService userServ;
	
	@GetMapping("/users")
	public String newUser(Model model) {
		
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new  LoginUser());
		return "/users/users.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser,
							BindingResult result, Model model, HttpSession sess) {
		
		
		
		userServ.register(newUser, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "users/users.jsp";
		} else {
			sess.setAttribute("user_id", newUser.getId());
			return "redirect:/home";
		}
	}
	
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser login, 
						BindingResult result, Model model, HttpSession sess) {
		
		User user = userServ.login(login, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "users/users.jsp";
		
		} else {
			sess.setAttribute("user_id", user.getId());
			return "redirect:/home";
		}
		
	}
	
	
	
	@GetMapping("/logout")
	public String logOut(HttpSession sess) {
		sess.invalidate();
		return "redirect:/users";
	}

}
