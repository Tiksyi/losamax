package com.losamax.entities;


import java.util.Objects;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Sport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String nom;
	
	public Sport() {
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

	public String toString() {
		return nom;
	}
	
	@Override
	public boolean equals (Object obj) {
		if (this==obj) {
			return true;
		}
		if (!(obj instanceof Sport)) {
			return false;
		}
		Sport other= (Sport) obj;
		return nom.equals(other.nom);
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(nom);
	}
	
}
