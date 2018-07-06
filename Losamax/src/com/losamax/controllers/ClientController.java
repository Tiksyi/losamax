package com.losamax.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	    public String creer(
		   @Valid @ModelAttribute(value = "client") Client client, BindingResult result, Model model) {
		if (!result.hasErrors()) {
		    //encodePassword(client);
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
	 
}
