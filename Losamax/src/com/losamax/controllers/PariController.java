package com.losamax.controllers;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.losamax.dao.IAdminJpaRepository;
import com.losamax.dao.IClientJpaRepository;
import com.losamax.dao.ICoteJpaRepository;
import com.losamax.dao.ICredentialsJpaRepository;
import com.losamax.dao.IEvenementJpaRepository;
import com.losamax.dao.IPariJpaRepository;
import com.losamax.dao.IParticipantJpaRepository;
import com.losamax.dao.ISportJpaRepository;
import com.losamax.entities.Client;
import com.losamax.entities.Credentials;
import com.losamax.entities.Evenement;
import com.losamax.entities.Pari;
import com.losamax.entities.Sport;

@Controller
@RequestMapping("/paricontroller")
@Transactional
public class PariController {

	@Autowired
	IClientJpaRepository clientRepo;
	
	@Autowired
	IAdminJpaRepository adminRepo;
	
	@Autowired
	ISportJpaRepository sportRepo;

	@Autowired
	IEvenementJpaRepository eventRepo;

	@Autowired
	IParticipantJpaRepository partiRepo;
	
	@Autowired
	ICoteJpaRepository coteRepo;
	
	@Autowired
	ICredentialsJpaRepository credRepo;
	
	@Autowired
	private IPariJpaRepository pariRepo;

	@GetMapping("/goToMenu")
	public String gotomenu(Model model) {
//		//Creation Client
//		Credentials cred1 = new Credentials();
//		cred1.setUsername("user");
//		cred1.setPassword("123");
//		cred1.setRole(ERole.ROLE_USER);
//		encodePassword(cred1);
//		
//		Credentials cred2 = new Credentials();
//		cred2.setUsername("admin");
//		cred2.setPassword("123");
//		cred2.setRole(ERole.ROLE_ADMIN);
//		encodePassword(cred2);
//		
//		Client client = new Client();
//		client.setCredentials(cred1);
//		client.setNom("Rodriguez");
//		client.setPrenom("Mathieu");
//		
//		
//		Admin admin = new Admin();
//		admin.setCredentials(cred2);
//		admin.setNom("Vassal");
//		admin.setPrenom("Franck");
//		
//		credRepo.save(cred2);
//				
//		adminRepo.save(admin);
//	
//		
//		
//		// Creation sport
//		Sport s1 = new Sport();
//		s1.setNom("football");
//		Sport s2 = new Sport();
//		Sport s3 = new Sport();
//		s3.setNom("basketball");
//		Sport s4 = new Sport();
//		s4.setNom("cyclisme");
//		sportRepo.save(s1);
//		sportRepo.save(s2);
//		sportRepo.save(s3);
//		sportRepo.save(s4);
//		
//		//creation participants
//		Participant p1 = new Participant();
//		p1.setNom("france");
//		p1.setSport(s1);
//		Participant p2 = new Participant();
//		p2.setNom("uruguay");
//		p2.setSport(s1);
//		Participant p3 = new Participant();
//		p3.setNom("suede");
//		p3.setSport(s1);
//		Participant p4 = new Participant();
//		p4.setNom("angleterre");
//		p4.setSport(s1);
//		Participant p5 = new Participant();
//		p5.setNom("bresil");
//		p5.setSport(s1);
//		Participant p6 = new Participant();
//		p6.setNom("belgique");
//		p6.setSport(s1);
//		Participant p7 = new Participant();
//		p7.setNom("croatie");
//		p7.setSport(s1);
//		Participant p8 = new Participant();
//		p8.setNom("russie");
//		p8.setSport(s1);
//		//rugby
//		Participant p9 = new Participant();
//		p9.setNom("stade toulousain");
//		p9.setSport(s2);
//		Participant p10 = new Participant();
//		p10.setNom("toulon");
//		p10.setSport(s2);
//		Participant p11 = new Participant();
//		p11.setNom("racing 92");
//		p11.setSport(s2);
//		Participant p12 = new Participant();
//		p12.setNom("castres olympique");
//		p12.setSport(s2);
//		// basketball
//		Participant p13 = new Participant();
//		p13.setNom("cska moscou");
//		p13.setSport(s3);
//		Participant p14 = new Participant();
//		p14.setNom("barcelone");
//		p14.setSport(s3);
//		Participant p15 = new Participant();
//		p15.setNom("olympiakos");
//		p15.setSport(s3);
//		Participant p16 = new Participant();
//		p16.setNom("real madrid");
//		p16.setSport(s3);
//		partiRepo.save(p1);
//		partiRepo.save(p2);
//		partiRepo.save(p3);
//		partiRepo.save(p4);
//		partiRepo.save(p5);
//		partiRepo.save(p6);
//		partiRepo.save(p7);
//		partiRepo.save(p8);
//		partiRepo.save(p9);
//		partiRepo.save(p10);
//		partiRepo.save(p11);
//		partiRepo.save(p12);
//		partiRepo.save(p13);
//		partiRepo.save(p14);
//		partiRepo.save(p15);
//		partiRepo.save(p16);
//		// creation cotes
//		Cote c1 = new Cote();
//		c1.setLibelle("1");
//		c1.setValeur(1.58);
//		Cote c2 = new Cote();
//		c2.setLibelle("N");
//		c2.setValeur(3.25);
//		Cote c3 = new Cote();
//		c3.setLibelle("2");
//		c3.setValeur(3);
//		List<Cote> lc = new ArrayList<Cote>();
//		lc.add(c1);
//		lc.add(c2);
//		lc.add(c3);
//		coteRepo.save(c1);
//		coteRepo.save(c2);
//		coteRepo.save(c3);
//		// creation evenement
//		List<Participant> lp1 = new ArrayList<Participant>();
//		lp1.add(p1);
//		lp1.add(p2);
//		Date d = new Date();
//		d.getTime();
//		Evenement e1 = new Evenement();
//		e1.setCotes(lc);
//		e1.setNom("Quart A");
//		e1.setParticipants(lp1);
//		e1.setDateDebut(d);
//		e1.setDateFin(d);
//		List<Participant> lp2 = new ArrayList<Participant>();
//		lp2.add(p3);
//		lp2.add(p4);
//		Evenement e2 = new Evenement();
//		e2.setCotes(lc);
//		e2.setNom("Quart B");
//		e2.setParticipants(lp2);
//		e2.setDateDebut(d);
//		e2.setDateFin(d);
//		List<Participant> lp3 = new ArrayList<Participant>();
//		lp3.add(p5);
//		lp3.add(p6);
//		Evenement e3 = new Evenement();
//		e3.setCotes(lc);
//		e3.setNom("Quart C");
//		e3.setParticipants(lp3);
//		e3.setDateDebut(d);
//		e3.setDateFin(d);
//		List<Participant> lp4 = new ArrayList<Participant>();
//		lp4.add(p7);
//		lp4.add(p8);
//		Evenement e4 = new Evenement();
//		e4.setCotes(lc);
//		e4.setNom("Quart D");
//		e4.setParticipants(lp4);
//		e4.setDateDebut(d);
//		e4.setDateFin(d);
//		List<Participant> lp5 = new ArrayList<Participant>();
//		lp5.add(p9);
//		lp5.add(p10);
//		Evenement e5 = new Evenement();
//		e5.setCotes(lc);
//		e5.setNom("Match A");
//		e5.setParticipants(lp5);
//		e5.setDateDebut(d);
//		e5.setDateFin(d);
//		List<Participant> lp6 = new ArrayList<Participant>();
//		lp6.add(p11);
//		lp6.add(p12);
//		Evenement e6 = new Evenement();
//		e6.setCotes(lc);
//		e6.setNom("Match B");
//		e6.setParticipants(lp6);
//		e6.setDateDebut(d);
//		e6.setDateFin(d);
//		List<Participant> lp7 = new ArrayList<Participant>();
//		lp7.add(p13);
//		lp7.add(p14);
//		Evenement e7 = new Evenement();
//		e7.setCotes(lc);
//		e7.setNom("Euro A");
//		e7.setParticipants(lp7);
//		e7.setDateDebut(d);
//		e7.setDateFin(d);
//		List<Participant> lp8 = new ArrayList<Participant>();
//		lp8.add(p15);
//		lp8.add(p16);
//		Evenement e8 = new Evenement();
//		e8.setCotes(lc);
//		e8.setNom("Euro B");
//		e8.setParticipants(lp8);
//		e8.setDateDebut(d);
//		e8.setDateFin(d);
//		eventRepo.save(e1);
//		eventRepo.save(e2);
//		eventRepo.save(e3);
//		eventRepo.save(e4);
//		eventRepo.save(e5);
//		eventRepo.save(e6);
//		eventRepo.save(e7);
//		eventRepo.save(e8);
		
		
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
	
	@PostMapping("/supprimerPari/{id}")
	public String compte(@PathVariable(value = "id") Long id, Model model) {
		
		pariRepo.deleteById(id);;
//		List<Pari> lpari = pariRepo.findByClientId(client.getId());
//		model.addAttribute("listeParis", lpari);
		return "redirect:/clientcontroller/compte/{username}";
	}
	
	private static void encodePassword(Credentials client) {
		String rawPassword = client.getPassword();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPassword = encoder.encode(rawPassword);
		client.setPassword(encodedPassword);
	}

}
