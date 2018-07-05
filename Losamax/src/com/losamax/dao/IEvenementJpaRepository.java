package com.losamax.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.losamax.entities.Evenement;

public interface IEvenementJpaRepository extends JpaRepository<Evenement, Long> {

}
