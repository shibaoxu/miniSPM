package org.minispm.sale.web;

import org.minispm.admin.organization.service.DepartmentService;
import org.minispm.admin.organization.service.OrganizationService;
import org.minispm.core.web.WebUtils;
import org.minispm.sale.service.ClosedReasonService;
import org.minispm.sale.service.OpportunityService;
import org.minispm.sale.service.SourceService;
import org.minispm.security.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-3-13
 * Time: 下午10:50
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("sale/opportunity")
public class OpportunityController {
    private OpportunityService opportunityService;
    private SourceService sourceService;
    private ClosedReasonService closedReasonService;
    private UserService userService;
    private DepartmentService departmentService;
    private OrganizationService organizationService;


    @RequestMapping("index")
    public String index(@RequestParam(value = "page", defaultValue = "1")int pageNumber,
                        @RequestParam(value = "search_condition", defaultValue = "")String condition,
                        Model model, ServletRequest request){
        model.addAttribute("searchParams", WebUtils.transParamsWithPrefix(request, "search_"));
        model.addAttribute("opportunities", opportunityService.findAll(pageNumber, condition));
        return "sale/opportunityList";
    }

    @RequestMapping("view/{id}")
    public String view(@PathVariable String id, Model model){
        initDictionary(model);
        model.addAttribute("opportunity", opportunityService.findByIdView(id));
        return "sale/opportunity";
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
    public void setOpportunityService(OpportunityService opportunityService) {
        this.opportunityService = opportunityService;
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
