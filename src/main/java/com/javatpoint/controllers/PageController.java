package com.javatpoint.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javatpoint.beans.Customer;
import com.javatpoint.beans.Emp;
import com.javatpoint.beans.StockBalance;
import com.javatpoint.beans.StockIn;
import com.javatpoint.beans.StockOut;
import com.javatpoint.beans.Supplier;
import com.javatpoint.dao.CustomerDao;
import com.javatpoint.dao.EmpDao;
import com.javatpoint.dao.StockBalanceDao;
import com.javatpoint.dao.StockInDao;
import com.javatpoint.dao.StockOutDao;
import com.javatpoint.dao.SupplierDao;

@Controller
public class PageController {

	@Autowired
	EmpDao dao;

	@Autowired
	private CustomerDao customerDao;

	@Autowired
	private SupplierDao supplierDao;

	@Autowired
	private StockInDao stockInDao;

	@Autowired
	private StockOutDao stockOutDao;

	@Autowired
	private StockBalanceDao stockBalanceDao;

//    @RequestMapping("/CustomerInfo")
//    public String customerInfo(Model model) {
//        model.addAttribute("pageTitle", "Customer Information");
//        model.addAttribute("activePage", "customer");
//        model.addAttribute("contentPage", "/WEB-INF/jsp/CustomerInfo.jsp");
//        return "Header";
//    }

//	@RequestMapping(value = { "/SupplierInfo", "/SupplierInfo/{pageid}" })
//	public String supplierInfo(@PathVariable(required = false) Integer pageid, Model model) {
//
//		// Set default page if not specified
//		if (pageid == null) {
//			pageid = 1;
//		}
//
//		int recordsPerPage = 5; // Number of records per page
//
//		// Get paginated suppliers
//		List<Supplier> suppliers = supplierDao.getSuppliersByPage(pageid, recordsPerPage);
//
//		// Calculate total pages
//		int totalRecords = supplierDao.countSuppliers();
//		int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
//
//		// Add data to model
//		model.addAttribute("pageTitle", "Supplier Information");
//		model.addAttribute("activePage", "supplierinfo");
//		model.addAttribute("contentPage", "/WEB-INF/jsp/SupplierInfo.jsp");
//		model.addAttribute("suppliers", suppliers);
//		model.addAttribute("currentPage", pageid);
//		model.addAttribute("totalPages", totalPages);
//
//		return "Header";
//	}

	@RequestMapping(value = { "/SupplierInfo", "/SupplierInfo/{pageid}" })
	public String supplierInfo(@PathVariable(required = false) Integer pageid, Model model) {
		// Set default page if not specified
		if (pageid == null) {
			pageid = 1;
		}

		int recordsPerPage = 5; // Number of records per page

		// Get paginated suppliers
		List<Supplier> suppliers = supplierDao.getSuppliersByPage(pageid, recordsPerPage);

		// Calculate total pages
		int totalRecords = supplierDao.countSuppliers();
		int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

		// Add data to model
		model.addAttribute("pageTitle", "Supplier Information");
		model.addAttribute("activePage", "supplierinfo");
		model.addAttribute("contentPage", "/WEB-INF/jsp/SupplierInfo.jsp");
		model.addAttribute("suppliers", suppliers);
		model.addAttribute("currentPage", pageid);
		model.addAttribute("totalPages", totalPages);

		return "Header";
	}

	@RequestMapping(value = { "/SearchSupplierInfo", "/SearchSupplierInfo/{pageid}" }, method = RequestMethod.GET)
	public String searchSupplierInfo(@PathVariable(required = false) Integer pageid,
			@RequestParam("searchQuery") String query, Model model) {
		if (pageid == null) {
			pageid = 1;
		}

		int recordsPerPage = 5;

		// Search suppliers with pagination
		List<Supplier> suppliers = supplierDao.searchSuppliers(query, pageid, recordsPerPage);

		// Count total search results
		int totalRecords = supplierDao.countSearchResults(query);
		int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

		model.addAttribute("suppliers", suppliers);
		model.addAttribute("currentPage", pageid);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("searchQuery", query); // Needed to persist the query in the view
		model.addAttribute("pageTitle", "Search Results");
		model.addAttribute("contentPage", "/WEB-INF/jsp/SupplierInfo.jsp");
		model.addAttribute("activePage", "supplierinfo");

		return "Header";
	}

	@RequestMapping("/SupplierInsertpage")
	public String supplierInsertPage(Model model) {

		model.addAttribute("pageTitle", "SupplierInsert");
		model.addAttribute("activePage", "supplierinsert");
		model.addAttribute("contentPage", "/WEB-INF/jsp/supplierInsert.jsp");
		return "Header";
	}

	// Process insert form
	@RequestMapping(value = "/SupplierInsert", method = RequestMethod.POST)
	public String saveSupplier(@ModelAttribute("supplier") Supplier supplier, Model model) {
		int result = supplierDao.save(supplier);
		if (result > 0) {
			model.addAttribute("successMessage", "Supplier added successfully!");
		} else {
			model.addAttribute("errorMessage", "Failed to add supplier!");
		}
		return "redirect:/SupplierInfo";
	}

	// Show edit form
	@RequestMapping("/SupplierEdit/{id}")
	public String supplierEditPage(@PathVariable int id, Model model) {
		Supplier supplier = supplierDao.getSupplierById(id);
		model.addAttribute("supplier", supplier);
		model.addAttribute("pageTitle", "Edit Supplier");
		model.addAttribute("activePage", "supplieredit");
		model.addAttribute("contentPage", "/WEB-INF/jsp/supplierEdit.jsp");
		return "Header";
	}

	// Handle edit form submission
	@RequestMapping(value = "/SupplierUpdate", method = RequestMethod.POST)
	public String updateSupplier(@ModelAttribute("supplier") Supplier supplier, Model model) {
		int result = supplierDao.update(supplier);
		if (result > 0) {
			model.addAttribute("successMessage", "Supplier updated successfully!");
		} else {
			model.addAttribute("errorMessage", "Failed to update supplier!");
		}
		return "redirect:/SupplierInfo";
	}

	// Handle delete
	@RequestMapping("/SupplierDelete/{id}")
	public String deleteSupplier(@PathVariable int id, Model model) {
		int result = supplierDao.delete(id);
		if (result > 0) {
			model.addAttribute("successMessage", "Supplier deleted successfully!");
		} else {
			model.addAttribute("errorMessage", "Failed to delete supplier!");
		}
		return "redirect:/SupplierInfo";
	}

	@RequestMapping(value = { "/StockInReport", "/StockInReport/{pageid}" })
	public String stockInReport(@PathVariable(required = false) Integer pageid, Model model) {

		// Set default page if not specified
		if (pageid == null) {
			pageid = 1;
		}

		int recordsPerPage = 5; // Number of records per page

		// Get paginated stock ins
		List<StockIn> stockIns = stockInDao.getStockInsByPage(pageid, recordsPerPage);

		// Calculate total pages
		int totalRecords = stockInDao.countStockIns();
		int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

		// Add data to model
		model.addAttribute("pageTitle", "Stock In Report");
		model.addAttribute("activePage", "stockinreport");
		model.addAttribute("contentPage", "/WEB-INF/jsp/StockInReport.jsp");
		model.addAttribute("stockIns", stockIns);
		model.addAttribute("currentPage", pageid);
		model.addAttribute("totalPages", totalPages);

		return "Header";
	}

	@RequestMapping(value = { "/StockOutReport", "/StockOutReport/{pageid}" })
	public String stockOutReport(@PathVariable(required = false) Integer pageid, Model model) {

		// Set default page if not specified
		if (pageid == null) {
			pageid = 1;
		}

		int recordsPerPage = 5; // Number of records per page

		// Get paginated stock outs
		List<StockOut> stockOuts = stockOutDao.getStockOutsByPage(pageid, recordsPerPage);

		// Calculate total pages
		int totalRecords = stockOutDao.countStockOuts();
		int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

		// Add data to model
		model.addAttribute("pageTitle", "Stock Out Report");
		model.addAttribute("activePage", "stockoutreport");
		model.addAttribute("contentPage", "/WEB-INF/jsp/StockOutReport.jsp");
		model.addAttribute("stockOuts", stockOuts);
		model.addAttribute("currentPage", pageid);
		model.addAttribute("totalPages", totalPages);

		return "Header";
	}

	@RequestMapping(value = { "/StockBalanceReport", "/StockBalanceReport/{pageid}" })
	public String stockBalanceReport(@PathVariable(required = false) Integer pageid, Model model) {

		// Set default page if not specified
		if (pageid == null) {
			pageid = 1;
		}

		int recordsPerPage = 5; // Number of records per page

		// Get paginated stock balances
		List<StockBalance> stockBalances = stockBalanceDao.getStockBalancesByPage(pageid, recordsPerPage);

		// Calculate total pages
		int totalRecords = stockBalanceDao.countStockBalances();
		int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

		// Add data to model
		model.addAttribute("pageTitle", "Stock Balance Report");
		model.addAttribute("activePage", "stockbalancereport");
		model.addAttribute("contentPage", "/WEB-INF/jsp/StockBalanceReport.jsp");
		model.addAttribute("stockBalances", stockBalances);
		model.addAttribute("currentPage", pageid);
		model.addAttribute("totalPages", totalPages);

		return "Header";
	}

//	@RequestMapping("/UserInsert")
//	public String userInsert(Model model) {
//		model.addAttribute("pageTitle", "UserInsert");
//		model.addAttribute("activePage", "userinsert");
//		model.addAttribute("contentPage", "/WEB-INF/jsp/UserInsert.jsp");
//		return "Header";
//	}

//    @RequestMapping("/UserView")
//    public String userView(Model model) {
//    	model.addAttribute("pageTitle", "UserView");
//        model.addAttribute("activePage", "userview");
//        model.addAttribute("contentPage", "/WEB-INF/jsp/UserView.jsp");
//        return "Header";
//    }
//    @RequestMapping("/UserView")
//        public String userView(Model model) {
//            // Get all customers from DAO
//            List<Customer> customers = customerDao.getAllCustomers();
//            
//            // Add data to model
//            model.addAttribute("pageTitle", "UserView");
//            model.addAttribute("activePage", "userview");
//            model.addAttribute("contentPage", "/WEB-INF/jsp/UserView.jsp");
//            model.addAttribute("customers", customers); // Add customer list
//            
//            return "Header";
//        }

	
	@RequestMapping("/UserInsert")
	public String userInsertPage(Model model) {

		model.addAttribute("pageTitle", "UserInsert(Admin,Employee)");
		model.addAttribute("activePage", "userinsert");
		model.addAttribute("contentPage", "/WEB-INF/jsp/UserInsert.jsp");
		return "Header";
	}
	
	@RequestMapping(value = { "/UserView", "/UserView/{pageid}" })
	public String userView(@PathVariable(required = false) Integer pageid, Model model) {

		// Set default page if not specified
		if (pageid == null) {
			pageid = 1;
		}

		int recordsPerPage = 5; // Number of records per page

		// Get paginated customers
		List<Customer> customers = customerDao.getCustomersByPage(pageid, recordsPerPage);

		// Calculate total pages
		int totalRecords = customerDao.countCustomers();
		int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

		// Add data to model
		model.addAttribute("pageTitle", "UserView");
		model.addAttribute("activePage", "userview");
		model.addAttribute("contentPage", "/WEB-INF/jsp/UserView.jsp");
		model.addAttribute("customers", customers);
		model.addAttribute("currentPage", pageid);
		model.addAttribute("totalPages", totalPages);

		return "Header";
	}

	@RequestMapping(value = { "/CustomerInfo", "/CustomerInfo/{pageid}" })
	public String customerInfo(@PathVariable(required = false) Integer pageid, Model model) {
		if (pageid == null) {
			pageid = 1;
		}

		int recordsPerPage = 5;

		List<Customer> customers = customerDao.getCustomersByPage(pageid, recordsPerPage);
		int totalRecords = customerDao.countCustomers();
		int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

		model.addAttribute("pageTitle", "Customer Information");
		model.addAttribute("activePage", "customerInfo");
		model.addAttribute("contentPage", "/WEB-INF/jsp/CustomerInfo.jsp");
		model.addAttribute("customers", customers);
		model.addAttribute("currentPage", pageid);
		model.addAttribute("totalPages", totalPages);

		return "Header";
	}

	@RequestMapping(value = { "/SearchCustomerInfo", "/SearchCustomerInfo/{pageid}" }, method = RequestMethod.GET)
	public String searchCustomerInfo(@PathVariable(required = false) Integer pageid,
			@RequestParam("searchQuery") String query, Model model) {
		if (pageid == null) {
			pageid = 1;
		}

		int recordsPerPage = 5;
		List<Customer> customers = customerDao.searchCustomers(query, pageid, recordsPerPage);
		int totalRecords = customerDao.countSearchResults(query);
		int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

		model.addAttribute("customers", customers);
		model.addAttribute("currentPage", pageid);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("searchQuery", query);
		model.addAttribute("pageTitle", "Search Results");
		model.addAttribute("contentPage", "/WEB-INF/jsp/CustomerInfo.jsp");
		model.addAttribute("activePage", "customerinfo");

		return "Header";
	}

	@RequestMapping("/CustomerInsertpage")
	public String customerInsertPage(Model model) {
		model.addAttribute("pageTitle", "Add Customer");
		model.addAttribute("activePage", "customerinsert");
		model.addAttribute("contentPage", "/WEB-INF/jsp/customerInsert.jsp");
		return "Header";
	}

	@RequestMapping(value = "/CustomerInsert", method = RequestMethod.POST)
	public String saveCustomer(@ModelAttribute("customer") Customer customer, Model model) {
		int result = customerDao.save(customer);
		if (result > 0) {
			model.addAttribute("successMessage", "Customer added successfully!");
		} else {
			model.addAttribute("errorMessage", "Failed to add customer!");
		}
		return "redirect:/CustomerInfo";
	}

	@RequestMapping("/CustomerEdit/{id}")
	public String customerEditPage(@PathVariable int id, Model model) {
		Customer customer = customerDao.getCustomerById(id);
		model.addAttribute("customer", customer);
		model.addAttribute("pageTitle", "Edit Customer");
		model.addAttribute("activePage", "customeredit");
		model.addAttribute("contentPage", "/WEB-INF/jsp/customerEdit.jsp");
		return "Header";
	}

	@RequestMapping(value = "/CustomerUpdate", method = RequestMethod.POST)
	public String updateCustomer(@ModelAttribute("customer") Customer customer, Model model) {
		int result = customerDao.update(customer);
		if (result > 0) {
			model.addAttribute("successMessage", "Customer updated successfully!");
		} else {
			model.addAttribute("errorMessage", "Failed to update customer!");
		}
		return "redirect:/CustomerInfo";
	}

	@RequestMapping("/CustomerDelete/{id}")
	public String deleteCustomer(@PathVariable int id, Model model) {
		int result = customerDao.delete(id);
		if (result > 0) {
			model.addAttribute("successMessage", "Customer deleted successfully!");
		} else {
			model.addAttribute("errorMessage", "Failed to delete customer!");
		}
		return "redirect:/CustomerInfo";
	}

	@RequestMapping("/Update")
	public String update(Model model) {

		model.addAttribute("pageTitle", "Update");
		model.addAttribute("activePage", "update");
		model.addAttribute("contentPage", "/WEB-INF/jsp/Update.jsp");
		return "Header";
	}

	@RequestMapping("/Login")
	public String login(Model model) {
		model.addAttribute("pageTitle", "Login");
		model.addAttribute("activePage", "login");
		model.addAttribute("contentPage", "/WEB-INF/jsp/Login.jsp");
		return "Header";
	}

	@RequestMapping("/ChangePassword")
	public String changePassword(Model model) {
		model.addAttribute("pageTitle", "Change Password");
		model.addAttribute("activePage", "changepassword");
		model.addAttribute("contentPage", "/WEB-INF/jsp/ChangePassword.jsp");
		return "Header";
	}

	@RequestMapping("/ForgetPassword")
	public String forgetPassword(Model model) {
		model.addAttribute("pageTitle", "Forget Password");
		model.addAttribute("activePage", "forgetpassword");
		model.addAttribute("contentPage", "/WEB-INF/jsp/ForgetPassword.jsp");
		return "Header";
	}

	@RequestMapping("/empform")
	public String showform(Model m) {
		m.addAttribute("emp", new Emp());
		return "viewemp";
	}

	@RequestMapping(value = "/viewemp/{pageid}")
	public String edit(@PathVariable int pageid, Model m) {
		int total = 5;
		if (pageid == 1) {
			// do nothing, just use pageid=1
		} else {
			pageid = (pageid - 1) * total + 1;
		}

		System.out.println(pageid);
		List<Emp> list = dao.getEmployeesByPage(pageid, total);
		m.addAttribute("msg", list);

		return "viewemp";
	}
}