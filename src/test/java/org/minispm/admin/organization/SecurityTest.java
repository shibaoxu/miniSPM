package org.minispm.admin.organization;

import org.minispm.security.entity.Role;
import org.minispm.security.entity.User;
import org.minispm.security.service.UserService;
import org.minispm.util.SpringTransactionalTestCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;

import java.util.List;

/**
 * User: shibaoxu
 * Date: 13-1-19
 * Time: 下午6:51
 */
@ActiveProfiles("dev")
public class SecurityTest extends SpringTransactionalTestCase {
    @Autowired
    private UserService userService;
//
@org.junit.Test
    public void testUserAndRole(){
        User user = userService.findByJobNumber("12040");
        List<Role> roles = user.getRoles();
        org.junit.Assert.assertEquals(roles.size(), 1);
    }
}
