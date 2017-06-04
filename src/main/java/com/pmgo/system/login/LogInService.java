package com.pmgo.system.login;

import com.pmgo.common.model.SysUser;
import com.pmgo.common.utils.MD5;

import java.util.Map;

/**
 * Created by fangy on 2017/6/4.
 */
public class LogInService {
    /**
     * 用户登录
     * @param paramMap phone，password
     * @return 登录成功返回true，登录失败返回false
     */
    public boolean entry(Map<String,String[]> paramMap){
        String passwordFromInput = MD5.getStringMD5(paramMap.get("password")[0]); //获取输入的密码
        String sql = "SELECT `password` FROM t_sys_user WHERE `phone` =?";
        SysUser user = SysUser.dao.findFirst(sql,paramMap.get("phone")[0]);
        if(user != null){ //存在这个用户
            String passwordFromDB = user.getPassword();
            if(passwordFromDB.equals(passwordFromInput)){ //密码验证成功
                return true;
            }else{  //密码错误
                return false;
            }
        }else{ //用户不存在
            return false;
        }
    }
}
