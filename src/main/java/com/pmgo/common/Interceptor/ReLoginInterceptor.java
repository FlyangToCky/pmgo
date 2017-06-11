package com.pmgo.common.Interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.pmgo.common.Constants.ErrorCode;
import com.pmgo.common.model.SysUser;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by fangy on 2017/6/10.
 * 用于session超时，通知重新登录
 */
public class ReLoginInterceptor implements Interceptor{
    public void intercept(Invocation invocation) {
        SysUser user = invocation.getController().getSessionAttr("user") ;
        if(user == null){ //session不存在
            invocation.getController().redirect("/html/login.html");
            Map<String,Object> returnMap = new HashMap<String,Object>();
            returnMap.put("errorCode", ErrorCode.SESSSION_OVERTIME);
            invocation.getController().renderJson("result",returnMap);
        }
    }
}
