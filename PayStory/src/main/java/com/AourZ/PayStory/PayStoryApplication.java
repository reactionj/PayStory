package com.AourZ.PayStory;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.AourZ.PayStory.controller.MemeberColler;

@SpringBootApplication
@ComponentScan(basePackageClasses = MemeberColler.class)
public class PayStoryApplication {

	public static void main(String[] args) {
		SpringApplication.run(PayStoryApplication.class, args);
	}

}
