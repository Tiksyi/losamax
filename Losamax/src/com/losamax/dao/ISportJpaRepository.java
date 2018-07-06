package com.losamax.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.losamax.entities.Sport;

public interface ISportJpaRepository extends JpaRepository<Sport, Long> {
	
	public Sport findByNom(String nom);

}
