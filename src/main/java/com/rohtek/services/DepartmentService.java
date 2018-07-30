package com.rohtek.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rohtek.entities.Department;
import com.rohtek.repository.DepartmentRepository;

@Service
public class DepartmentService implements DepartmentImplementaion{
	@Autowired
	private DepartmentRepository departmentRepository;

	public Department saveDepartment(Department department) {
		
		return departmentRepository.save(department);

	}

	public List<Department> getDepartments(Department department) {

		return departmentRepository.findAll();

	}

	public boolean deleteDepartment(Long did) {
		try {

			departmentRepository.deleteById(did);
			return true;
		} catch (Exception e) {
			String message = e.getMessage();
			System.out.println("exception***********" + message);
			return false;
		}

	}
	
	/*public String searchByName(String dname) {
		 return departmentRepository.findByDName(dname);
	}
	*/
	
}