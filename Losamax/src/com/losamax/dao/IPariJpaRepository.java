package com.losamax.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import com.losamax.entities.Pari;

public interface IPariJpaRepository extends JpaRepository<Pari, Long> {

//	@Query("select p from Pari p join p.client p where p.client.id = :id")
	public List<Pari> findByClientId(@Param("id") Long id);
	
	public boolean deleteByClientId(Long id);
}
