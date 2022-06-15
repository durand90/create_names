package com.fanfan.exam.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.fanfan.exam.models.Gender;
import com.fanfan.exam.services.GenderService;

@Controller
public class GenderController {
	
	@Autowired
	GenderService genServ;
	
	@GetMapping("/gender/create")
	public String genderCreate(@ModelAttribute("genders") Gender gender) {
		return "genders/gender.jsp";
	}
	
	@PostMapping("/gender/made")
	public String genderMade(@Valid @ModelAttribute("genders") Gender gender,
								BindingResult result) {
		if(result.hasErrors()) {
			return "genders/gender.jsp";
		} else {
			genServ.createGender(gender);
			return "redirect:/gender/create";
		}
		
	}
	

}
