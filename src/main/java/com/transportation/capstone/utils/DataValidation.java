package com.transportation.capstone.utils;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.transportation.capstone.dao.DriverRepository;
import com.transportation.capstone.dao.UserRepository;
import com.transportation.capstone.model.Drivers;
import com.transportation.capstone.model.Shipment;
import com.transportation.capstone.model.Users;



@Component
public class DataValidation implements Validator {

@Autowired
public UserRepository userRepository;

@Autowired
public DriverRepository driverRepository;


String emailRegex ="^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
String passwordRegex ="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])(?=\\S+$).{8,}$";
String zipRegex = "^[\\\\(]{0,1}([0-9]){3}[\\\\)]{0,1}[ ]?([^0-1]){1}([0-9]){2}[ ]?[-]?[ ]?([0-9]){4}[ ]*((x){0,1}([0-9]){1,5}){0,1}$";

String phoneRegex ="\\d{10}|(?:\\d{3}-){2}\\d{4}|\\(\\d{3}\\)\\d{3}-?\\d{4}";

public boolean supports(Class<?> clazz) {
return Users.class.equals(clazz);
}

public void validate(Object o, Errors errors) {
Users user = (Users) o;

ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "size.user.firstName");
ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "size.user.lastName");

ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
if (userRepository.findByEmail(user.getEmail()).isPresent()) {
    errors.rejectValue("email", "size.user.unique");
    }

          
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password2", "NotEmpty");
        if (!user.getPassword2().equals(user.getPassword())) {
    errors.rejectValue("password2", "match.user.password2");
    }
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
if(!user.getEmail().matches(emailRegex)) { 
errors.rejectValue("email","size.user.email"); 
}
 
        
        if (!user.getPassword().matches(passwordRegex)) {
        errors.rejectValue("password", "size.user.password");
    }
    
        


}


public void shipmentValidate(Object o, Errors error) {
	
	Shipment shipment =  (Shipment) o;
	
	if(!shipment.getoZipCode().matches(zipRegex)) {
		error.rejectValue("oZipCode", "size.shipment.zipcode");
	}
	
	
	if(!shipment.getdZipCode().matches(zipRegex)) {
		error.rejectValue("dZipCode", "size.shipment.zipcode");
	}
	
}

public void driverValidate(Object o, Errors error) {
	Drivers driver = (Drivers) o;
	
	if(!driver.getTelephone().matches(phoneRegex)) {
		error.rejectValue("telephone", "size.drivers.telephone");
	}
	
}



}

