package com.pmgo.manage.project;

import com.jfinal.core.Controller;

import java.util.Map;

/**
 * Created by fly on 2017/6/5.
 */
public class ProjectController extends Controller {
    private ProjectService service = new ProjectService();

    /**
     * 发现项目列表
     */
    public void findProjectsList(){

    }

    /**
     * 新建项目
     * 保存成功返回true 和 数据的Id，保存失败返回false
     */
    public void add(){
        Map<String,Object> resultFromService = service.add(getParaMap());
        renderJson(resultFromService);
    }
}
