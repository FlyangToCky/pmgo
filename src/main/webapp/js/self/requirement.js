/**
 * Created by fly on 2017/6/2.
 */
//配置表格
$('#table').bootstrapTable({
    undefinedText:"-",
    striped:true, //条纹
    search:true, // 开启搜索框
    //"searchText":"搜索需求内容", //初始化搜索文字
    searchTimeOut:500, //搜索超时时间
    pagination:true, //显示分页条
    pageNumber:1, //分页首页页码
    pageSize:10, //页面数据条数
    pageList:[10, 25, 50, 100],
    showRefresh:true, //显示刷新按钮
    showToggle:true, //显示列表和详情的切换
    showColumns:true, //显示列选择
    toolbar:"#toolbar", //显示自定义工具条
    paginationPreText:"上一页",
    paginationNextText:"下一页",
    paginationFirstText:"首页",
    paginationLastText:"尾页",
    columns : [
        {
            checkbox: true,
        },
        {
            field: 'id',
            title: '序号',
            align: 'center',
            width: '80px'
        }, {
            field: 'code',
            title: '需求编号',
            align: 'center',
            sortable:false,   //本列不可以排序
            width: '180px'
        }, {
            field: 'module',
            title: '模块',
            align: 'center',
            width:'200px'
        }, {
            field: 'child_module',
            title: '子模块',
            align: 'center',
            width: '180px'
        }, {
            field: 'function',
            title: '功能',
            align: 'center',
            halign:'center', //设置表头列居中对齐,
            width: '180px'
        }, {
            field: 'desc_assignment',
            title: '任务描述',
            align: 'center',
            width: '180px'
        }, {
            field: 'desc_value',
            title: '价值描述',
            align: 'center',
            width: '180px'
        },{
            field: 'requirement_level',
            title: '需求层次',
            align: 'center',
            width: '180px'
        }, {
            field: 'priority',
            title: '优先级',
            align: 'center',
            width: '180px'
        }, {
            field: 'time_commit',
            title: '提交时间',
            align: 'center',
            sortable:true,
            width: '180px'
        }, {
            field: 'time_input',
            title: '录入时间',
            align: 'center',
            width: '180px'
        }, {
            field: 'time_publish',
            title: '发布时间',
            align: 'center',
            width: '180px'
            //formatter: operateFormatter //自定义方法，添加操作按钮
        }, {
            field: 'person_commit',
            title: '提交人',
            align: 'center',
            width: '180px'
        }, {
            field: 'person_director',
            title: '需求负责人',
            align: 'center',
            width: '180px'
        }, {
            field: 'person_tester',
            title: '测试负责人',
            align: 'center',
            width: '180px'
        },{
            field: 'person_operate',
            title: '运营负责人',
            align: 'center',
            width: '180px'
        }, {
            field: 'count_develop',
            title: '开发量',
            align: 'center',
            width: '180px'
        }, {
            field: 'cost_performance',
            title: '性价比',
            align: 'center',
            width: '180px'
        },{
            field: 'state',
            title: '状态',
            align: 'center',
            width: '180px'
        }, {
            field: 'mem',
            title: '备注',
            align: 'center',
            width: '180px'
        }
    ],
    data: [{
        id: 1,
        code: 'zly_2015-10-05_00001',
        module: '测试内容，\r这里其实特么的有很多啊，\r能不能不要随便换行啊我擦',
        time_commit:"2015-10-06"
    }, {
        id: 2,
        code: 'zly_2015-10-05_00002',
        module: '测试2',
        time_commit: '2015-10-07'
    }, {
        id: 2,
        code: 'zly_2015-10-05_00002',
        module: '测试2',
        time_commit: '2015-10-07'
    }, {
        id: 2,
        code: 'zly_2015-10-05_00002',
        module: '测试2',
        time_commit: '2015-10-07'
    }, {
        id: 2,
        code: 'zly_2015-10-05_00002',
        module: '测试2',
        time_commit: '2015-10-07'
    }, {
        id: 2,
        code: 'zly_2015-10-05_00002',
        module: '测试2',
        time_commit: '2015-10-07'
    }, {
        id: 2,
        code: 'zly_2015-10-05_00002',
        module: '测试2',
        time_commit: '2015-10-07'
    }, {
        id: 2,
        code: 'zly_2015-10-05_00002',
        module: '测试2',
        time_commit: '2015-10-07'
    }, {
        id: 2,
        code: 'zly_2015-10-05_00002',
        module: '测试2',
        time_commit: '2015-10-07'
    }, {
        id: 2,
        code: 'zly_2015-10-05_00002',
        module: '测试2',
        time_commit: '2015-10-07'
    }, {
        id: 2,
        code: 'zly_2015-10-05_00002',
        module: '测试2',
        time_commit: '2015-10-07'
    }, {
        id: 2,
        code: 'zly_2015-10-05_00002',
        module: '测试2',
        time_commit: '2015-10-07'
    }]
});
$(function () {
  $("#btn_add").click(function () {
      layer.open({
          type: 2,
          content: 'requirement_add.html' //这里content是一个普通的String
      });
  });
});

