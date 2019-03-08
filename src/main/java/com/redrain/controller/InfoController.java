package com.redrain.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.redrain.model.Info;
import com.redrain.model.InfoList;
import com.redrain.model.Message;
import com.redrain.model.Rule;
import com.redrain.service.InfoService;
import com.redrain.service.RuleService;

@Controller  
public class InfoController {  
    @Resource  
    private InfoService infoService;  
    
 
    
    @RequestMapping(value="/admin/info/getInfo",method=RequestMethod.GET)  
    @ResponseBody
    public InfoList getList(HttpServletRequest request) throws UnsupportedEncodingException{
    	Info info=new Info();
    	info.setLimit(Integer.parseInt(request.getParameter("limit")) );
    	info.setOffset(Integer.parseInt(request.getParameter("offset")));
    	info.setSearch(URLDecoder.decode(request.getParameter("search").toString(),"UTF-8" ));
    	List<Info> infoList = this.infoService.selectList(info);
    	List<Info> infoListTotal=this.infoService.selectCount(info);
    	InfoList list=new InfoList();
    	list.setRows(infoList);
    	list.setTotal(infoListTotal.toArray().length);
    	return list;
    } 
    
    
    @RequestMapping(value="/info/getInfo",method=RequestMethod.POST)  
    @ResponseBody
    public InfoList getInfo(@RequestParam("pageIndex") String pageIndex,HttpServletRequest request) throws UnsupportedEncodingException{
    	Info info=new Info();
    	info.setLimit(5);
    	info.setOffset((Integer.parseInt(pageIndex)-1)*5);
    	info.setSearch("");
    	List<Info> infoList = this.infoService.selectList(info);
    	List<Info> infoListTotal=this.infoService.selectCount(info);
    	InfoList list=new InfoList();
    	list.setRows(infoList);
    	list.setTotal(infoListTotal.toArray().length);
    	return list;
    } 
    
    @RequestMapping(value="/admin/info/getInfobyid",method=RequestMethod.POST)  
    @ResponseBody
    public Info getInfoById(@RequestBody Info info,HttpServletRequest request){
    	Info resInfo=this.infoService.getInfoById(info.getInfoid());
    	return resInfo;
    } 
    
    @RequestMapping(value="/admin/info/addinfo",method=RequestMethod.POST)  
    @ResponseBody
    public Message addInfo(@RequestBody Info info,HttpServletRequest request){
    	String status="success";
    	String msg="";
    	info.setInfoid(UUID.randomUUID().toString());
    	Date day=new Date();    
    	info.setInfotime(day);
    	info.setUpdatetime(day);
    	try {
    		int num=this.infoService.insert(info);
    	}
    	catch(Exception e) {
    		status="fail";
    		msg=e.getMessage();
    	}
    	Message message=new Message();
    	message.setStatus(status);
    	message.setMsg(msg);
    	return message;
    } 
        
    @RequestMapping(value="/admin/info/updateinfo",method=RequestMethod.POST)  
    @ResponseBody
    public Message updateInfo(@RequestBody Info info,HttpServletRequest request){
    	String status="success";
    	String msg="";
    	Info resInfo=this.infoService.getInfoById(info.getInfoid());
    	resInfo.setInfocontent(info.getInfocontent());
    	Date day=new Date();    
    	resInfo.setUpdatetime(day);
    	try {
    		int num=this.infoService.update(resInfo);
    	}
    	catch(Exception e) {
    		status="fail";
    		msg=e.getMessage();
    	}
    	Message message=new Message();
    	message.setStatus(status);
    	message.setMsg(msg);
    	return message;
    } 
    
    @RequestMapping(value="/admin/info/deletebyid",method=RequestMethod.POST)  
    @ResponseBody
    public Message deleteInfo(@RequestBody Info info,HttpServletRequest request){
    	String status="success";
    	String msg="";
    	try {
    		int num=this.infoService.deletebyid(info.getInfoid());
    	}
    	catch(Exception e) {
    		status="fail";
    		msg=e.getMessage();
    	}
    	Message message=new Message();
    	message.setStatus(status);
    	message.setMsg(msg);
    	return message;
    } 
    
    
 
}  