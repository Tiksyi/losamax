package com.losamax.controllers;



import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import com.losamax.config.UtilisateurPrincipal;
import com.losamax.entities.ERole;
import com.losamax.entities.Credentials;


/**
 * Une classe qui facilite l'accès aux informations d'authentification. Aide à
 * récupérer l'utilisateur connecté et son rôle.
 */
public class AuthHelper {

    /**
     * Retourne le rôle de l'utilisateur connecté.
     *
     * @return le role de l'utilisateur connecté
     */
    public static ERole getRole() {
	return getCredentials().getRole();
    }

    /**
     * Retourne l'utilisateur connecté.
     *
     * @return l'utilisateur connecté
     */
    public static Credentials getCredentials() {
	return getPrincipal().getCredentials();
    }

    public static boolean isAuthenticated() {
	boolean authenticated = false;
	Collection<? extends GrantedAuthority> authorities = getAuthorities();
	ERole[] roles = ERole.values();
	List<String> stringRoles = new ArrayList<>();
	for (ERole role : roles) {
	    stringRoles.add(role.name());
	}
	for (GrantedAuthority authority : authorities) {
	    if (stringRoles.contains(authority.getAuthority())) {
		authenticated = true;
		break;
	    }
	}
	return authenticated;
    }

    public static UtilisateurPrincipal getPrincipal() {
	return (UtilisateurPrincipal) getAuthentication().getPrincipal();
    }

    public static Collection<? extends GrantedAuthority> getAuthorities() {
	return getAuthentication().getAuthorities();
    }

    public static Authentication getAuthentication() {
	return SecurityContextHolder.getContext().getAuthentication();
    }
}
