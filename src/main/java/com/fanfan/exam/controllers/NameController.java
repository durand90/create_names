package com.fanfan.exam.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fanfan.exam.models.Gender;
import com.fanfan.exam.models.Name;
import com.fanfan.exam.models.User;
import com.fanfan.exam.services.GenderService;
import com.fanfan.exam.services.NameService;
import com.fanfan.exam.services.UserService;

@Controller
public class NameController {
	
	@Autowired
	NameService nameServ;
	@Autowired
	GenderService genServ;
	@Autowired
	UserService userServ;
	
	@GetMapping("/home")
	public String home(Model model, HttpSession sess) {
		
		Long userId = (Long) sess.getAttribute("user_id");
		if(userId == null) {
			return "redirect:/users";
		} else {
			User thisUser = userServ.findOne(userId);
			model.addAttribute("thisUser", thisUser);
			List<Name> all = nameServ.allNames();
			model.addAttribute("all", all);
			return "/names/names.jsp";
		}
	}
	
	@GetMapping("/names/create")
	public String namesCreate(@ModelAttribute("names") Name name, Model model, HttpSession sess) {
		
		
		Long userId = (Long) sess.getAttribute("user_id");
		if(userId == null) {
			return "redirect:/users";
		} else {
			
			User loggedInUser = userServ.findOne(userId);
			model.addAttribute("loggedInUser", loggedInUser);
			
			List<Gender> allGens = genServ.allGenders();
			model.addAttribute("allGens", allGens);
			return "names/namesCreate.jsp";
		}
	}
	
	@PostMapping("/names/made")
	public String namesMade(@Valid @ModelAttribute("names") Name namess,
								BindingResult result) {
		if(result.hasErrors()){
			return "names/namesCreate.jsp";
		} else {
			nameServ.createName(namess);
			return "redirect:/home";
		}
	}
	
	@GetMapping("/names/{id}/edit")
	public String namesEdit(@PathVariable("id") Long id, Model model) {
		
		
		List<Gender> allGens = genServ.allGenders();
		model.addAttribute("allGens", allGens);
		Name oneName = nameServ.findName(id);
		model.addAttribute("oneName", oneName);
		return "names/namesEdit.jsp";
	}
	
	@RequestMapping("/names/{id}/update")
	public String namesUpdate(@Valid @ModelAttribute("oneName") Name Namess,
								BindingResult result, Model model) {
		if(result.hasErrors()) {
			List<Gender> allGens = genServ.allGenders();
			model.addAttribute("allGens", allGens);
			return "names/namesEdit.jsp";
		} else {
			nameServ.updateName(Namess);
			return "redirect:/home";
		}
		
	}
	
	@RequestMapping("/names/{id}/show")
	public String namesShow(@PathVariable("id") Long id, Model model) {

		Name oneName = nameServ.findName(id);
		model.addAttribute("oneName", oneName);
		return "names/namesShow.jsp";
	}
	
	@RequestMapping("/names/{id}/delete")
	public String delete(@PathVariable("id") Long id) {
		nameServ.deleteName(id);
		return "redirect:/home";
		
	}

}
