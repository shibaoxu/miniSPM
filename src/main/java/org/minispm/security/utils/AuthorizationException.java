package org.minispm.security.utils;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-2-7
 * Time: 下午4:27
 * To change this template use File | Settings | File Templates.
 */
public class AuthorizationException extends RuntimeException {
    public AuthorizationException(String message){
        super(message);
    }
}
