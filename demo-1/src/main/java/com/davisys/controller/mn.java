package com.davisys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.davisys.dao.UserDAO;
import com.davisys.entity.Users;

@Configuration
public class mn {
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Autowired
	UserDAO dao;

	public String test() {
		try {
			Users u = dao.findEmailUser("nghiaqh@fe.edu.vn");

			System.out.println(u == null);
			//String[] roles = u.getAuthorities().toArray(new String[0]);
			/*
			 * for (String r : roles) { System.out.println(r); }
			 */
		} catch (Exception e) {
			System.out.println("error: " + e);
		}
		return null;
	}
}
