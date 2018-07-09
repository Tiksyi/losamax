package com.losamax.entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Evenement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
    private String nom;
    @ManyToMany
	private List<Participant> participants = new ArrayList<>();
	private Date dateDebut;
	private Date dateFin;
	@ManyToMany
	private List<Cote> cotes = new ArrayList<>();
	
	private String resultatFinal;

	public Evenement() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public List<Participant> getParticipants() {
		return participants;
	}

	public void setParticipants(List<Participant> participants) {
		this.participants = participants;
	}

	public Date getDateDebut() {
		return dateDebut;
	}

	public void setDateDebut(Date dateDebut) {
		this.dateDebut = dateDebut;
	}

	public Date getDateFin() {
		return dateFin;
	}

	public void setDateFin(Date dateFin) {
		this.dateFin = dateFin;
	}

	

	public List<Cote> getCotes() {
		return cotes;
	}

	public void setCotes(List<Cote> cotes) {
		this.cotes = cotes;
	}

	public String getResultatFinal() {
		return resultatFinal;
	}

	public void setResultatFinal(String resultatFinal) {
		this.resultatFinal = resultatFinal;
	}

	public String toString() {
		return "Evenement [participants=" + participants + ", dateDebut=" + dateDebut + ", dateFin=" + dateFin
				+ ", cotes=" + cotes + ", resultatFinal=" + resultatFinal + "]";
	}

}
