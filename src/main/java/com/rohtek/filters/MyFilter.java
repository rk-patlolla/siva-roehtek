package com.rohtek.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.rohtek.controllers.EmployeeController;

@Component
public class MyFilter implements Filter {

	public static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		logger.info("filtering..............");

		chain.doFilter(request, response);

	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	/*@Bean
	public FilterRegistrationBean<MyFilter> loggingFilter() {
		FilterRegistrationBean<MyFilter> registrationBean = new FilterRegistrationBean<>();
		registrationBean.setFilter(new MyFilter());
		logger.info("url filtering*******");
		registrationBean.addUrlPatterns("/getlist");
		return registrationBean;

	}*/
}
