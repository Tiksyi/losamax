package com.losamax.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.losamax.dao.IEvenementJpaRepository;
import com.losamax.dao.IParticipantJpaRepository;
import com.losamax.dao.ISportJpaRepository;
import com.losamax.entities.Evenement;
import com.losamax.entities.Participant;
import com.losamax.entities.Sport;

@Controller
@RequestMapping("/paricontroller")
@Transactional
public class PariController {

	@Autowired
	ISportJpaRepository sportRepo;

	@Autowired
	IEvenementJpaRepository eventRepo;

	@Autowired
	IParticipantJpaRepository partiRepo;

	@GetMapping("/goToMenu")
	public String gotomenu(Model model) {
		List<Sport> lsport = sportRepo.findAll();
		List<Evenement> levent = eventRepo.findByEvenementUnique();
		model.addAttribute("listeEvents", levent);
		model.addAttribute("listeSports", lsport);
		return "accueil";
	}

	@GetMapping("/{nom}")
	public String gotorubrique(@PathVariable(value = "nom") String nom, Model model) {
		List<Sport> lsport = sportRepo.findAll();
		// List<Participant> lpart = partiRepo.findAll();
		Sport s = sportRepo.findByNom(nom);
		// model.addAttribute("listePartis", lpart);
		model.addAttribute("listeSports", lsport);
		model.addAttribute("nom", s.getNom());
		model.addAttribute("id", s.getId());
		List<Evenement> levent = eventRepo.findByParticipantsSportId(s.getId());
		model.addAttribute("listeEvents", levent);
		return "rubrique";
	}

}
