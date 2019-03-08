package com.redrain.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.redrain.model.Gain;
import com.redrain.model.Info;
import com.redrain.model.InfoList;
import com.redrain.model.Lb;
import com.redrain.model.LbList;
import com.redrain.model.Message;
import com.redrain.model.User;
import com.redrain.model.UserList;
import com.redrain.service.LbService;
import com.redrain.service.UserService;

@Controller
public class LbController {
	@Resource
	private LbService objectService;

	

	@RequestMapping(value = "/admin/lb/importExcel", method = RequestMethod.POST)
	@ResponseBody
	public Message importExcel(@RequestParam("myfile") MultipartFile myFile) {
		String status = "success";
		String msg = "";
		try {
			int num = this.objectService.importExcel(myFile);
		} catch (Exception e) {
			status = "fail";
			msg = e.getMessage();
		}
		Message message = new Message();
		message.setStatus(status);
		message.setMsg(msg);
		return message;
	}
	
	@RequestMapping(value = "/admin/lb/deleteallobject", method = RequestMethod.POST)
	@ResponseBody
	public Message deleteAllLb(HttpServletRequest request) {
		String status = "success";
		String msg = "";
		try {
			int num = this.objectService.delete();
		} catch (Exception e) {
			status = "fail";
			msg = e.getMessage();
		}
		Message message = new Message();
		message.setStatus(status);
		message.setMsg(msg);
		return message;
	}

	@RequestMapping(value = "/admin/lb/addobject", method = RequestMethod.POST)
	@ResponseBody
	public Message addUser(@RequestBody Lb object, HttpServletRequest request) {
		String status = "success";
		String msg = "";
		try {
			if(!object.getLbname().equals("admin"))
			{
				int num = this.objectService.insert(object);
			}
			else {
				status="fail";
				msg="用户名输入不合法";
			}
			
		} catch (Exception e) {
			status = "fail";
			msg = e.getMessage();
		}
		Message message = new Message();
		message.setStatus(status);
		message.setMsg(msg);
		return message;
	}

	@RequestMapping(value = "/admin/lb/getObject", method = RequestMethod.GET)
	@ResponseBody
	public LbList getList(HttpServletRequest request) throws UnsupportedEncodingException {
		Lb object = new Lb();
		object.setLimit(Integer.parseInt(request.getParameter("limit")));
		object.setOffset(Integer.parseInt(request.getParameter("offset")));
		object.setSearch(URLDecoder.decode(request.getParameter("search").toString(), "UTF-8"));
		List<Lb> objectList = this.objectService.selectList(object);
		List<Lb> objectListTotal = this.objectService.selectCount(object);
		LbList list = new LbList();
		list.setRows(objectList);
		list.setTotal(objectListTotal.toArray().length);
		return list;
	}

	@RequestMapping(value = "/admin/lb/getObjectbyid", method = RequestMethod.POST)
	@ResponseBody
	public Lb getInfoById(@RequestBody Lb object, HttpServletRequest request) {
		Lb resObject = this.objectService.getObjectById(object.getLbid());
		return resObject;
	}

	@RequestMapping(value = "/admin/lb/updateobject", method = RequestMethod.POST)
	@ResponseBody
	public Message updateInfo(@RequestBody Lb object, HttpServletRequest request) {
		String status = "success";
		String msg = "";
		Lb resObject = this.objectService.getObjectById(object.getLbid());
		resObject.setLbname(object.getLbname());
		resObject.setLbmoney(object.getLbmoney());
		try {
			int num = this.objectService.update(resObject);
		} catch (Exception e) {
			status = "fail";
			msg = e.getMessage();
		}
		Message message = new Message();
		message.setStatus(status);
		message.setMsg(msg);
		return message;
	}

	@RequestMapping(value = "/admin/lb/deletebyid", method = RequestMethod.POST)
	@ResponseBody
	public Message deleteInfo(@RequestBody Lb object, HttpServletRequest request) {
		String status = "success";
		String msg = "";
		try {
			int num = this.objectService.deletebyid(object.getLbid());
		} catch (Exception e) {
			status = "fail";
			msg = e.getMessage();
		}
		Message message = new Message();
		message.setStatus(status);
		message.setMsg(msg);
		return message;
	}

	@RequestMapping(value = "/lb/getAllLb", method = RequestMethod.POST)
	@ResponseBody
	public List<Lb> getAllLb(HttpServletRequest request) throws UnsupportedEncodingException {
		List<Lb> objectList = this.objectService.selectAllList();
		return objectList;
	}
	

}