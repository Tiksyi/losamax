package com.losamax.controllers;

import javax.transaction.Transactional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/paricontroller")
@Transactional
public class PariController {
	
	@GetMapping("/goToMenu")
	public String gotomenu() {
		return "accueil";
	}

}
