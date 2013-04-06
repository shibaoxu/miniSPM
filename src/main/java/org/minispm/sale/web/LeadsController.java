package org.minispm.sale.web;

import org.minispm.security.service.UserService;
import org.minispm.admin.organization.entity.AccountabilityType;
import org.minispm.admin.organization.entity.Department;
import org.minispm.admin.organization.service.DepartmentService;
import org.minispm.admin.organization.service.OrganizationService;
import org.minispm.core.web.WebUtils;
import org.minispm.sale.entity.Leads;
import org.minispm.sale.service.ClosedReasonService;
import org.minispm.sale.service.LeadsService;
import org.minispm.sale.service.SourceService;
import org.minispm.security.entity.User;
import org.minispm.security.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * User: shibaoxu
 * Date: 12-12-16
 * Time: 下午5:22
 */
@Controller
public class LeadsController {
    private LeadsService leadsService;
    private SourceService sourceService;
    private ClosedReasonService closedReasonService;
    private UserService userService;
    private DepartmentService departmentService;
    private OrganizationService organizationService;
    @RequestMapping("sale/index")
    public String index(){
        return "/sale/index";
    }

    @RequestMapping("sale/leads/index")
    public String getLeads(@RequestParam(value = "search_condition", defaultValue = "") String condition,
                           @RequestParam(value = "page", defaultValue = "1") int pageNumber,
                           Model model, ServletRequest request){
        Page<Leads> leadses = leadsService.findAll(pageNumber, condition);
        model.addAttribute("searchParams", WebUtils.transParamsWithPrefix(request, "search_"));
        model.addAttribute("leadses", leadses);
        return "/sale/leadsList";
    }

    @RequestMapping(value = "sale/leads/new", method = RequestMethod.GET)
    public String add(Model model){
        initDictionary(model);
        Leads leads = new Leads();
        leads.setDepartment((Department)organizationService.getBelongOrg(AccountabilityType.SALE_ORG, SecurityUtils.getCurrentShiroUser().getStaff().getId()));
        User owner = new User();
        owner.setId(SecurityUtils.getCurrentShiroUser().getId());
        leads.setOwner(owner);
        model.addAttribute("leads", leads);
        model.addAttribute("operation", "add");
        return "/sale/leads";
    }

    @RequestMapping("sale/leads/view/{id}")
    public String view(@PathVariable String id, Model model){
        initDictionary(model);
        Leads leads = leadsService.findByIdView(id);
        model.addAttribute("leads", leads);
        model.addAttribute("operation", "view");
        return "/sale/leads";
    }

    @RequestMapping(value = "sale/leads/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable String id, Model model){
        initDictionary(model);
        Leads leads = leadsService.findByIdEdit(id);
        model.addAttribute("leads", leads);
        model.addAttribute("operation", "edit");
        return "/sale/leads";
    }
    @RequestMapping(value = {"sale/leads/new", "sale/leads/edit/{id}"}, method = RequestMethod.POST)
    public String save(@ModelAttribute Leads leads){
        leadsService.save(leads);
        return "redirect:/sale/leads/index";
    }

    @RequestMapping(value = {"sale/leads/convertToOpportunity/{leadsId}"}, method = RequestMethod.GET)
    public String convertToOpportunity(@PathVariable("leadsId") String leadsId, Model model){
        Leads leads = leadsService.findByIdView(leadsId);
        model.addAttribute("id", leads.getId());
        model.addAttribute("lowAmount", leads.getLowAmount());
        model.addAttribute("highAmount", leads.getHighAmount());
        model.addAttribute("planDealDate", new Date());

        return "/sale/convertToOpportunity";
    }

    @RequestMapping(value = {"sale/leads/convertToOpportunity/{leadsId}"}, method = RequestMethod.POST)
    public String convertToOpportunity(@RequestParam("leadsId") String leadsId,
                                       @RequestParam("lowAmount")double lowAmount,
                                       @RequestParam("highAmount")double highAmount,
                                       @RequestParam("planDealDate") Date planDealDate){
        leadsService.convertToOpportunity(leadsId, planDealDate, lowAmount, highAmount);
        return "redirect:/sale/leads/index";
    }


    @InitBinder
    private void dateBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
        binder.registerCustomEditor(Date.class, editor);
    }

    @ExceptionHandler
    public ModelAndView exceptionHandler(Exception ex){
        ModelAndView mv = new ModelAndView();
        mv.getModel().put("message", ex.getMessage());
        mv.setViewName("exception");
        return mv;
    }
    private void initDictionary(Model model){
        model.addAttribute("sources", sourceService.findAll());
        model.addAttribute("closedReasons", closedReasonService.findAll());
        model.addAttribute("users", userService.findAll());
        model.addAttribute("departments", departmentService.findAll());

    }

    @Autowired
    public void setLeadsService(LeadsService leadsService) {
        this.leadsService = leadsService;
    }

    @Autowired
    public void setSourceService(SourceService sourceService) {
        this.sourceService = sourceService;
    }

    @Autowired
    public void setClosedReasonService(ClosedReasonService closedReasonService) {
        this.closedReasonService = closedReasonService;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setDepartmentService(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }

    @Autowired
    public void setOrganizationService(OrganizationService organizationService) {
        this.organizationService = organizationService;
    }
}
