package com.redrain.controller;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.redrain.model.Message;
import com.redrain.model.Rule;
import com.redrain.service.RuleService;

@Controller
public class RuleController {
	@Resource
	private RuleService ruleService;

	@RequestMapping(value = "rule/getrule", method = RequestMethod.POST)
	@ResponseBody
	public Rule toGetRule(@RequestBody Rule record,HttpServletRequest request) {
		List<Rule> rules = ruleService.getRule(record);
		Rule rule = new Rule();
		if (rules.size() > 0) {
			rule = rules.get(0);
		} else {
			rule.setRuleid("");
			rule.setContent("");
		}
		return rule;

	}

	@RequestMapping(value = "/admin/rule/saverule", method = RequestMethod.POST)
	@ResponseBody
	public Message toLogin(@RequestBody Rule rule, HttpServletRequest request) {
		Message message = new Message();

		String status = "success";
		String msg = "";
		try {
			Rule resRule = this.ruleService.getRuleById(rule.getRuleid());
			if (resRule != null) {
				this.ruleService.updateByPrimaryKey(rule);
			} else {
				rule.setRuleid(UUID.randomUUID().toString());
				this.ruleService.insert(rule);
			}
		} catch (Exception ex) {
			status = "fail";
			msg = ex.getMessage();
		}

		message.setMsg(msg);
		message.setStatus(status);
		return message;

	}
}