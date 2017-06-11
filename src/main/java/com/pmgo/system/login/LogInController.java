package com.pmgo.system.login;

import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import com.pmgo.common.Interceptor.ReLoginInterceptor;
import com.pmgo.common.model.SysUser;

import java.util.Map;

/**
 * Created by fangy on 2017/6/4.
 */
@Clear(ReLoginInterceptor.class)
public class LogInController extends Controller {
    private LogInService service = new LogInService();
    //进入登录页
    public void index() {
        render("login.html");
    }

    //登录
    public void entry(){
        Map<String,Object> getMapFromDB = service.entry(getParaMap());
        if((Boolean)getMapFromDB.get("result")){ //登陆成功的情况下
            setSessionAttr("user",(SysUser)getMapFromDB.get("data"));  //将用户数据，放在session中
        }
        renderJson("result",getMapFromDB);
    }

    //检查登录状态
    public void checkLoginState(){
        //从session中取出状态
        SysUser user = getSessionAttr("user");
        if(user != null ){ //已经登录了
            renderJson("result",user);
        }else{
            renderJson("result",false);
        }
    }
}
