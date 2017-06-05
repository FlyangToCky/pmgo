package com.pmgo.manage.project;

import com.pmgo.common.model.PmProject;
import com.pmgo.common.utils.DateUtil;
import com.pmgo.common.utils.StringUtil;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 125 on 2017/6/5.
 */
public class ProjectService {

    /**
     * 根据用户ID查找用户的项目列表
     * （包括拥有的项目，参与的项目）
     * @param paramMap
     * @return
     */
    public List<PmProject> findProjectsListByUserId(Map<String,String[]> paramMap){
        return null;
    }

    /**
     * 新建项目
     * @param paramMap
     * @return 保存成功返回true 和 数据的Id，保存失败返回false
     */
    public Map<String,Object> add(Map<String,String[]> paramMap){
        String id = StringUtil.getUUID();
        Map<String,Object> returnMap = new HashMap<String,Object>();
        boolean result = new PmProject()
                .setId(id)
                .setName(paramMap.get("name")[0])
                .setNo(paramMap.get("no")[0])
                .setTimeCreate(DateUtil.parseDate(DateUtil.getDateTime(new Date())))
                .setTimePlanBegin(DateUtil.parseDate(paramMap.get("time_plan_begin")[0]))
                .setTimePlanEnd(DateUtil.parseDate(paramMap.get("time_plan_end")[0]))
                .setPersonLead(paramMap.get("person_lead")[0])
                .setPersonCreate("45645646545465456465465")
                .setBudget(new BigDecimal(paramMap.get("budget")[0]))
                .setIntro(paramMap.get("intro")[0])
                .save();
        if(result){ //保存成功
            returnMap.put("result",true);
            returnMap.put("id",id);
        }else{ //保存失败
            returnMap.put("result",false);
        }
        return returnMap;
    }
}
