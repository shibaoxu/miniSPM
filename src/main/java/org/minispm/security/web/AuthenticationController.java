package org.minispm.security.web;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * User: shibaoxu
 * Date: 13-1-2
 * Time: 下午6:27
 */
@Controller
public class AuthenticationController {
    private static Logger logger = LoggerFactory.getLogger(AuthenticationController.class);

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        logger.debug("Getting login page.");
        return "security/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String fail(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, Model model) {
        logger.error("{} login failed.", userName);
        model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
        return "security/login";
    }

}
