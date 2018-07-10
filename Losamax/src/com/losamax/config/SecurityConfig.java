package com.losamax.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.losamax.services.LoginService;

@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private LoginService loginService;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests()
				.antMatchers("/static/**").permitAll()
				.antMatchers("/index.jsp").permitAll()
				.antMatchers("/paricontroller/goToMenu").permitAll()
				.antMatchers("/clientcontroller/goToCreer").permitAll()
				.antMatchers("/clientcontroller/creer").permitAll()
				.anyRequest().authenticated().and().formLogin().loginPage("/securitycontroller/login")
				.loginProcessingUrl("/login").defaultSuccessUrl("/paricontroller/goToMenu", true)
				.failureUrl("/securitycontroller/login?error=true").permitAll().and().logout()
				.invalidateHttpSession(true).logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
				.logoutSuccessUrl("/paricontroller/goToMenu?logout=true").permitAll();
		
//		http.authorizeRequests()
//        .antMatchers("/", "/*.html").permitAll()
//        .antMatchers("/user/**").hasRole("USER")
//        .antMatchers("/admin/**").hasRole("ADMIN")
//        .antMatchers("/admin/login").permitAll()
//        .antMatchers("/user/login").permitAll()
//        .anyRequest().authenticated()

//		http.authorizeRequests()
//				.antMatchers("/static/**", "/paricontroller/goToMenu", "index.jsp", "/clientcontroller/goToCreer/**")
//				.permitAll().anyRequest().authenticated().and().formLogin().loginPage("/securitycontroller/login")
//				.loginProcessingUrl("/login").defaultSuccessUrl("/paricontroller/goToMenu", true)
//				.failureUrl("/securitycontroller/login?error=true").permitAll().and().logout()
//				.invalidateHttpSession(true).logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
//				.logoutSuccessUrl("/securitycontroller/login?logout=true").permitAll();
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().withUser("user").password("{noop}123").roles("USER");
		auth.inMemoryAuthentication().withUser("admin").password("{noop}123").roles("ADMIN");
		auth.inMemoryAuthentication().withUser("guest").password("{noop}123").roles("GUEST");
		auth.inMemoryAuthentication().withUser("root").password("123").roles("USER", "ADMIN", "GUEST");
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.userDetailsService(loginService);
	}

	 @Bean
	 public PasswordEncoder passwordEncoder() {
	 return new BCryptPasswordEncoder();
	 }
}
