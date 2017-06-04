package com.pmgo.manage.requirement;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.pmgo.common.model.PmRequirement;

import java.util.Map;

/**
 * Created by fangy on 2017/6/3.
 */
public class RequirementController extends Controller {
    private  RequirementService service = new RequirementService();

    //新增记录
    public void save(){
         Map<String,String[]> getMap =getParaMap();
         boolean result =service.save(getMap);
         renderJson("result",result);
    }
}
