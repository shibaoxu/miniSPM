package org.minispm.security.web;

import org.minispm.admin.organization.service.StaffService;
import org.minispm.security.entity.User;
import org.minispm.security.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-11-28
 * Time: 下午10:12
 */
@Controller
@RequestMapping(value = "/security/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private StaffService staffService;

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String list(Model model){
        List<User> users = userService.findAll();
        model.addAttribute("users", users);
        return "/security/userList";
    }

    @ResponseBody
    @RequestMapping(value = "index", method = RequestMethod.GET, produces = "application/json")
    public List<User> listForJJSON(String condition){
        return userService.findAll();
    }

    @RequestMapping(value = "{id}", method = RequestMethod.GET)
    public String viewAndEdit(@PathVariable String id, Model model){
        model.addAttribute("user", userService.findById(id));
        initDictionary(model);
        return "/security/user";
    }

    @RequestMapping(value = "new", method = RequestMethod.GET)
    public String add(Model model){
        initDictionary(model);
        model.addAttribute("user", new User());
        return "/security/user";
    }

    @RequestMapping(value = {"{id}","new"}, method = RequestMethod.POST)
    public String save(User user){
        userService.save(user);
        return "redirect:/security/user/index";
    }

    @RequestMapping(value = "/chgpwd", method = RequestMethod.GET)
    public String changePassword(){
        return "/security/chgpwd";
    }

    @RequestMapping(value = "/chgpwd", method = RequestMethod.POST)
    public String changePassword( String oldPassword,  String newPassword){
        userService.changePassword(oldPassword,newPassword);
        return "redirect:/index";
    }

    @ExceptionHandler
    public ModelAndView exceptionHandler(Exception ex){
        ModelAndView mv = new ModelAndView();
        mv.getModel().put("message", ex.getMessage());
        mv.setViewName("exception");
        return mv;
    }
    private void initDictionary(Model model){
        model.addAttribute("staffs", staffService.findAllStaff());
    }

    public UserService getUserService() {
        return userService;
    }


    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
