package com.javatpoint.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javatpoint.beans.Emp;
import com.javatpoint.dao.EmpDao;



@Controller
public class PageController {

    @Autowired
    EmpDao dao;
    
    @RequestMapping("/CustomerInfo")
    public String customerInfo(Model model) {
        model.addAttribute("pageTitle", "Customer Information");
        model.addAttribute("activePage", "customer");
        model.addAttribute("contentPage", "/WEB-INF/jsp/CustomerInfo.jsp");
        return "Header";
    }

    @RequestMapping("/SupplierInfo")
    public String supplierInfo(Model model) {
        // Add any necessary model attributes
    	 model.addAttribute("pageTitle", "Supplier Information");
         model.addAttribute("activePage", "supplierinfo");
         model.addAttribute("contentPage", "/WEB-INF/jsp/SupplierInfo.jsp");
         return "Header";
        
    }

    @RequestMapping("/StockInReport")
    public String stockInReport(Model model) {
    	 model.addAttribute("pageTitle", "Stock In Report");
         model.addAttribute("activePage", "stockinreport");
         model.addAttribute("contentPage", "/WEB-INF/jsp/StockInReport.jsp");
         return "Header";
        
    }

    @RequestMapping("/StockOutReport")
    public String stockOutReport(Model model) {
        // Add any necessary model attributes
    	model.addAttribute("pageTitle", "Stock Out Report");
        model.addAttribute("activePage", "stockoutreport");
        model.addAttribute("contentPage", "/WEB-INF/jsp/StockOutReport.jsp");
        return "Header";
       
    }

    @RequestMapping("/StockBalanceReport")
    public String stockBalance(Model model) {
    	model.addAttribute("pageTitle", "Stock Balance");
        model.addAttribute("activePage", "stockbalancereport");
        model.addAttribute("contentPage", "/WEB-INF/jsp/StockBalanceReport.jsp");
        return "Header";
    }

    @RequestMapping("/UserInsert")
    public String userInsert(Model model) {
    	model.addAttribute("pageTitle", "UserInsert");
        model.addAttribute("activePage", "userinsert");
        model.addAttribute("contentPage", "/WEB-INF/jsp/UserInsert.jsp");
        return "Header";
    }

    @RequestMapping("/UserView")
    public String userView(Model model) {
    	model.addAttribute("pageTitle", "UserView");
        model.addAttribute("activePage", "userview");
        model.addAttribute("contentPage", "/WEB-INF/jsp/UserView.jsp");
        return "Header";
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
    public String showform(Model m){  
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