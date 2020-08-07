package com.transportation.capstone.utils;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import javax.xml.bind.DatatypeConverter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.util.FileSystemUtils;


import com.transportation.capstone.dao.UserRepository;




@Component
@Transactional
public class WebUtils{
	
	private static final Logger log=LoggerFactory.getLogger("WebUtils.class");
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	
	
	@Autowired
    HttpServletRequest request;
	
	private static final String UPLOADED_FOLDER = "static"+ File.separator +"img";
	
	public void sendMail(String to, String msg, String subject) {
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);
        try {
            helper.setTo(to);
            helper.setText(msg);
            helper.setSubject(subject);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        try {
        	javaMailSender.send(message);
		} catch (MailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}        
	  }
   
	
	
	   public void deletefolder(long id) throws IllegalStateException, IOException {
	      try {
			 String destDir = request.getSession().getServletContext().getRealPath(UPLOADED_FOLDER)+ File.separator +"users"+ File.separator +id;
	    	 log.info("This is path {}", destDir);
	    	 //innitalize file	    	 
			 File dir = new File(destDir);
			   if(dir.isDirectory()){                                    	 
				   FileSystemUtils.deleteRecursively(dir);                              
				}			 
			  }catch (Exception e){
			   e.printStackTrace();
			}				 
	   }		
	 	   
	   public String removefiles(long id, String image, String folder) {
		try {
			String realPathtoUploads = 
		    request.getSession().getServletContext()
		    .getRealPath(UPLOADED_FOLDER+ File.separator +folder);			
			File file = new File(realPathtoUploads + File.separator 
					+ id+ File.separator +image+"");    		
	 	    file.delete();
		   }catch (Exception e){
			e.printStackTrace();
			return "Delete operation is failed.";
		   }
		return "Delete Success.";
	   }
	   
	   public void getFiles(Model model, long id, String folder) {
	    	List<String> results = new ArrayList<String>();
			try {
				String realPathtoUploads = 
				request.getSession().getServletContext().getRealPath(UPLOADED_FOLDER+ File.separator +folder);						
				File[] files = new File(realPathtoUploads + File.separator + id).listFiles();
			    for (File file : files) {
				  if (file.isFile()) {
				      results.add(file.getName());
				      model.addAttribute("filenames", results);
				  }				   
				}
			}catch (Exception e) {
			// TODO Auto-generated catch block
			 e.printStackTrace();
			}
	    }
	   
	   public String md5(String filename) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		    String hash = DatatypeConverter.printHexBinary(MessageDigest.getInstance("MD5").digest(filename.getBytes("UTF-8")));
			return hash;
	   }
	   
	   
	   
	   
	   
	
    
}
