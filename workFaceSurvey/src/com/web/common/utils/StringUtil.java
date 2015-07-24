package com.web.common.utils;

import org.apache.commons.lang.StringUtils;


public class StringUtil {
	
    public static boolean isStrEmpty(String str) {
        return StringUtils.isEmpty(str);
    }

    public static boolean isStrTrimEmpty(String str) {
        return (str == null) || (str.trim().equals(""));
    }
    
    /**
     * 将传入的对象转换为字符串，当传入的对象为null时返回默认值
     *
     * @param o
     * @param dv
     * @return
     */
    public static String safeToString(Object o, String dv) {
        String r = dv;
        if (o != null) {
            r = String.valueOf(o);
        }
        return r;
    }
}
