package com.losamax.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.losamax.dao.IEvenementJpaRepository;
import com.losamax.dao.IPariJpaRepository;
import com.losamax.dao.IParticipantJpaRepository;
import com.losamax.dao.ISportJpaRepository;
import com.losamax.entities.Client;
import com.losamax.entities.Evenement;
import com.losamax.entities.Sport;

@Controller
@RequestMapping("/admincontroller")
public class AdminController {

	@Autowired
	private ISportJpaRepository sportRepo;
	
	@Autowired
	private IEvenementJpaRepository evenementRepo;
	
	@Autowired
	private IParticipantJpaRepository participantRepo;
	
	@Autowired
	private IPariJpaRepository pariRepo;
	

	@GetMapping("/goToWelcomeAdmin")
	public String goToCreer(Model model) {
//		List<Evenement> evenements = evenementRepo.findAll();
		model.addAttribute("evenement", new Evenement());
		return "bonjouradmin";
	}
}
