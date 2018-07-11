package com.losamax.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.losamax.entities.Admin;

public interface IAdminJpaRepository extends JpaRepository<Admin, Long>{

	public Admin findByCredentialsUsername(String username);
}
