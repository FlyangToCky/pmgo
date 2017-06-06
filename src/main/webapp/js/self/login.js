/**
 * Created by fangy on 2017/6/4.
 */
//检测登录状态
$(function () {
    var phone,password="";
    var paramMap ={
        phone:phone,
        password:password
    };
    $("#login").click(function () {
        phone = $("#phone").val();
        password = $("#password").val();
        if( phone =="" || password == "" ){ //手机号或者密码为空
            return;
        }else { //登录请求
            paramMap.phone = phone;
            paramMap.password = password;
            $.post("/logIn/entry", paramMap,function (data) {
                if(data.result.result){ //登录成功
                    window.location.href="/html/project.html";
                }else{ //登录失败
                    layer.alert(data.result.error);
                }
            },'json');
        }
    });
});
