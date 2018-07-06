package com.losamax.controllers;

import java.util.List;

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

import com.losamax.dao.IClientJpaRepository;
import com.losamax.dao.ISportJpaRepository;
import com.losamax.entities.Client;
import com.losamax.entities.Sport;

@Controller
@RequestMapping("/clientcontroller")
public class ClientController {

	@Autowired
	private ISportJpaRepository sportRepo;

	@Autowired
	private IClientJpaRepository clientRepo;

	@GetMapping("/goToCreer")
	public String goToCreer(Model model) {
		List<Sport> sports = sportRepo.findAll();
		model.addAttribute("client", new Client());
		model.addAttribute("sports", sports);
		return "creerClient";
	}

	@PostMapping("/creer")
	public String creer(@Valid @ModelAttribute(value = "client") Client client, BindingResult result, Model model) {
		if (!result.hasErrors()) {
			// encodePassword(client);
			clientRepo.save(client);
			return "confirmationCreation";
		}
		List<Sport> sports = sportRepo.findAll();
		model.addAttribute("sports", sports);
		return "creerClient";
	}

	@GetMapping("/goToLogin")
	public String login() {
		return "login";
	}

	@GetMapping(value = { "/contact", "/contact?lang={code}" })
	public String contact(@PathVariable(value = "code", required = false) String code, Model model) {
		if(code == "fr") {
			model.addAttribute("nom","Entrez votre nom");
			model.addAttribute("email","Entrez votre email");
			model.addAttribute("message","Saisissez votre message ici ...");
		}
		if(code == "en") {
			model.addAttribute("nom","Enter your name");
			model.addAttribute("email","Enter your email");
			model.addAttribute("message","Please enter your message here...");
		}
		return "contact";
	}

	@GetMapping("/parier")
	public String parier() {
		return "parier";
	}

}
