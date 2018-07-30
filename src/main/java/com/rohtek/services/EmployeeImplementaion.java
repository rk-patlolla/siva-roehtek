package com.rohtek.services;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.rohtek.entities.Employee;

public interface EmployeeImplementaion extends UserDetailsService {

	public List<Employee> employeeList();

	public Employee saveEmployee(Employee employee);

	public Employee editEmployee(Employee employee);

	public Employee getEmployee(Long eid);

	public boolean delteEmployee(Long eid);
	
	/*public String searchByName(String ename);*/

}
