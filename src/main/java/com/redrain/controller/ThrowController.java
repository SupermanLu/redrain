package com.redrain.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.redrain.model.Info;
import com.redrain.model.InfoList;
import com.redrain.model.Message;
import com.redrain.model.Rule;
import com.redrain.model.Throw;
import com.redrain.model.ThrowList;
import com.redrain.service.InfoService;
import com.redrain.service.RuleService;
import com.redrain.service.ThrowService;

@Controller
public class ThrowController {
	@Resource
	private ThrowService throwService;

	@RequestMapping(value = "/admin/throw/getThrow", method = RequestMethod.GET)
	@ResponseBody
	public ThrowList getList(HttpServletRequest request) throws UnsupportedEncodingException {
		Throw record = new Throw();
		record.setLimit(Integer.parseInt(request.getParameter("limit")));
		record.setOffset(Integer.parseInt(request.getParameter("offset")));
		record.setSearch(URLDecoder.decode(request.getParameter("search").toString(), "UTF-8"));
		List<Throw> throwList = this.throwService.selectList(record);
		List<Throw> throwListTotal = this.throwService.selectCount(record);
		ThrowList list = new ThrowList();
		list.setRows(throwList);
		list.setTotal(throwListTotal.toArray().length);
		return list;
	}

	@RequestMapping(value = "admin/throw/getThrowbyid", method = RequestMethod.POST)
	@ResponseBody
	public Throw getThrowById(@RequestBody Throw record, HttpServletRequest request) {
		Throw resThrow = this.throwService.getThrowById(record.getId());
		return resThrow;
	}

	@RequestMapping(value = "throw/addthrow", method = RequestMethod.POST)
	@ResponseBody
	public Message addInfo(@RequestBody Throw record, HttpServletRequest request) throws ParseException {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("commonuserid");
		Date day = new Date();
		String status = "success";
		String msg = "";
		Throw newThrow = new Throw();
		newThrow.setUserid(Integer.parseInt(userid));
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		newThrow.setSearch(sdf.format(day));
		List<Throw> list = this.throwService.selectTodayCount(newThrow);
		if (list.size() < 10) {

			record.setThrowtime(day);
			record.setStatus("0");
			try {
				record.setUserid(Integer.parseInt(userid));
				int num = this.throwService.insert(record);
			} catch (Exception e) {
				status = "fail";
				msg = e.getMessage();
			}
		} else {
			status = "fail";
			msg = "超过每日10次上限";
		}
		Message message = new Message();
		message.setStatus(status);
		message.setMsg(msg);
		return message;
	}

	@RequestMapping(value = "admin/throw/finishbyid", method = RequestMethod.POST)
	@ResponseBody
	public Message updateThrow(@RequestBody Throw record, HttpServletRequest request) {
		String status = "success";
		String msg = "";
		Throw resThrow = this.throwService.getThrowById(record.getId());
		resThrow.setStatus("1");
		try {
			int num = this.throwService.update(resThrow);
		} catch (Exception e) {
			status = "fail";
			msg = e.getMessage();
		}
		Message message = new Message();
		message.setStatus(status);
		message.setMsg(msg);
		return message;
	}

	@RequestMapping(value = "admin/throw/deletebyid", method = RequestMethod.POST)
	@ResponseBody
	public Message deleteThrow(@RequestBody Throw record, HttpServletRequest request) {
		String status = "success";
		String msg = "";
		try {
			int num = this.throwService.deletebyid(record.getId());
		} catch (Exception e) {
			status = "fail";
			msg = e.getMessage();
		}
		Message message = new Message();
		message.setStatus(status);
		message.setMsg(msg);
		return message;
	}

	@RequestMapping(value = "/admin/throw/deleteallthrow", method = RequestMethod.POST)
	@ResponseBody
	public Message deleteAllThrow(HttpServletRequest request) {
		String status = "success";
		String msg = "";
		try {
			int num = this.throwService.delete();
		} catch (Exception e) {
			status = "fail";
			msg = e.getMessage();
		}
		Message message = new Message();
		message.setStatus(status);
		message.setMsg(msg);
		return message;
	}

	@RequestMapping(value = "/admin/throw/finishallthrow", method = RequestMethod.POST)
	@ResponseBody
	public Message finishAllUser(HttpServletRequest request) {
		String status = "success";
		String msg = "";
		try {
			int num = this.throwService.finish();
		} catch (Exception e) {
			status = "fail";
			msg = e.getMessage();
		}
		Message message = new Message();
		message.setStatus(status);
		message.setMsg(msg);
		return message;
	}

}