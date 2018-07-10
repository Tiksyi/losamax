package com.losamax.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/securitycontroller")
public class SecurityController {

	

    @SuppressWarnings("unused")
    @GetMapping("/login")
    public String appLogin(
	    @RequestParam(value = "error", required = false) Boolean error,
	    @RequestParam(value = "logout", required = false) Boolean logout) {
	return "login";
    }
    
    @SuppressWarnings("unused")
    @GetMapping("/dispatcher")
    public String dispatcher()
    	 {
    	
		String role = AuthHelper.getRole().name();
    	if (role.equals("ROLE_USER"))
    			return "accueil";
    	if (role.equals("ROLE_ADMIN"))
    		return "bonjouradmin";
    	   else return "login";
	    } 
 
}