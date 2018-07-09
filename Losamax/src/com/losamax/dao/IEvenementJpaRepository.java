package com.losamax.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.losamax.entities.Evenement;

public interface IEvenementJpaRepository extends JpaRepository<Evenement, Long> {
	
	@Query("select e from Evenement e join e.participants p where p.sport.id = :id group by e")
	public List<Evenement> findByParticipantsSportId(@Param("id") Long id);

}
