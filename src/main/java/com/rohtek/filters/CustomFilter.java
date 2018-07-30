package com.rohtek.filters;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;


public class CustomFilter {

	
	
	@Bean
	public FilterRegistrationBean<MyFilter> loggingFilter(){
	    FilterRegistrationBean<MyFilter> registrationBean 
	      = new FilterRegistrationBean<>();
	         
	    registrationBean.setFilter(new MyFilter());
	    System.out.println("urls..............");
	    registrationBean.addUrlPatterns("/empform");
	         
	    return registrationBean;    

	}
}
