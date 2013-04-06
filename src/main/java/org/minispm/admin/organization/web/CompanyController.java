package org.minispm.admin.organization.web;

import org.minispm.admin.organization.entity.Company;
import org.minispm.admin.organization.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-12-15
 * Time: 下午4:36
 */
@Controller
@RequestMapping("/admin/org/company")
public class CompanyController {
    private CompanyService companyService;

    @RequestMapping("/index")
    public String index(Model model) {
        List<Company> companies = companyService.findAll();
        model.addAttribute("companies", companies);
        return "admin/org/companyList";
    }

    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String add(Model model){
        Company company = new Company();
        model.addAttribute("company", company);
        model.addAttribute("updatable", true);
        return "admin/org/company";
    }

    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public String add(Company company){
        companyService.save(company);
        return "redirect:index";
    }

    @RequestMapping("/view/{id}")
    public String view(@PathVariable String id, Model model) {
        return showCompany(id, model, false);
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable String id, Model model) {
        return showCompany(id, model, true);
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
    public String update(Company company){
        companyService.save(company);
        return "redirect:../index";
    }

    @RequestMapping(value = "del/{id}")
    public String delete(@PathVariable String id){
        companyService.removeById(id);
        return "redirect:../index";
    }

    private String showCompany(String id, Model model, boolean updatable){
        Company company = companyService.findById(id);
        model.addAttribute("company", company);
        model.addAttribute("updatable", updatable);
        return "admin/org/company";
    }

    public CompanyService getCompanyService() {
        return companyService;
    }

    @Autowired
    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }
}
