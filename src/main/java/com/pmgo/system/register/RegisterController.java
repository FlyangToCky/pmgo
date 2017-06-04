package com.pmgo.system.register;

import com.jfinal.core.Controller;

import java.util.Map;

/**
 * Created by fangy on 2017/6/4.
 */
public class RegisterController extends Controller {
    private RegisterService service = new RegisterService();
    //进入注册页
    /*public void index() {
        render("register.html");
    }*/

    /**
     * 根据用户手机号用户是否已经存在
     * @param phone 手机号
     * @return 手机号已经存在返回true，不存在返回false
     */
    public void findUserIsExistedByPhone(){
        boolean result = service.findUserIsExistedByPhone(getParaMap().get("phone")[0]);
        renderJson("result",result);
    }

    /**
     * 注册新用户
     * @param  name,password,phone
     * @return 成功返回true，失败返回false
     */
    public void add(){
        boolean result = service.registerNewUser(getParaMap());
        renderJson("result",result);
    }

}
