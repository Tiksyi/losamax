package com.losamax.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.losamax.entities.Client;

public interface IClientJpaRepository extends JpaRepository<Client, Long> {

}
