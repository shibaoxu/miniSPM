package org.minispm.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * User: shibaoxu
 * Date: 12-12-15
 * Time: 下午1:49
 */
@Controller
public class AdminController {
    @RequestMapping("/admin/index")
    public String index(){
        return "admin/index";
    }
}
