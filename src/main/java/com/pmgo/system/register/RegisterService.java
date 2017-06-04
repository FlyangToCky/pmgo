package com.pmgo.system.register;

import com.pmgo.common.model.SysUser;
import com.pmgo.common.utils.MD5;
import com.pmgo.common.utils.StringUtil;

import java.util.Map;

/**
 * Created by fangy on 2017/6/4.
 */
public class RegisterService {

    /**
     * 根据用户手机号用户是否已经存在
     * @param phone 手机号
     * @return 手机号已经存在返回true，不存在返回false
     */
    public boolean findUserIsExistedByPhone(String phone){
         String sql = "SELECT `name` FROM t_sys_user WHERE `phone` =?";
         SysUser user= SysUser.dao.findFirst(sql,phone);
         if(user == null || StringUtil.isBlank(user.getName())){ //没有这个用户
             return false;
         }else{ //用户已经存在
             return true;
         }
    }
    //保存新用户
    public boolean registerNewUser(Map<String,String[]> paramMap){
        String name = paramMap.get("name")[0];
        String password = MD5.getStringMD5(paramMap.get("password")[0]);
        String phone = paramMap.get("phone")[0];
        if(findUserIsExistedByPhone(phone)){ //用户已近存在
            return false;
        }else{
            return new SysUser()
                    .setName(name)
                    .setPhone(phone)
                    .setPassword(password)
                    .save();
        }
    }
}
