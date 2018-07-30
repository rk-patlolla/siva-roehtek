package com.rohtek.configuration;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.rohtek.filters.MyFilter;
import com.rohtek.services.EmployeeService;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled=true)
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	
	@Autowired
	DataSource dataSource;

	@Autowired
	private EmployeeService employeeService;

	
	
	@Autowired
	protected void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(employeeService).passwordEncoder(passwordencoder());

	}
	


	@Override
	protected void configure(HttpSecurity http) throws Exception {
		/*
		 * http .httpBasic() .and() .authorizeRequests()
		 * .antMatchers("/login").hasRole("ADMIN") .anyRequest().fullyAuthenticated();
		 */
		http.authorizeRequests().antMatchers("/", "/home").permitAll().antMatchers("/admin").hasRole("ADMIN")
		.anyRequest().authenticated().and().formLogin().failureUrl("/login?error").permitAll()
		.and()//.addFilterAfter(loginFilter(), BasicAuthenticationFilter.class)
		.logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"));
		http.exceptionHandling().accessDeniedPage("/error");
		/*
		 * http.csrf().disable().authorizeRequests().antMatchers("/getlist").hasAnyRole(
		 * "user").and().formLogin();
		 * http.csrf().disable().authorizeRequests().antMatchers("/home").hasAnyRole(
		 * "user").and().formLogin();
		 * http.csrf().disable().authorizeRequests().antMatchers("/mainHome").hasAnyRole
		 * ("user").and().formLogin();
		 * http.csrf().disable().authorizeRequests().antMatchers("/index").hasAnyRole(
		 * "user").and().formLogin();
		 * http.csrf().disable().authorizeRequests().antMatchers("/empform").hasAnyRole(
		 * "user").and().formLogin();
		 * http.csrf().disable().authorizeRequests().antMatchers("/getDepartmentslist").
		 * hasAnyRole("admin").and().formLogin();
		 * http.csrf().disable().authorizeRequests().antMatchers("/departmentform").
		 * hasAnyRole("admin").and().formLogin();
		 * http.csrf().disable().authorizeRequests().antMatchers("/mainHome").hasAnyRole
		 * ("admin").and().formLogin();
		 */

	}

	@Bean(name = "passwordEncoder")
	public PasswordEncoder passwordencoder() {
		return new BCryptPasswordEncoder();
	}
	
	public MyFilter loginFilter() {
		
		return new MyFilter();
	}

}
