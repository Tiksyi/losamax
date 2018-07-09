package com.losamax.entities;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Cote {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String libelle;
	private double valeur;
	
	
	public Cote() {
	
	}
	@Override
	public boolean equals (Object obj) {
		if (this==obj) {
			return true;
		}
		if (!(obj instanceof Cote)) {
			return false;
		}
		Cote other= (Cote) obj;
		return libelle.equals(other.libelle);
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(libelle);
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getLibelle() {
		return libelle;
	}
	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}
	public double getValeur() {
		return valeur;
	}
	public void setValeur(double valeur) {
		this.valeur = valeur;
	}
	
	
	

}
