package org.minispm.sale.web;

import org.minispm.sale.entity.Customer;
import org.minispm.sale.service.CustomerService;
import org.minispm.core.web.WebUtils;
import org.minispm.sale.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletRequest;
import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-12-29
 * Time: 下午6:39
 */
@Controller
public class CustomerController {

    private CustomerService customerService;
    private DictionaryService dictionaryService;

    @RequestMapping(value = "/sale/customer/index",  produces = "application/json")
    @ResponseBody
    public List<Customer> getAllJSON(@RequestParam(value = "search_LIKE_name", defaultValue = "") String searchName){
        return  customerService.findAll(searchName);
    }

    @RequestMapping(value = "/sale/customer/index", method = RequestMethod.GET)
    public String index(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
                        @RequestParam(value = "search_LIKE_name", defaultValue = "") String searchName,
                        Model model, ServletRequest request){
        model.addAttribute("searchParams", WebUtils.transParamsWithPrefix(request, "search_"));
        model.addAttribute("customers", customerService.findAll(pageNumber, searchName));
        return "/sale/customerList";
    }

    @RequestMapping(value = "/sale/customer/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable String id, Model model){
        model.addAttribute("customer", customerService.getById(id));
        initDictionary(model);
        return "sale/customer";
    }

    @RequestMapping(value = "/sale/customer/new", method = RequestMethod.GET)
    public String add(Model model){
        model.addAttribute("customer", new Customer());
        initDictionary(model);
        return "sale/customer";
    }
    @RequestMapping(value = {"/sale/customer/{id}","/sale/customer/new"}, method = RequestMethod.POST)
    public String save(@ModelAttribute Customer customer){
        customerService.save(customer);
        return "redirect:/sale/customer/index";
    }

    @RequestMapping(value = "/sale/customer/{id}/remove", method = RequestMethod.GET)
    public String remove(@PathVariable String id){
        customerService.remove(id);
        return "redirect:/sale/customer/index";
    }



    private void initDictionary(Model model){
        model.addAttribute("industries", dictionaryService.getAllIndustry());
        model.addAttribute("scales", dictionaryService.getAllScale());
        model.addAttribute("ownerships", dictionaryService.getAllOwnership());
    }

    public CustomerService getCustomerService() {
        return customerService;
    }

    @Autowired
    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    public DictionaryService getDictionaryService() {
        return dictionaryService;
    }

    @Autowired
    public void setDictionaryService(DictionaryService dictionaryService) {
        this.dictionaryService = dictionaryService;
    }
}
