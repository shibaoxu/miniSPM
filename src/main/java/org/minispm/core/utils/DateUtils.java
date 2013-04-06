package org.minispm.core.utils;

import org.omg.CORBA.PUBLIC_MEMBER;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * User: shibaoxu
 * Date: 13-1-28
 * Time: 下午6:50
 */
public class DateUtils {
    public static final String DATE_FORMAT = "yyyy-MM-dd";
    public static final String TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
    public static SimpleDateFormat dateFormat = new SimpleDateFormat(DATE_FORMAT);
    public static SimpleDateFormat timeFormat = new SimpleDateFormat(TIME_FORMAT);
    public static String formatDate(Date date){
        return dateFormat.format(date);
    }

    public static String timeFormat(Date date){
        return timeFormat.format(date);
    }
}
