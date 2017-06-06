package com.pmgo.system.logout;

import com.jfinal.core.Controller;

/**
 * Created by fangy on 2017/6/4.
 */
public class LogOutController extends Controller {
    //登出，清理session中的用户信息
    public void signOut(){
        setSessionAttr("user",null);
        renderJson("result",true);
    }
}
