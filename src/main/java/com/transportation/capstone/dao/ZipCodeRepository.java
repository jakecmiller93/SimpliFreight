package com.transportation.capstone.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.transportation.capstone.model.ZipCode;

public interface ZipCodeRepository extends JpaRepository<ZipCode, String> {

	
	
}
