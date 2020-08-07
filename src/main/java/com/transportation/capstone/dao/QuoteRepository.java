package com.transportation.capstone.dao;



import org.springframework.data.jpa.repository.JpaRepository;

import com.transportation.capstone.model.Quote;


public interface QuoteRepository extends JpaRepository<Quote, Long> {


	
}
