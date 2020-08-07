package com.transportation.capstone.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.transportation.capstone.model.Drivers;


public interface DriverRepository extends JpaRepository<Drivers, Long> {

	
	Optional<Drivers> findByEmail(String email);
	
}
