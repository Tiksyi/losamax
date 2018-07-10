package com.losamax.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.losamax.dao.ICoteJpaRepository;
import com.losamax.dao.IEvenementJpaRepository;
import com.losamax.dao.IPariJpaRepository;
import com.losamax.dao.IParticipantJpaRepository;
import com.losamax.dao.ISportJpaRepository;
import com.losamax.entities.Client;
import com.losamax.entities.Cote;
import com.losamax.entities.Evenement;
import com.losamax.entities.Participant;
import com.losamax.entities.Sport;

@Controller
@RequestMapping("/admincontroller")
public class AdminController {

	@Autowired
	private ISportJpaRepository sportRepo;

	@Autowired
	private ICoteJpaRepository coteRepo;

	@Autowired
	private IEvenementJpaRepository evenementRepo;

	@Autowired
	private IParticipantJpaRepository participantRepo;

	@Autowired
	private IPariJpaRepository pariRepo;

	@GetMapping("/goToAdmin")
	public String goToCreer(Model model) {
		List<Evenement> evenements = evenementRepo.findAll();
		model.addAttribute("evenements", evenements);
		return "bonjouradmin";
	}

	@GetMapping("/goToCreerParticipant")
	public String goToCreerParticipant(Model model) {
		List<Sport> sports = sportRepo.findAll();
		model.addAttribute("participant", new Participant());
		model.addAttribute("sports", sports);
		model.addAttribute("cote", new Cote());
		return "creerparticipant";
	}

	@PostMapping("/creerParticipant")
	public String creerParticipant(@ModelAttribute(value = "participant") Participant participant, Model model) {
		List<Sport> sports = sportRepo.findAll();
		model.addAttribute("sports", sports);
		participantRepo.save(participant);
		return "creerparticipant";
	}

	@GetMapping("/goToCreerEvenement")
	public String goToCreerEvenement(Model model) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
		List<Participant> participants = participantRepo.findAll();
		List<Sport> sports = sportRepo.findAll();
		model.addAttribute("sports", sports);
		model.addAttribute("participants", participants);
		model.addAttribute("evenement", new Evenement());
		model.addAttribute("datedebut", dateFormat.format(new Date()));
		model.addAttribute("datefin", dateFormat.format(new Date()));
		return "creerEvenement";		
	}
	
	@PostMapping("/creerEvenement")
	public String creerEvenement(@ModelAttribute(value = "evenement") Evenement evenement,
		 Model model) {
		List<Participant> participants = participantRepo.findAll();
		List<Sport> sports = sportRepo.findAll();
		model.addAttribute("sports", sports);
		model.addAttribute("participants", participants);
		evenementRepo.save(evenement);
		Evenement e = evenementRepo.findByNom(evenement.getNom());
		return "redirect:/admincontroller/goToCreerCote/" + e.getId();
	}
	
	@GetMapping("/goToCreerCote/{id}")
	public String goToCreerCote(@PathVariable("id") Long id, Model model) {
		model.addAttribute("evenementId", id);
		Cote cote= new Cote();
		model.addAttribute(cote);
		return "creerCote";
	}
	
	@PostMapping("/creerCote")
	public String creerCote(@RequestParam(name="evenementId") Long evenementId, @ModelAttribute(value = "cote") Cote cote, Model model) {
		System.out.println(evenementId);
		Evenement originEvenement = evenementRepo.getOne(evenementId);
		originEvenement.getCotes().add(cote);
		evenementRepo.save(originEvenement);
		model.addAttribute("evenementId", evenementId);
		return "creerCote";
	}
	
	@InitBinder
    protected void initBinder(WebDataBinder binder) {
    	binder.registerCustomEditor(List.class, "participants", new CustomCollectionEditor(List.class){
    		@Override
    		protected Object convertElement(Object element) {
    			Long id=null;
    			if (element instanceof String) {
    				id=Long.valueOf((String) element);
    			} else if (element instanceof Long) {
    				id = (Long) element;
    			}
    			return id != null ? participantRepo.getOne(id) : null;
    		}
    	});
       	binder.registerCustomEditor(List.class, "cotes", new CustomCollectionEditor(List.class){
    		@Override
    		protected Object convertElement(Object element) {
    			Long id=null;
    			if (element instanceof String) {
    				id=Long.valueOf((String) element);
    			} else if (element instanceof Long) {
    				id = (Long) element;
    			}
    			return id != null ? coteRepo.getOne(id) : null;
    		}
    	});
    }
}
