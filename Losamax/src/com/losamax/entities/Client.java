package com.losamax.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Entity
public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
    @Valid
    @OneToOne(cascade=CascadeType.ALL)
	private Credentials credentials;
    @NotEmpty(message = "{error.nom.obligatoire}")
	private String nom;
    @NotEmpty(message = "{error.prenom.obligatoire}")
	private String prenom;
    @NotEmpty(message = "{error.mail.obligatoire}")
    @Email(message = "{error.mail.format}")
	private String mail;
    @Min(value=18, message = "{error.age}")
	private int age;
    
	private String adresse;
	private String telFix;
	private String telMobile;
	@ManyToMany
	private List<Sport> listeSports = new ArrayList<>();
	@Min(value=1,message = "{error.miseMax.obligatoire}")
	private double miseMax;
	private double solde;

	public Client() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Credentials getCredentials() {
		return credentials;
	}

	public void setCredentials(Credentials credentials) {
		this.credentials = credentials;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getTelFix() {
		return telFix;
	}

	public void setTelFix(String telFix) {
		this.telFix = telFix;
	}

	public String getTelMobile() {
		return telMobile;
	}

	public void setTelMobile(String telMobile) {
		this.telMobile = telMobile;
	}

	public List<Sport> getListeSports() {
		return listeSports;
	}

	public void setListeSports(List<Sport> listeSports) {
		this.listeSports = listeSports;
	}

	public double getMiseMax() {
		return miseMax;
	}

	public void setMiseMax(double miseMax) {
		this.miseMax = miseMax;
	}

	public double getSolde() {
		return solde;
	}

	public void setSolde(double solde) {
		this.solde = solde;
	}

	public String toString() {
		return "Client [id=" + id + ", credentials=" + credentials + ", nom=" + nom + ", prenom=" + prenom + ", mail="
				+ mail + ", age=" + age + ", adresse=" + adresse + ", telFix=" + telFix + ", telMobile=" + telMobile
				+ ", listeSports=" + listeSports + ", miseMax=" + miseMax + ", solde=" + solde + "]";
	}

}
