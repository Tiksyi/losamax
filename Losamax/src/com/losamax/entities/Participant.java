package com.losamax.entities;

import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Participant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String nom;
	@OneToOne 
	private Sport sport;
	
	public Participant() {
	}
	@Override
	public boolean equals (Object obj) {
		if (this==obj) {
			return true;
		}
		if (!(obj instanceof Participant)) {
			return false;
		}
		Participant other= (Participant) obj;
		return nom.equals(other.nom);
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(nom);
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

	public Sport getSport() {
		return sport;
	}

	public void setSport(Sport sport) {
		this.sport = sport;
	}

	public String toString() {
		return "Participant [id=" + id + ", nom=" + nom + ", sport=" + sport + "]";
	}
	
	
}
