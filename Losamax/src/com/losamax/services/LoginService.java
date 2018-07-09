package com.losamax.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import com.losamax.config.UtilisateurPrincipal;
import com.losamax.dao.ICredentialsJpaRepository;
import com.losamax.entities.Credentials;

public class LoginService implements UserDetailsService {

    @Autowired
    private ICredentialsJpaRepository credentialsRepo;
    
    private String role;

    @Override
    public UserDetails loadUserByUsername(String username)
	    throws UsernameNotFoundException {
	Credentials credentials = credentialsRepo.findByUsername(username);
	if (null == credentials) {
	    throw new UsernameNotFoundException(
		    "No user found with username: " + username);
	}
	this.role=credentials.getRole().name();
	return new UtilisateurPrincipal(credentials);
    }
    
    public String getRole() {
    	  	return this.role;
    }
}
