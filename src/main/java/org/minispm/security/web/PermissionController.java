package org.minispm.security.web;

import org.minispm.security.entity.Permission;
import org.minispm.security.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-2-10
 * Time: 下午3:27
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/security/permission")
public class PermissionController {

    private PermissionService permissionService;
    @RequestMapping(value = "index", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Permission> getAll(){
        return permissionService.getAll();
    }

    @Autowired
    public void setPermissionService(PermissionService permissionService) {
        this.permissionService = permissionService;
    }
}
