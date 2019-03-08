package com.redrain.service;

import java.util.List;

import com.redrain.model.Rule;


public interface RuleService {
	public List<Rule> getAllRule();
	
	public List<Rule> getRule(Rule rule);
	
	public Rule getRuleById(String ruleId);
	
	public int updateByPrimaryKey(Rule rule);
	
	public int insert(Rule rule);
}
