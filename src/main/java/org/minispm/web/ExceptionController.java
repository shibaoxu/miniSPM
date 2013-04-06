package org.minispm.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletRequest;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-2-8
 * Time: 上午8:52
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class ExceptionController {

//    @ExceptionHandler(AuthorizationException.class)
    @ExceptionHandler(Exception.class)
//    public String handleAuthorizationException(AuthorizationException ex, HttpServletRequest request){
        public String handleAuthorizationException(Exception ex, HttpServletRequest request){
        System.out.println("error");
        return "exception";
    }
}
