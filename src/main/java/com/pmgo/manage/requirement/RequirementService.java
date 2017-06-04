package com.pmgo.manage.requirement;

import com.jfinal.plugin.activerecord.Page;
import com.pmgo.common.model.PmRequirement;

import java.util.Map;

/**
 * Created by fangy on 2017/6/3.
 */
public class RequirementService {
    //DAO
    public static  final PmRequirement dao =  new PmRequirement().dao();

    //分页查询
    public Page<PmRequirement> paginate(int pageNumber, int pageSize) {
        return dao.paginate(pageNumber, pageSize, "select *", "from blog order by id asc");
    }

    //根据主键Id查询
    public PmRequirement findById(int id){
        return dao.findById(id);
    }

    //新增记录
    public boolean save(Map<String,String[]> paramMap){
        return new PmRequirement().setCode(paramMap.get("code")[0])
                .setModule(paramMap.get("module")[0])
                .setChildModule(paramMap.get("child_module")[0])
                .save();
    }
}
