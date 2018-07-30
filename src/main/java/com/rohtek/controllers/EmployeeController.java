package com.rohtek.controllers;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.rohtek.entities.Employee;
import com.rohtek.services.DepartmentImplementaion;
import com.rohtek.services.EmployeeImplementaion;

@Controller
public class EmployeeController {
	public static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	@Autowired
	private EmployeeImplementaion employeeImplementaion;

	@Autowired
	private DepartmentImplementaion departmentImplementaion;
	@RequestMapping(path="/index",produces = "text/html")
	public String home() {

		return "index";

	}


	@RequestMapping("/getlist")
	public String getEmplist(@ModelAttribute("eidelete")Employee employee,Model model) {

		List<Employee> employeeList = employeeImplementaion.employeeList();

		model.addAttribute("list", employeeList);
		return "emplist";

	}
	

	@RequestMapping(path = "empform", method = RequestMethod.GET)
	public String addEmoloyeeForm(@ModelAttribute("Employee") Employee employee, Department department, Model model) {
		List<Department> departments = departmentImplementaion.getDepartments(department);

		model.addAttribute("departments", departments);
		
		return "form";
	}

	@RequestMapping(path = "employeeInsert", method = RequestMethod.POST)

	public ModelAndView employeeInsert(@ModelAttribute("Employee") @Valid Employee employee, BindingResult errors,
			Model model) {

		String message = "";
		if (errors.hasErrors()) {
			message = "error";
			return new ModelAndView("form", "message", message);
		}

		Employee save = null;
		try {
			save = employeeImplementaion.saveEmployee(employee);
		} catch (Exception e) {
			
			String message2 = "";
			message2="unique";
			model.addAttribute("unique", message2);
			return new ModelAndView("form", "message2", message2);
		}

		if (save != null) {
			message = "sucess";
			return new ModelAndView("index", "message", message);
		}

		return new ModelAndView("empform", "message", message);
	}

	@RequestMapping(path = "/getById/{eid}", method = RequestMethod.GET)
	public String getBYId(@ModelAttribute("Employee") Employee employee, @PathVariable Long eid, Model model) {

		Employee emp = employeeImplementaion.getEmployee(eid);
		model.addAttribute("editEmployee", emp);

		return "editform";

	}

	@RequestMapping(path = "/updateEmployee", method = RequestMethod.POST)
	public String editEmployee(@ModelAttribute("Employee") @Valid Employee employee, BindingResult errors,
			Model model) {

		if (errors.hasErrors()) {
			return "redirect:/getlist";
		}
		Employee editEmployee = employeeImplementaion.editEmployee(employee);

		if (editEmployee != null) {
			model.addAttribute("employee", editEmployee);

			return "redirect:/getlist";

		}
		return "redirect:/getlist";
	}
	
	
	@RequestMapping("/delete/{eid}")
	public ModelAndView deleteEmployee(@PathVariable Long eid,
			Model model) {
		employeeImplementaion.delteEmployee(eid);
		RedirectView redirectView = new RedirectView("/getlist");
		redirectView.setExposePathVariables(false);
		return new ModelAndView(redirectView);
	}

	/*@DeleteMapping("/deleteById/{eid}")
	public ModelAndView deleteEmployee(@PathVariable Long eid,
	Model model) {
		
		System.out.println("*******************");
		employeeImplementaion.delteEmployee(eid);
		RedirectView redirectView = new RedirectView("/getlist");
		redirectView.setExposePathVariables(false);
		return new ModelAndView(redirectView);
	}*/
	/*@RequestMapping(value = "/checkEmpName")
    public void searchByName(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String res = employeeImplementaion.searchByName(request.getParameter("ename"));
        if(res!=null) {
        response.setContentType("text/html");
        response.getWriter().print("available");
        PrintWriter out = response.getWriter();
        out.flush();
        }
    }*/
}
