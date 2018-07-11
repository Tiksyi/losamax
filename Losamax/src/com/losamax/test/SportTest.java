package com.losamax.test;

import org.junit.Test;
import static org.junit.Assert.*;
import com.losamax.entities.Sport;

public class SportTest {

	@Test
	public void testConstruire() {
		Sport sport = new Sport();
		assertNotNull(sport);
	}
	
	@Test
	public void testGetNom() {
		Sport sport = new Sport();
		String nom = sport.getNom();
		assertNull(nom);
	}
	
	@Test
	public void testSetNom() {
		Sport sport = new Sport();
		sport.setNom("nom");
		String nom = sport.getNom();
		assertTrue(nom.equals("nom"));
	}
	
	@Test
	public void testGetId() {
		Sport sport = new Sport();
		Long id = sport.getId();
		assertNull(id);
	}
	
	@Test
	public void testSetId() {
		Sport sport = new Sport();
		sport.setId(1l);
		Long id = sport.getId();
		assertTrue(id==1);
	}
	
	@Test
	public void testEquals() {
		Sport sport1 = new Sport();
		Sport sport2 = new Sport();
		Sport sport3 = new Sport();
		sport1.setNom("nom");
		sport2.setNom("nom");
		sport3.setNom("autrenom");
		assertTrue(sport1.equals(sport2));
		assertFalse(sport1.equals(sport3));
	}
		
}
