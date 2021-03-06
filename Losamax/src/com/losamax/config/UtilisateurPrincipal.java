package com.losamax.config;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.losamax.dao.IClientJpaRepository;
import com.losamax.entities.Client;
import com.losamax.entities.Credentials;

public class UtilisateurPrincipal implements UserDetails {

	private static final long serialVersionUID = -5270061614463868043L;

	private Credentials credentials;
	@Autowired
	private IClientJpaRepository clientRepo;

	public UtilisateurPrincipal(Credentials credentials) {
		this.credentials = credentials;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority(credentials.getRole().name()));
		return authorities;
	}

	@Override
	public String getPassword() {
		return credentials.getPassword();
	}

	@Override
	public String getUsername() {
		return credentials.getUsername();
	}

	public Credentials getCredentials() {
		return this.credentials;
	}

	public Client getClient() {
		Client c = clientRepo.findByCredentialsUsername(getUsername());
		return c;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
}
