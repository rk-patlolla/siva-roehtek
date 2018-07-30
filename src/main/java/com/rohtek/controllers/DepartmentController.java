package com.rohtek.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.rohtek.entities.Department;
import com.rohtek.services.DepartmentImplementaion;

@Controller
public class DepartmentController {

	@Autowired
	private DepartmentImplementaion departmentImplementaion;

	@RequestMapping("/mainHome")
	public String mainHome() {

		return "index";

	}

	@RequestMapping(path = "departmentform", method = RequestMethod.GET)
	public String addDepartmentForm(@ModelAttribute("Department") Department department) {

		return "departmentform";
	}

	@RequestMapping(path = "departmentInsert", method = RequestMethod.POST)
	public String employeeInsert(@ModelAttribute("Department") @Valid Department department, BindingResult errors,
			Model model) {
		if (errors.hasErrors()) {

			return "departmentform";
		}

		Department saveDepartment = departmentImplementaion.saveDepartment(department);
		if (saveDepartment != null) {
			model.addAttribute("department", saveDepartment);
			return "index";
		}

		return "departmentform";
	}

	@RequestMapping("/getDepartmentslist")
	public String employeetoDepartment(@ModelAttribute("Department") Department department, Model model) {

		List<Department> departmentList = departmentImplementaion.getDepartments(department);
		model.addAttribute("departmentList", departmentList);

		return "getDepartmentslist";

	}

	@RequestMapping(path = "/deleteDepartment/{did}", method = RequestMethod.GET)
	public ModelAndView deleteDepartment(@PathVariable Long did, @ModelAttribute("Department") Department department,
			Model model) {
		boolean deleteDepartment = departmentImplementaion.deleteDepartment(did);
		if (deleteDepartment == true) {
			RedirectView redirectView = new RedirectView("/getDepartmentslist");
			redirectView.setExposePathVariables(false);
			return new ModelAndView(redirectView);
		} else {
			model.addAttribute("error", deleteDepartment);
			RedirectView redirectView = new RedirectView("/error");
			
			return new ModelAndView(redirectView);

		}
	}
	
	
	@RequestMapping(value = "/checkEmpName")
    public void searchByName(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		System.out.println("Employee name***"+request.getParameter("ename"));
		/*String res=departmentImplementaion.searchByName(request.getParameter("ename"));
        if(res!=null) {
        response.setContentType("text/html");
        response.getWriter().print("available");
        PrintWriter out = response.getWriter();
        out.flush();*/
        }
    
	
	
}
