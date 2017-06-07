/**
 * Created by fangy on 2017/6/4.
 */
$(function () {
    var name,phone,pwd,pwd2="";
    var paramMap ={
        name:name,
        phone:phone,
        password:pwd2
    };
    $("#register").click(function () {
        paramMap.name = $("#name").val();
        paramMap.phone = $("#phone").val();
        paramMap.password = $("#pwd2").val();
        $.post("/register/add", paramMap,function (data) {
            if(data.result){
                layer.alert("注册成功");
                setTimeout(function () {
                    window.location.href='/html/login.html';
                },1000);
            }else{
                layer.alert("手机号已存在");
            }
        },'json');
    });
});
