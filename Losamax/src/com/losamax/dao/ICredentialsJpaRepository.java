package com.losamax.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.losamax.entities.Credentials;

public interface ICredentialsJpaRepository extends JpaRepository<Credentials, Long> {

    @Query("select c from Credentials c where c.username = :username and c.password = :password")
    public Credentials findbyUsername(@Param("username") String username,
	    @Param("password") String password);

    // Requete derivee = findBy + attribut de l'entite
    public Credentials findByUsername(String username);
}
