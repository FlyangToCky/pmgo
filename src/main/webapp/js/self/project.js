/**
 * Created by fangy on 2017/6/4.
 */
var id = ""; //用户id
var username = ""; //用户名
$(function () {
    checkLoginState();
    setTimeout(function () {
        getProjectList(id);
    },200);

    //新增项目，触发动画效果
    animationHover("#add_new_project","tada");
    //日期选择插件配置
    $("#time_plan_begin,#time_plan_end").datepicker({
        todayBtn: "linked",
        keyboardNavigation: false,
        forceParse: false,
        autoclose: true,
        format: "yyyy-mm-dd"
    });

//**********************************新建项目********************************
    var name, //项目名
        no, //项目编号
        time_plan_begin, //计划开始时间
        time_plan_end, //计划结束时间
        person_lead, //项目领导人
        person_create, //项目创建人
        budget, //预算
        intro="";  //项目简述
    var paramMap ={  //传递给后台的保存参数
        name:name,
        no:no,
        time_plan_begin:time_plan_begin,
        time_plan_end:time_plan_end,
        person_lead:person_lead,
        person_create:person_create, //登录人就是默认项目创建人
        budget:budget,
        intro:intro
    };
    //发送保存请求
    $("#save").click(function () {
        paramMap.name = $("#name").val();
        paramMap.no = $("#no").val();
        paramMap.time_plan_begin = $("#time_plan_begin").val();
        paramMap.time_plan_end = $("#time_plan_end").val();
        paramMap.person_lead = $("#person_lead").val();
        paramMap.person_create=id;
        paramMap.budget = $("#budget").val();
        paramMap.intro = $("#intro").val();
        $.post("/project/add", paramMap,function (data) {
            if(data.result){ //保存成功
                $('#myModal').modal('hide'); //关闭模态框
                addProject(
                    data.id, //项目主键Id
                    paramMap.name,
                    paramMap.no,
                    paramMap.time_plan_begin,
                    paramMap.time_plan_end,
                    paramMap.budget,
                    paramMap.intro,
                    username);
            }else{
                layer.alert("保存失败");
            }
        },'json');
    });

//*************************************系统登出******************************************
    $("#sign_out").click(function () {
        signOut();
    });
//*************************************跳转到主控制台************************************
    $(".enter").click(function () {
        console.log(11111111);
        window.location.href = "/html/main.html";
    });
});
function test() {
    console.log(11111111);
}
/**
 * 新增一个项目
 * @param name
 * @param no
 * @param time_plan_begin
 * @param time_plan_end
 * @param budget
 * @param intro
 * @param username
 */
function addProject(id,name,no,time_plan_begin,time_plan_end,budget,intro,username) {
    var day = GetDateDiff(time_plan_begin,time_plan_end);
    var str = '<div class="col-md-4 animated bounceInDown"><input type="hidden" value="'+id+'"><div class="ibox"><div class="ibox-title">'+
        '<span onclick="test" class="label label-primary pull-right">进入</span><h5>'+name+'</h5></div>'+
        '<div class="ibox-content"><div class="team-members"><a class="round-person2"><span id="username">'+username+'</span></a>' +
        '<a class="add-project" href="#"><img alt="member" src="../img/plus.png"></a></div><h4>项目简介</h4>'+
        '<p>'+intro+'</p><div><span>当前项目进度：</span><div class="stat-percent">1%</div><div class="progress progress-mini">'+
        '<div style="width: 1%;" class="progress-bar"></div></div></div><div class="row  m-t-sm"><div class="col-sm-4">'+
        '<div class="font-bold">人数</div>1</div><div class="col-sm-4">'+
        '<div class="font-bold">周期</div>'+day+'天</div><div class="col-sm-4 text-right">'+
        '<div class="font-bold">预算</div>&yen;'+budget+'<i class="fa fa-level-up text-navy"></i></div> </div> </div> </div> </div>';
    $("#add_new_project").before(str);
}
/**
 * 比较日期之间差多少天
 * @param startDate
 * @param endDate
 * @returns {number}
 */
function GetDateDiff(startDate,endDate) {
    var startTime = new Date(Date.parse(startDate.replace(/-/g,   "/"))).getTime();
    var endTime = new Date(Date.parse(endDate.replace(/-/g,   "/"))).getTime();
    var dates = Math.abs((startTime - endTime))/(1000*60*60*24);
    return  dates;
}
/**
 * 检测登录状态
 */
function checkLoginState() {
    $.post("/logIn/checkLoginState", {},function (data) {
       if(data.result.id !=null ){ //数据返回，已经处在登录状态
           //1.显示用户名
           $("#username").text(data.result.name);
           //2.全局id , username 赋值
           id = data.result.id;
           username = data.result.name;
       }else{
           //TODO 提示,倒计时
           layer.alert("请先登录");
           setTimeout(function () {
               window.location.href="/html/login.html";
           },1000);
       }
    },'json');
}
/**
 * 登出系统
 */
function signOut() {
    $.post("/logOut/signOut", {},function (data) {
        if(data.result){  //正常登出系统
            window.location.href="/html/login.html";
        }else { //异常情况
            layer.alert("系统异常，请重新登录");
            setTimeout(function () {
                window.location.href="/html/login.html";
            },1000);
        }
    },'json');
}

/**
 * 查询出列表
 * 拥有的项目和参与的项目
 * @param id
 */
function getProjectList(id) {
    var list =[];
    $.post("/project/findProjectsListByUserId", {"id":id},function (data) {
        if(data.result){ //有数据
            list = data.result;
            for(var i=0; i<list.length; i++){
                var project = list[i];
                addProject(
                    project.id,
                    project.name,
                    project.no,
                    project.time_plan_begin,
                    project.time_plan_end,
                    project.budget,
                    project.intro,
                    project.person_lead
                );
            }
        }
    },'json');
}
