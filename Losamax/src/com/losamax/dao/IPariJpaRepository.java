package com.losamax.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.losamax.entities.Pari;

public interface IPariJpaRepository extends JpaRepository<Pari, Long> {

}
