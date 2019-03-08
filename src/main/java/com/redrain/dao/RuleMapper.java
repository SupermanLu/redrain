package com.redrain.dao;

import java.util.List;

import com.redrain.model.Rule;

public interface RuleMapper {
    int deleteByPrimaryKey(String ruleid);

    int insert(Rule record);

    int insertSelective(Rule record);

    Rule selectByPrimaryKey(String ruleid);

    int updateByPrimaryKeySelective(Rule record);

    int updateByPrimaryKeyWithBLOBs(Rule record);
    
    List<Rule> selectAllRule();
    
    List<Rule> selectRule(Rule rule);
}