package org.minispm.security.web;

import org.minispm.security.entity.Operation;
import org.minispm.security.service.OperationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-9-21
 * Time: PM4:53
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class DomainController {
    private OperationService operationService;

    @RequestMapping(value = "/security/domain/{DomainId}/operation/index", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Operation> findOperationsByDomain(@PathVariable("DomainId") String id){
        return operationService.findByDomain(id);
    }

    @Autowired
    public void setOperationService(OperationService operationService) {
        this.operationService = operationService;
    }
}
