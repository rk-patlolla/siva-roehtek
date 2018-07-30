package com.rohtek.services;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.rohtek.entities.Employee;
import com.rohtek.repository.EmployeeRepository;
import com.rohtek.util.ResourceNotFoundException;

@Service
public class EmployeeService implements EmployeeImplementaion {
	
	
	@Autowired
	EmployeeRepository employeeRepository;
	

	public List<Employee> employeeList() {
		return employeeRepository.findAll();

	}

	public Employee saveEmployee(Employee employee)  throws DataIntegrityViolationException{
		
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		employee.setPassword(bCryptPasswordEncoder.encode(employee.getPassword()));
		return employeeRepository.save(employee);

	}

	public Employee editEmployee(Employee employee) {
	
		return employeeRepository.save(employee);

	}

	/*
	 * @Modifying
	 * 
	 * @Transactional
	 * 
	 * @Query("update Employee e set e.ename = ?1,e.mobile=?2,e.eaddress=?3 where e.eid = ?4"
	 * ) public void editEmployee(String ename, Long mobile, String eaddress, Long
	 * eid) { System.out.println("ename********" + ename); }
	 */
	public Employee getEmployee(Long eid) {
		Employee employeeFound = employeeRepository.findById(eid)
				.orElseThrow(() -> new ResourceNotFoundException("eid", "eid", eid));
		return employeeFound;
	}

	public boolean delteEmployee(Long eid) {
		try {

			employeeRepository.deleteById(eid);
			return true;
		} catch (Exception e) {

			return false;
		}

	}

	public UserDetails loadUserByUsername(String ename) throws UsernameNotFoundException {
		Employee emp = employeeRepository.findByename(ename);
		GrantedAuthority authority = new SimpleGrantedAuthority(emp.getRole());

		UserDetails userDetails = (UserDetails) new User(emp.getEname(), emp.getPassword(), Arrays.asList(authority));
		return userDetails;
	}
	
	

	/*public String searchByName(String ename) {
		 return employeeRepository.getByEname(ename);
	}*/
	
	
}
