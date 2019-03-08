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
import org.springframework.web.bind.annotation.ResponseBody;

import com.redrain.model.Award;
import com.redrain.model.AwardList;
import com.redrain.model.Info;
import com.redrain.model.InfoList;
import com.redrain.model.Message;
import com.redrain.model.Rule;
import com.redrain.service.AwardService;
import com.redrain.service.InfoService;
import com.redrain.service.RuleService;

@Controller  
@RequestMapping("/admin/award")  
public class AwardController {  
    @Resource  
    private AwardService awardService;  
    
 
    
    @RequestMapping(value="/getAward",method=RequestMethod.GET)  
    @ResponseBody
    public AwardList getList(HttpServletRequest request) throws UnsupportedEncodingException{
    	Award award=new Award();
    	award.setLimit(Integer.parseInt(request.getParameter("limit")) );
    	award.setOffset(Integer.parseInt(request.getParameter("offset")));
    	award.setSearch(URLDecoder.decode(request.getParameter("search").toString(),"UTF-8" ));
    	List<Award> awardList = this.awardService.selectList(award);
    	List<Award> awardListTotal=this.awardService.selectCount(award);
    	AwardList list=new AwardList();
    	list.setRows(awardList);
    	list.setTotal(awardListTotal.toArray().length);
    	return list;
    } 
    
    @RequestMapping(value="/getAwardbyid",method=RequestMethod.POST)  
    @ResponseBody
    public Award getAwardById(@RequestBody Award award,HttpServletRequest request){
    	Award resAward=this.awardService.getAwardById(award.getAwardid());
    	return resAward;
    } 
    
    @RequestMapping(value="/addaward",method=RequestMethod.POST)  
    @ResponseBody
    public Message addAward(@RequestBody Award award,HttpServletRequest request){
    	String status="success";
    	String msg="";
    	try {
    		int num=this.awardService.insert(award);
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
        
    @RequestMapping(value="/updateaward",method=RequestMethod.POST)  
    @ResponseBody
    public Message updateAward(@RequestBody Award award,HttpServletRequest request){
    	String status="success";
    	String msg="";
    	Award resAward=this.awardService.getAwardById(award.getAwardid());
    	resAward.setAwardname(award.getAwardname());
    	resAward.setAwardtype(award.getAwardtype());
    	resAward.setAwardchance(award.getAwardchance());
    	try {
    		int num=this.awardService.update(resAward);
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
    
    @RequestMapping(value="/deletebyid",method=RequestMethod.POST)  
    @ResponseBody
    public Message deleteAward(@RequestBody Award award,HttpServletRequest request){
    	String status="success";
    	String msg="";
    	try {
    		int num=this.awardService.deletebyid(award.getAwardid());
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