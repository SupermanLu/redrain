package com.redrain.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.redrain.dao.RuleMapper;
import com.redrain.model.Rule;
import com.redrain.model.User;
import com.redrain.service.RuleService;


@Service("ruleService")  
public class RuleServiceImpl implements RuleService {

	  	@Resource  
	    private RuleMapper ruleDao;  
	 
	  	public List<Rule> getAllRule(){
	  		return ruleDao.selectAllRule();
	  	}
	  	
	  	public List<Rule> getRule(Rule rule){
	  		return ruleDao.selectRule(rule);
	  	}
	  	
	  	public Rule getRuleById(String ruleId) {  
	        // TODO Auto-generated method stub  
	        return this.ruleDao.selectByPrimaryKey(ruleId);  
	    }  
	  	
	  	
	  	 public int updateByPrimaryKey(Rule rule) {
		    return this.ruleDao.updateByPrimaryKeyWithBLOBs(rule);
		 }
	  	 
	  	public int insert(Rule rule) {
	  		return this.ruleDao.insert(rule);
	  	} 


}