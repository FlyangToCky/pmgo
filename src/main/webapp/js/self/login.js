/**
 * Created by fangy on 2017/6/4.
 */
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
                console.log(data.result);
                window.location.href="/html/main.html";
            },'json');
        }
    });
});
