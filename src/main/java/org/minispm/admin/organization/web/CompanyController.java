package org.minispm.admin.organization.web;

import org.apache.commons.lang3.StringUtils;
import org.minispm.admin.organization.entity.Company;
import org.minispm.admin.organization.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-12-15
 * Time: 下午4:36
 */
@Controller
@RequestMapping("/admin/companies")
public class CompanyController {
    @Autowired
    private CompanyService companyService;

    @RequestMapping()
    public String getAll(Model model) {
        List<Company> companies = companyService.findAll();
        model.addAttribute("companies", companies);
        return "admin/companyList";
    }

    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public String create(@Validated @ModelAttribute Company company, BindingResult result) {
        if (result.hasErrors()){

            return "/admin/company";
        }
        companyService.save(company);
        return "redirect:/admin/companies";
    }
    @RequestMapping(value = "/{id}/edit", method = RequestMethod.PUT)
    public String update(@Valid Company company, BindingResult result) {
        if(result.hasErrors()){
            return "/admin/company";
        }
        companyService.save(company);
        return "redirect:/admin/companies";
    }

    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String initCreationForm(Model model) {
        model.addAttribute("company", new Company());
        return "admin/company";
    }

    @RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
    public String initUpdateForm(@PathVariable String id, Model model) {
        model.addAttribute("company", companyService.findById(id));
        return "admin/company";
    }


    @RequestMapping(value = "/{id}/delete", method = RequestMethod.DELETE)
    public String delete(@PathVariable String id) {
        companyService.removeById(id);
        return "redirect:/admin/companies";
    }
}
