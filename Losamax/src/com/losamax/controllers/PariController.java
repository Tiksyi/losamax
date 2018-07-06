package com.losamax.controllers;

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

import com.losamax.dao.ISportJpaRepository;
import com.losamax.entities.Sport;

@Controller
@RequestMapping("/paricontroller")
@Transactional
public class PariController {
	
	@Autowired
	ISportJpaRepository sportRepo;
	
	@GetMapping("/goToMenu")
	public String gotomenu(Model model) {
		List<Sport> lsport = sportRepo.findAll();
		model.addAttribute("listeSports", lsport);
		return "accueil";
	}
	
	@GetMapping("/{nom}")
	public String gotorubrique(@PathVariable(value = "nom") String nom, Model model) {
		List<Sport> lsport = sportRepo.findAll();
		Sport s = sportRepo.findByNom(nom);
		model.addAttribute("listeSports", lsport);
		model.addAttribute("nom", nom);
		model.addAttribute("id", s.getId());
		return "rubrique";
	}

}
