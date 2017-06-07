package com.pmgo.manage.project;

import com.jfinal.core.Controller;
import com.pmgo.common.model.PmProject;

import java.util.List;
import java.util.Map;

/**
 * Created by fly on 2017/6/5.
 */
public class ProjectController extends Controller {
    private ProjectService service = new ProjectService();

    /**
     * 根据用户Id查找项目列表
     * 包括创建的项目和参与的项目
     */
    public void findProjectsListByUserId(){
        List<PmProject> resultList = service.findProjectsListByUserId(getParaMap());
        renderJson("result",resultList);
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
