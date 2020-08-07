package com.transportation.capstone.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import com.transportation.capstone.model.Users;

//T = type - this is a table of Users so type = Users
// ID = type of variable.  In this case Long bc id is Long 

public interface UserRepository extends JpaRepository<Users, Long> {

	Optional<Users> findByEmail(String email);
	
	//query to login user and go to profile.  ? means taking email and comparing to first paramaeter
	@Query("FROM Users WHERE email=?1 AND password=?2 ")
	Optional<Users> login(String email, String password);
	

	
}
