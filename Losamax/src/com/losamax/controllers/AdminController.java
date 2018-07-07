package com.losamax.controllers;

import java.util.Date;
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

import com.losamax.dao.IEvenementJpaRepository;
import com.losamax.dao.IPariJpaRepository;
import com.losamax.dao.IParticipantJpaRepository;
import com.losamax.dao.ISportJpaRepository;
import com.losamax.entities.Client;
import com.losamax.entities.Evenement;
import com.losamax.entities.Participant;
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
		List<Evenement> evenements = evenementRepo.findAll();
		for (Evenement e : evenements)
		{
			e.setDateDebut(new Date());
			e.setDateFin(new Date());
		}
		model.addAttribute("evenements", evenements);
		return "bonjouradmin";
	}
	@GetMapping("/goToCreerParticipant")
	public String goToCreerParticipant(Model model) {
		List<Sport> sports = sportRepo.findAll();
		model.addAttribute("participant", new Participant());
		model.addAttribute("sports", sports);
		return "creerparticipant";
	}
	@PostMapping("/creerParticipant")
	public String creerParticipant( @ModelAttribute(value = "participant") Participant participant, Model model) {
		List<Sport> sports = sportRepo.findAll();
		model.addAttribute("sports", sports);
		participantRepo.save(participant);
		return "creerparticipant";
	}

}
