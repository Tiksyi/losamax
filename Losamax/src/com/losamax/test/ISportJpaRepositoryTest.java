package com.losamax.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import com.losamax.dao.ISportJpaRepository;
import com.losamax.entities.Sport;
import static org.junit.Assert.*;

public class ISportJpaRepositoryTest extends SpringTest {

	@Autowired
	private ISportJpaRepository repo;
	
	@Test
	public void testGetId(){
		Sport sport= new Sport();
		Long id=sport.getId();
		assertNull(id);
	}
	
	@Test
	public void testCreate(){
		Sport sport= new Sport();
		repo.save(sport);
		assertNotNull(repo.findAll());
	}

}
