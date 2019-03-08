package com.redrain.dao;

import java.util.List;

import com.redrain.model.Award;
import com.redrain.model.Info;

public interface AwardMapper {
    int deleteByPrimaryKey(Integer awardid);

    int insert(Award record);

    int insertSelective(Award record);

    Award selectByPrimaryKey(Integer awardid);

    int updateByPrimaryKeySelective(Award record);

    int updateByPrimaryKey(Award record);
    
    List<Award> selectList(Award record);
    
    List<Award> selectCount(Award record);
    
    List<Award> selectAll();
}