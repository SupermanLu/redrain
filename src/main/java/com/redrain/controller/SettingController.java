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
import com.redrain.model.Setting;
import com.redrain.service.RuleService;
import com.redrain.service.SettingService;

@Controller
public class SettingController {
	@Resource
	private SettingService settingService;

	@RequestMapping(value = "setting/getsetting", method = RequestMethod.POST)
	@ResponseBody
	public Setting toGetSetting(HttpServletRequest request) {
		List<Setting> settings = settingService.getAllSetting();
		Setting setting = new Setting();
		if (settings.size() > 0) {
			setting = settings.get(0);
		} 
		return setting;

	}

	@RequestMapping(value = "/admin/setting/savesetting", method = RequestMethod.POST)
	@ResponseBody
	public Message toLogin(@RequestBody Setting setting, HttpServletRequest request) {
		Message message = new Message();

		String status = "success";
		String msg = "";
		try {
			Setting resSetting = this.settingService.getSettingById(setting.getSettingid());
			if (resSetting != null) {
				this.settingService.updateByPrimaryKey(setting);
			} else {
				this.settingService.insert(setting);
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