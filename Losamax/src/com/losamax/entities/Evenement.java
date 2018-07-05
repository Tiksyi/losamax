package com.losamax.entities;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Evenement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
    @OneToMany
	private List<Participant> participants;
	private Date dateDebut;
	private Date dateFin;
	private HashMap cotes;
	private String resultatFinal;

	public Evenement() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public HashMap getCotes() {
		return cotes;
	}

	public void setCotes(HashMap cotes) {
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
