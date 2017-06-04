package com.pmgo.system.login;

import com.jfinal.core.Controller;

/**
 * Created by fangy on 2017/6/4.
 */
public class LogInController extends Controller {
    //进入登录页
    public void index() {
        render("login.html");
    }
    //登录

}
