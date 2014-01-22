package org.minispm.sale.web;

import org.minispm.admin.organization.entity.AccountabilityType;
import org.minispm.admin.organization.entity.Department;
import org.minispm.admin.organization.service.DepartmentService;
import org.minispm.admin.organization.service.OrganizationService;
import org.minispm.sale.entity.MarketAction;
import org.minispm.sale.service.ActionTypeService;
import org.minispm.sale.service.MarketActionService;
import org.minispm.security.service.UserService;
import org.minispm.security.utils.SecurityUtils;
import org.minispm.core.web.WebUtils;
import org.minispm.security.entity.User;
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
 * User: shibaoxu
 * Date: 13-1-21
 * Time: 下午6:08
 */
@Controller
@RequestMapping("/sale/market_action/")
public class MarketActionController {

    private MarketActionService marketActionService;
    private ActionTypeService actionTypeService;
    private DepartmentService departmentService;
    private OrganizationService organizationService;
    private UserService userService;

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String index(@RequestParam(value = "search_condition", defaultValue = "") String condition,
                        @RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model, ServletRequest request){
        model.addAttribute("searchParams", WebUtils.transParamsWithPrefix(request, "search_"));
        model.addAttribute("marketActions", marketActionService.getAll(pageNumber, condition));
        return "/sale/marketActionList";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable String id, Model model){
        model.addAttribute("operation", "edit");
        initDictionary(model);
        model.addAttribute("action", marketActionService.getByIdEdit(id));
        return "/sale/marketAction";
    }

    @RequestMapping(value = "view/{id}", method = RequestMethod.GET)
    public String view(@PathVariable String id, Model model){
        model.addAttribute("operation", "view");
        initDictionary(model);
        model.addAttribute("action", marketActionService.getByIdView(id));
        return "/sale/marketAction";
    }

    @RequestMapping(value = {"new"}, method = RequestMethod.POST)
    public String save(@ModelAttribute MarketAction action){
        marketActionService.save(action);
        return "redirect:/sale/market_action/index";
    }
    @RequestMapping(value = {"edit/{id}"}, method = RequestMethod.POST)
    public String update(@ModelAttribute MarketAction action){
        marketActionService.update(action);
        return "redirect:/sale/market_action/index";
    }


    @RequestMapping(value = "new", method = RequestMethod.GET)
    public String add(Model model){
        marketActionService.create();
        initDictionary(model);
        model.addAttribute("operation", "new");
        MarketAction action = new MarketAction();
        action.setDepartment(getBelongDepartment());
        User owner = new User();
        owner.setId(SecurityUtils.getCurrentShiroUser().getId());
        action.setOwner(owner);
        model.addAttribute("action", action);
        return "sale/marketAction";
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
        model.addAttribute("actionTypes", actionTypeService.findAll());
        model.addAttribute("users", userService.findAll());
        model.addAttribute("departments", departmentService.findAll());
    }

    private Department getBelongDepartment(){
        return  (Department)organizationService.getBelongOrg(SecurityUtils.getCurrentShiroUser().getStaff().getId(),AccountabilityType.SALE_ORG);
    }

    public MarketActionService getMarketActionService() {
        return marketActionService;
    }

    @Autowired
    public void setMarketActionService(MarketActionService marketActionService) {
        this.marketActionService = marketActionService;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setActionTypeService(ActionTypeService actionTypeService) {
        this.actionTypeService = actionTypeService;
    }

    @Autowired
    public void setOrganizationService(OrganizationService organizationService) {
        this.organizationService = organizationService;
    }

    @Autowired
    public void setDepartmentService(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }
}
