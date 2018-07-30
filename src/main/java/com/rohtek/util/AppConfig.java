package com.rohtek.util;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

@Configuration
public class AppConfig {
	  @Bean
	  public MessageSource messageSource() {
	      ReloadableResourceBundleMessageSource bean = new ReloadableResourceBundleMessageSource();
	      bean.setBasename("classpath:message");
	      bean.setDefaultEncoding("UTF-8");
	      return bean;
	  }

	  @Bean
	  public LocalValidatorFactoryBean validator() {
	      LocalValidatorFactoryBean bean = new LocalValidatorFactoryBean();
	      bean.setValidationMessageSource(messageSource());
	      return bean;
	  }

	  
	}