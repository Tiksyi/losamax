package com.losamax.controllers;

import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.losamax.dao.ICoteJpaRepository;
import com.losamax.dao.IEvenementJpaRepository;
import com.losamax.dao.IPariJpaRepository;
import com.losamax.dao.IParticipantJpaRepository;
import com.losamax.dao.ISportJpaRepository;
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
		List<Participant> participants = participantRepo.findAll();
		List<Cote> cotes = coteRepo.findAll();
		model.addAttribute("evenements", evenements);
		model.addAttribute("participants", participants);
		model.addAttribute("cotes", cotes);
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
	public String creerParticipant(@ModelAttribute(value = "participant") Participant participant,
			@ModelAttribute(value = "cote") Cote cote, Model model) {
		List<Sport> sports = sportRepo.findAll();
		model.addAttribute("sports", sports);
		participantRepo.save(participant);
		return "creerparticipant";
	}

	@PostMapping("/creerCote")
	public String creerCote(@ModelAttribute(value = "participant") Participant participant,
			@ModelAttribute(value = "cote") Cote cote, Model model) {
		List<Sport> sports = sportRepo.findAll();
		model.addAttribute("sports", sports);
		coteRepo.save(cote);
		return "creerparticipant";
	}
	@GetMapping("/goToCreerEvenement")
	public String goToCreerEvenement(Model model) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");

		List<Participant> participants = participantRepo.findAll();
		List<Sport> sports = sportRepo.findAll();
		List<Cote> cotes = coteRepo.findAll();
		model.addAttribute("sports", sports);
		model.addAttribute("cotes", cotes);
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
		List<Cote> cotes = coteRepo.findAll();
		model.addAttribute("sports", sports);
		model.addAttribute("cotes", cotes);
		model.addAttribute("participants", participants);
		evenementRepo.save(evenement);
		return "creerEvenement";
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
