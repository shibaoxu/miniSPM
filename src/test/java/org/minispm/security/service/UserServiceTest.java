package org.minispm.security.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.minispm.security.entity.User;
import org.minispm.utils.AbstractServiceTests;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by shibaoxu on 14-3-27.
 */
@ActiveProfiles("dev")
public class UserServiceTest extends AbstractServiceTests {

    @Autowired
    private UserService userService;

    @Test
    public void findByJobNumber(){
        User user = userService.findByJobNumber("12039");
        assertNotNull(user);
    }
}
