/**
 * Created by fangy on 2017/6/4.
 */
$(function () {
    //新增项目 动画效果
    animationHover("#add_new_project","tada");
    //日期配置
    $("#time_plan_begin,#time_plan_end").datepicker({
        todayBtn: "linked",
        keyboardNavigation: false,
        forceParse: false,
        autoclose: true,
        format: "yyyy-mm-dd"
    });
    var name,
        no,
        time_plan_begin,
        time_plan_end,
        person_lead,
        budget,
        intro="";
    var paramMap ={
        name:name,
        no:no,
        time_plan_begin:time_plan_begin,
        time_plan_end:time_plan_end,
        person_lead:person_lead,
        budget:budget,
        intro:intro
    };
    //保存请求
    $("#save").click(function () {
        paramMap.name = $("#name").val();
        paramMap.no = $("#no").val();
        paramMap.time_plan_begin = $("#time_plan_begin").val();
        paramMap.time_plan_end = $("#time_plan_end").val();
        paramMap.person_lead = $("#person_lead").val();
        paramMap.budget = $("#budget").val();
        paramMap.intro = $("#intro").val();
        $.post("/project/add", paramMap,function (data) {
            if(data.result){ //保存成功
                $('#myModal').modal('hide'); //关闭模态框
                addProject(
                    data.id,
                    paramMap.name,
                    paramMap.no,
                    paramMap.time_plan_begin,
                    paramMap.time_plan_end,
                    paramMap.budget,
                    paramMap.intro);
            }else{
                layer.alert("保存失败");
            }
        },'json');
    });
});
/**
 * 新增一个项目
 * @param name
 * @param no
 * @param time_plan_begin
 * @param time_plan_end
 * @param budget
 * @param intro
 */
function addProject(id,name,no,time_plan_begin,time_plan_end,budget,intro) {
    var day = GetDateDiff(time_plan_begin,time_plan_end);
    var str = '<div class="col-md-4 animated bounceInDown"><input type="hidden" value="'+id+'"><div class="ibox"><div class="ibox-title">'+
        '<span class="label label-primary pull-right">编辑</span><h5>'+name+'</h5></div>'+
        '<div class="ibox-content"><div class="team-members"><a href="#"><img alt="member" class="img-circle" src="../img/a1.jpg"></a></div><h4>项目简介</h4>'+
        '<p>'+intro+'</p><div><span>当前项目进度：</span><div class="stat-percent">1%</div><div class="progress progress-mini">'+
        '<div style="width: 1%;" class="progress-bar"></div></div></div><div class="row  m-t-sm"><div class="col-sm-4">'+
        '<div class="font-bold">人数</div>0</div><div class="col-sm-4">'+
        '<div class="font-bold">周期</div>'+day+'天</div><div class="col-sm-4 text-right">'+
        '<div class="font-bold">预算</div>&yen;'+budget+'<i class="fa fa-level-up text-navy"></i></div> </div> </div> </div> </div>';
    $("#add_new_project").before(str);
}

function GetDateDiff(startDate,endDate)
{
    var startTime = new Date(Date.parse(startDate.replace(/-/g,   "/"))).getTime();
    var endTime = new Date(Date.parse(endDate.replace(/-/g,   "/"))).getTime();
    var dates = Math.abs((startTime - endTime))/(1000*60*60*24);
    return  dates;
}
