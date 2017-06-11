package com.pmgo.manage.task;

import com.jfinal.plugin.activerecord.Db;
import com.pmgo.common.model.UserTask;
import com.pmgo.common.utils.DateUtil;
import com.pmgo.common.utils.StringUtil;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by fangy on 2017/6/10.
 */
public class TaskService {
    /**
     * 新增一项任务
     * 成功返回true，失败返回false
     * @param paramMap
     *          name 任务名
     *          project_id 项目Id
     *          user_id 用户Id
     * @return boolean
     */
    public Map<String,Object> add(Map<String,Object> paramMap ){
        String id = StringUtil.getUUID();
        Date time = DateUtil.parseDate(DateUtil.getDate(new Date()));
        boolean result = new UserTask()
                .setId(id)
                .setName((String) paramMap.get("name"))
                .setTimeBegin(time)
                .setLevel("01")
                .setState("01")
                .setProjectId((String) paramMap.get("project_id"))
                .setUserId((String) paramMap.get("user_id"))
                .save();
        Map<String,Object> returnMap = new HashMap<String,Object>();
        returnMap.put("result",result);
        returnMap.put("id",id);
        returnMap.put("time",time);
        return  returnMap;
    }

    /**
     * 根据项目Id 查询项目下的任务
     * @param projectId 项目Id
     * @return List<UserTask> 项目下的所有任务
     */
    public List<UserTask> findListByProjectId(String projectId){
        Map<String,Object> returnMap = new HashMap<String,Object>();
        String sql= "SELECT t.*,u.`name` username FROM t_user_task t,t_sys_user u WHERE  t.user_id = u.id AND t.project_id = ?";
        return UserTask.dao.find(sql ,projectId);
    }

    /**
     * 更新任务状态
     * @param id
     * @param state
     * @return 保存成功返回true，保存失败返回false
     */
    public boolean changeTaskState(String id,String state){
        String sql ="UPDATE t_user_task SET state = ? WHERE id = ?";
        int num = Db.update(sql,state,id);
        if( num >0 ){//保存成功
            return true;
        }else {//保存失败
            return false;
        }
    }
}
