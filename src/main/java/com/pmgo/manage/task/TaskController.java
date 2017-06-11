package com.pmgo.manage.task;

import com.jfinal.core.Controller;
import com.pmgo.common.model.SysUser;
import com.pmgo.common.model.UserTask;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by fangy on 2017/6/10.
 */
public class TaskController extends Controller {
    private TaskService service = new TaskService();

    //新增任务
    public void add() {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("name", getParaMap().get("name")[0]);
        paramMap.put("project_id", getParaMap().get("project_id")[0]);
        paramMap.put("user_id", ((SysUser) getSessionAttr("user")).getId());
        Map<String, Object> result = service.add(paramMap);
        result.put("username",((SysUser) getSessionAttr("user")).getName());
        renderJson("result", result);
    }
    //根据项目Id查询项目下的所有任务
    public void findListByProjectId() {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        String projectId = getParaMap().get("project_id")[0];
        List<UserTask> list = service.findListByProjectId(projectId);
        returnMap.put("list", list);
        renderJson("result", returnMap);
    }
    //更新项目状态
    public void changeTaskState(){
        boolean result = service.changeTaskState(getParaMap().get("id")[0],getParaMap().get("state")[0]);
        renderJson("result",result);
    }
}
