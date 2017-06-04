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
            alert(data.result);
        },'json');
    });
});
