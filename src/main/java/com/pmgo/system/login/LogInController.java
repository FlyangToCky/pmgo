package com.pmgo.system.login;

import com.jfinal.core.Controller;

/**
 * Created by fangy on 2017/6/4.
 */
public class LogInController extends Controller {
    private LogInService service = new LogInService();
    //进入登录页
    public void index() {
        render("login.html");
    }

    //登录
    public void entry(){
        boolean result = service.entry(getParaMap());
        if(result){ //登陆成功的情况下
            setSessionAttr("phone",getParaMap().get("phone")[0]);
        }
        renderJson("result",result);
    }

}
