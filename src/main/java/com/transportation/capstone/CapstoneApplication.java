package com.transportation.capstone;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//spring boot application will scan all components - finds @Controller and maps them 
@SpringBootApplication
//don't need below statement bc we areusing springboot 2. 
//@ComponentScan({"com.transportation.capstone", "com.transportation.web", "com.transportation.product"})
public class CapstoneApplication {

	public static void main(String[] args) {
		SpringApplication.run(CapstoneApplication.class, args);
	}

}
