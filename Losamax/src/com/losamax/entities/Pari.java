package com.losamax.entities;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Pari {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@OneToOne
	private Client client;
	@OneToOne (cascade = CascadeType.PERSIST)
	private Evenement evenement;
	private double mise;
	private String choix;

	public Pari() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public Evenement getEvenement() {
		return evenement;
	}

	public void setEvenement(Evenement evenement) {
		this.evenement = evenement;
	}

	public double getMise() {
		return mise;
	}

	public void setMise(double mise) {
		this.mise = mise;
	}

	public String getChoix() {
		return choix;
	}

	public void setChoix(String choix) {
		this.choix = choix;
	}

	public String toString() {
		return "Pari [client=" + client + ", evenement=" + evenement + ", mise=" + mise + ", choix=" + choix + "]";
	}

}
