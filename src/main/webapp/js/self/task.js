/**
 * Created by fangy on 2017/6/10.
 */
$(function () {
    //拖动任务
    $(".sortable-list").sortable({
        connectWith: ".connectList",
        delay: 150,
        /*start:function ( event, ui ) {
           console.log(ui.item.parents("div[class='col-sm-4']").attr("id"));
        },*/
        stop: function( event, ui ) {
            var id = ui.item.children("input[type='hidden']").val();
            var parent = ui.item.parents("div[class='col-sm-4']").attr("id");
            var state ="";
            if(parent == "waitingList"){
                state = "01";
            }else if(parent == "doingList"){
                state ="02";
            }else if(parent =="finshedList"){
                state ="03";
            }
            changeState(id, state);
        }
    }).disableSelection();
    //TODO 拖动完成后，改变任务排序

    /*
     * 新增任务需要的参数
     */
    var name, //项目名
        project_id=sessionStorage.getItem("project_id"); //任务Id
    var paramMap = {
        name: name,
        project_id: project_id
    }
    $("#add").click(function () {
        paramMap.name = $("#task_name").val();
        $.post("/task/add", paramMap ,function (data) {
            if(data.result.result == true){  //保存成功
                layer.alert("保存成功");
                $("#task_name").val("");
                showOneTask(data.result.id,"01","01",paramMap.name,data.result.username,data.result.time);
            }else if(data.result.errorCode === "0000"){
                relogin();
            }
        },'json');
    });
    //获取任务列表
    findListByProjectId(project_id);
});

/**
 * 修改任务状态
 * @param id 任务id
 * @param state 修改的状态 01 02 03
 */
function changeState(id,state) {
    $.post("/task/changeTaskState",{id:id,state:state},function (data) {
        if(data.result == true){//修改成功

        }else{
            layer.alert("修改失败");
        }
    },'json');
}

/**
 * 查询出所有任务列表，并分类
 * @param project_id
 * @returns {{waitingList 待处理的任务: Array
 *          , doingList 进行中的任务: Array
 *          , finshedList 已完成的任务: Array
 *          , username 任务创建者 String}}
 */
function findListByProjectId(project_id) {
    var allList = []; //所有的任务
    var waitingList= []; //待处理的任务
    var doingList =[]; //进行中的任务
    var finshedList =[]; //已完成的任务
    $.post("/task/findListByProjectId", {project_id:project_id} ,function (data) {
        if(data.result.list){
            if(data.result.list.length>0){
                allList = data.result.list;
                for (var i=0;i<allList.length;i++){
                    var one = allList[i];
                    switch (one.state){
                        case "01": //待处理的任务
                            waitingList.push(one);
                            break;
                        case "02": //进行中的任务
                            doingList.push(one);
                            break;
                        case "03": //已完成的任务
                            finshedList.push(one);
                            break;
                        default:
                            break;
                    }
                }
                //显示任务列表
                showTaskList(waitingList,doingList,finshedList);
            }
        }else if(data.result.errorCode === "0000"){
            relogin();
        }
    },'json');
}

/**
 * 重新登陆
 */
function relogin() {
    layer.alert("请重新登录");
    setTimeout(function () {
        window.location.href = "/html/login.html" ;
    },1000);
}
/**
 * 显示一个任务
 * @param id 任务主键Id
 * @param state 任务类型 01待处理 02进行中 03已完成
 * @param level 任务状态 01默认 02普通 03中等 04紧急
 * @param name 任务名
 * @param user 任务创建者
 * @param time 任务创建时间
 */
function showOneTask(id,state,level,name,user,time) {
    var styleStr= ""; //任务状态标记颜色
    switch (level){ //任务状态，决定颜色
        case "01"://默认
            styleStr ='info-element';
            break;
        case "02"://普通
            styleStr='success-element';
            break;
        case "03"://中等
            styleStr='warning-element';
            break;
        case "04"://紧急
            styleStr="danger-element";
            break;
        default:
            break;
    }
    //拼接html片段
    var str = '<li class="row ' +styleStr+' animated fadeInLeft">' +
        '<input type="hidden" value="'+id+'"><div class="row"><div class="col-sm-9">'+
        name+'</div><div class="col-sm-3"><span class="pull-right task-round-person">'+
        user+'</span></div></div> <div class="row agile-detail"> <div class="col-sm-9">'+
        '<i class="fa fa-clock-o"></i>'+time+'</div><div class="col-sm-3">'+
        '<a href="#" class="pull-right btn btn-xs btn-white">详情</a>'+
        '</div></div></li>';
    //TODO time后面可以处理提醒时间
    switch (state){//根据任务类型，决定放在哪一列
        case "01"://待处理
            $("#waitingList ul").append(str);
            break;
        case "02"://处理中
            $("#doingList ul").append(str);
            break;
        case "03"://已结束
            $("#finshedList ul").append(str);
            break;
    }
}
/**
 * 显示出任务列表
 * @param waitingList 待处理任务列表
 * @param doingList 进行中任务列表
 * @param finshedList 已完成任务列表
 */
function showTaskList(waitingList,doingList,finshedList) {
    if(waitingList.length>0){
        for(var i=0;i<waitingList.length;i++){
            var waitingOne =waitingList[i];
            showOneTask(waitingOne.id,"01",waitingOne.level,waitingOne.name,waitingOne.username,waitingOne.time_begin);
        }
    }
    if(doingList.length>0){
        for(var j=0;j<doingList.length;j++){
            var doingOne =doingList[j];
            showOneTask(doingOne.id,"02",doingOne.level,doingOne.name,doingOne.username,doingOne.time_begin);
        }
    }
    if(finshedList.length>0){
        for(var k=0;k<finshedList.length;k++){
            var finisnedOne =finshedList[k];
            showOneTask(finisnedOne.id,"03",finisnedOne.level,finisnedOne.name,finisnedOne.username,finisnedOne.time_begin);
        }
    }
}