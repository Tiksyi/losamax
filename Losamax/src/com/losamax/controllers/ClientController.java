package com.losamax.controllers;

import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.losamax.dao.IClientJpaRepository;
import com.losamax.dao.IEvenementJpaRepository;
import com.losamax.dao.IPariJpaRepository;
import com.losamax.dao.ISportJpaRepository;
import com.losamax.entities.Client;
import com.losamax.entities.Evenement;
import com.losamax.entities.Cote;
import com.losamax.entities.Participant;
import com.losamax.entities.Sport;

@Controller
@RequestMapping("/clientcontroller")
public class ClientController {

	@Autowired
	private ISportJpaRepository sportRepo;

	@Autowired
	private IClientJpaRepository clientRepo;
	
	@Autowired 
	private IEvenementJpaRepository evenementRepo;
	
	@Autowired
	private IPariJpaRepository pariRepo;

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
	
    @GetMapping("/goToModifier/{id}")
    public String goToModifier(@PathVariable("id") Long id, Model model) {
	Client client = clientRepo.getOne(id);
	model.addAttribute("client", client);
	List<Sport> sports = sportRepo.findAll();
	model.addAttribute("sports", sports);
	return "modifierClient";
    }

    @PostMapping("/modifier")
    public String modifier(
	    @Valid @ModelAttribute(value = "client") Client client,
	    BindingResult result, Model model) {
	if (!result.hasErrors()) {
	    //encodePassword(client);
	    clientRepo.save(client);
	    return "confirmationModification";
	}
	List<Sport> sports = sportRepo.findAll();
	model.addAttribute("sports", sports);
	return "modifierClient";
}
	
//	@GetMapping("/goToCreerPari")
//	public String goToCreerPari(Model model) {
//		model.addAttribute("participant", new Participant());
//		model.addAttribute("sports", sports);
//		model.addAttribute("cote", new Cote());
//		return "creerpari";
//	}
//
//	@PostMapping("/creerPari")
//	public String creerPari(@ModelAttribute(value = "participant") Participant participant,
//			@ModelAttribute(value = "cote") Cote cote, Model model) {
//		List<Sport> sports = sportRepo.findAll();
//		model.addAttribute("sports", sports);
//		participantRepo.save(participant);
//		return "creerpari";
//	}
    
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
    	binder.registerCustomEditor(List.class, "listeSports", new CustomCollectionEditor(List.class){
    		@Override
    		protected Object convertElement(Object element) {
    			Long id=null;
    			if (element instanceof String) {
    				id=Long.valueOf((String) element);
    			} else if (element instanceof Long) {
    				id = (Long) element;
    			}
    			return id != null ? sportRepo.getOne(id) : null;
    		}
    	});
    }

    private static void encodePassword(Client client) {
	String rawPassword = client.getCredentials().getPassword();
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	String encodedPassword = encoder.encode(rawPassword);
	client.getCredentials().setPassword(encodedPassword);
}
}
