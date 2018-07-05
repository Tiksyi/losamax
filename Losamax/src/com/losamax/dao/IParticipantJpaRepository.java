package com.losamax.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.losamax.entities.Participant;

public interface IParticipantJpaRepository extends JpaRepository<Participant, Long> {

}
