package com.pmgo.system.login;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import com.pmgo.common.model.SysUser;

/**
 * Created by 125 on 2017/6/6.
 */
public class LoginValidator extends Validator {

    protected void validate(Controller c) {
        //从Session中获取用户对象
        SysUser user =c.getSessionAttr("user");
        if(user !=null){ //已经登录了
            c.redirect("/html/login.html");
        }
    }

    protected void handleError(Controller c) {

    }
}
