package com.redrain.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.redrain.model.Award;
import com.redrain.model.FloaterMessage;
import com.redrain.model.Gain;
import com.redrain.model.GainList;
import com.redrain.model.Info;
import com.redrain.model.InfoList;
import com.redrain.model.Message;
import com.redrain.model.Rule;
import com.redrain.model.Setting;
import com.redrain.model.Throw;
import com.redrain.model.ThrowList;
import com.redrain.model.User;
import com.redrain.service.AwardService;
import com.redrain.service.GainService;
import com.redrain.service.InfoService;
import com.redrain.service.RuleService;
import com.redrain.service.SettingService;
import com.redrain.service.ThrowService;
import com.redrain.service.UserService;

@Controller
public class GainController {
	@Resource
	private GainService gainService;
	@Resource
	private UserService userService;
	@Resource
	private AwardService awardService;
	@Resource
	private SettingService settingService;

	@RequestMapping(value = "/admin/gain/getGain", method = RequestMethod.GET)
	@ResponseBody
	public GainList getList(HttpServletRequest request) throws UnsupportedEncodingException {
		Gain record = new Gain();
		record.setLimit(Integer.parseInt(request.getParameter("limit")));
		record.setOffset(Integer.parseInt(request.getParameter("offset")));
		record.setSearch(URLDecoder.decode(request.getParameter("search").toString(), "UTF-8"));
		List<Gain> gainList = this.gainService.selectList(record);
		List<Gain> gainListTotal = this.gainService.selectCount(record);
		GainList list = new GainList();
		list.setRows(gainList);
		list.setTotal(gainListTotal.toArray().length);
		return list;
	}

	@RequestMapping(value = "/gain/getGain", method = RequestMethod.POST)
	@ResponseBody
	public GainList getGain(@RequestParam("pageIndex") String pageIndex, HttpServletRequest request)
			throws UnsupportedEncodingException {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("commonuserid");
		Gain record = new Gain();
		record.setLimit(5);
		record.setOffset((Integer.parseInt(pageIndex) - 1) * 5);
		record.setSearch("");
		record.setUserid(Integer.parseInt(userid));
		List<Gain> gainList = this.gainService.selectListbyuser(record);
		List<Gain> gainListTotal = this.gainService.selectCountbyuser(record);
		GainList list = new GainList();
		list.setRows(gainList);
		list.setTotal(gainListTotal.toArray().length);
		return list;
	}

	@RequestMapping(value = "/gain/getGainbyName", method = RequestMethod.POST)
	@ResponseBody
	public GainList getGainbyName(@RequestBody Gain record, HttpServletRequest request)
			throws UnsupportedEncodingException {
		record.setLimit(5);
		Integer page = record.getPage();
		record.setOffset((page - 1) * 5);
		record.setSearch("");
		List<Gain> gainList = this.gainService.selectListbyusername(record);
		List<Gain> gainListTotal = this.gainService.selectCountbyusername(record);
		GainList list = new GainList();
		list.setRows(gainList);
		list.setTotal(gainListTotal.toArray().length);
		return list;
	}

	@RequestMapping(value = "/gain/getAllGain", method = RequestMethod.POST)
	@ResponseBody
	public List<Gain> getAllGain(HttpServletRequest request) throws UnsupportedEncodingException {
		List<Gain> gainList = this.gainService.selectAllList();
		return gainList;
	}

	@RequestMapping(value = "admin/gain/getGainbyid", method = RequestMethod.POST)
	@ResponseBody
	public Gain getGainById(@RequestBody Gain record, HttpServletRequest request) {
		Gain resGain = this.gainService.getGainById(record.getGainid());
		return resGain;
	}

	@RequestMapping(value = "gain/addGain", method = RequestMethod.POST)
	@ResponseBody
	public FloaterMessage addInfo(@RequestBody Gain record, HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		String userid = (String) session.getAttribute("commonuserid");
		String userName=record.getUsername();
		
		String status = "0";
		String msg = "";
		Integer content = 0;

		String bottle_type = ""; // 666 钱 1 语录
		String gift_type = "0"; // 1正常 0 祝福语
		String luckdraw = "";
		String hint = "继续加油";// 继续加油
		String money = "";
		FloaterMessage message = new FloaterMessage();
		List<Setting> settings = settingService.getAllSetting();
		Setting setting = new Setting();
		if (settings.size() > 0) {
			setting = settings.get(0);
			Date date = new Date();
			try {
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
				String dateStr = df.format(new Date());// new Date()为获取当前系统时间
				SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
				// String fromDateString=dateStr + " " + setting.getLotteryfromtime() + ":00";
				// String toDateString=dateStr + " " + setting.getLotterytotime() + ":59";
				// Date fromDate = df2.parse(fromDateString);
				// Date toDate = df2.parse(toDateString);
				if (true) {
					//if (userid == null) {
					if(false) {
						status = "-1";
						msg = "未登录";
					} else {
						//User user = this.userService.getUserByUserName(userName)[0];
						Integer count = 0;

						User userRes = new User();
						List<User> userList = this.userService.getUserByUserName(userName);
						if(userList.size()>0)
						{
						for (int i = 0; i < userList.size(); i++) {
							User userItem = (User) userList.toArray()[i];
							if ("admin".equals(userItem.getRole())) {
								status = "fail";
								msg = "登录失败";
							} else {
								// 将数据存储到session中
								if (userItem.getFloatercount() > 0) {
									count += userItem.getFloatercount();
									if (userRes.getUsername() == null) {
										userRes = userItem;
									}

								}
								if (i == (userList.size() - 1)) {
									if (userRes.getUsername() == null) {
										userRes = userItem;
									}
								}
							}
						}
//						if (user.getFloatercount() == 0) {
//							session.setAttribute("commonuserid", userRes.getUserid());
//							session.setAttribute("commonname", userRes.getName());
//							user = userRes;
//						}
						User user=userRes;
						if(setting.getTotalmoney()>0&&setting.getTotalnum()>0&&!"null".equals(String.valueOf(setting.getTotalnum()))&&!"null".equals(String.valueOf(setting.getTotalmoney())))
						{
							System.out.println(setting.getTotalmoney());
							if (user.getFloatercount() > 0) {
								Date day = new Date();
								record.setGaintime(day);
								record.setStatus("0");
								if (user.getFixedmoney() == 0) {
									int max = setting.getMax();
									int min = setting.getMin();
									Integer[] arrays = new Integer[max - min + 1];
									int k = 0;
									for (int j = min; j < max + 1; j++) {
										arrays[k] = j;
										k++;
									}
									int randomNum = new Random().nextInt(max - min + 1);
									if (arrays[randomNum] != null) {
										gift_type = "1";
										Integer awardid = arrays[randomNum];
										if(awardid>setting.getTotalmoney()) {
											awardid=setting.getTotalmoney();
										}
										record.setAwardid(awardid);
	
										msg = awardid.toString();
										content = awardid;
										
	
									}
								} else {
									gift_type = "1";
									Integer awardid = user.getFixedmoney();
									if(awardid>setting.getTotalmoney()) {
										awardid=setting.getTotalmoney();
									}
									record.setAwardid(awardid);
	
									msg = awardid.toString();
									content = awardid;
								}
								record.setUserid(Integer.parseInt(userRes.getUserid()));
								try {
									int num = this.gainService.insert(record);
									luckdraw = String.valueOf(count - 1);
									user.setFloatercount(user.getFloatercount() - 1);
									int numchange = this.userService.update(user);
									setting.setTotalnum(setting.getTotalnum()-1);
									setting.setTotalmoney(setting.getTotalmoney()-record.getAwardid());
									int numsetting=this.settingService.updateByPrimaryKey(setting);
								} catch (Exception e) {
									status = "-5";
									msg = e.getMessage();
								}
							} else {
	
								status = "-3";
								msg = "没有抢红包机会";
							}
						}
						else{
							System.out.println(setting.getTotalmoney());
							status = "-3";
							msg = "红包已抢完";
						}
						
					}
						else {
							status = "-3";
							msg = "用户名不存在";
						}

					}
				} else {
					status = "-5";
					msg = "不在活动时间内";
				}
			} catch (Exception e) {
				status = "-5";
				msg = e.getMessage();
			}

		} else {
			status = "-5";
			msg = "没设置时间";

		}
		message.setStatus(status);
		message.setMsg(msg);
		message.setBottle_type(bottle_type);
		message.setContent(content.toString());
		message.setGift_type(gift_type);
		message.setHint(hint);
		message.setLuckdraw(luckdraw);
		message.setMoney(money);
		return message;
	}

	@RequestMapping(value = "admin/gain/finishbyid", method = RequestMethod.POST)
	@ResponseBody
	public Message updateThrow(@RequestBody Gain record, HttpServletRequest request) {
		String status = "success";
		String msg = "";
		Gain resGain = this.gainService.getGainById(record.getGainid());
		resGain.setStatus("1");
		try {
			int num = this.gainService.update(resGain);
		} catch (Exception e) {
			status = "fail";
			msg = e.getMessage();
		}
		Message message = new Message();
		message.setStatus(status);
		message.setMsg(msg);
		return message;
	}

	@RequestMapping(value = "admin/gain/deletebyid", method = RequestMethod.POST)
	@ResponseBody
	public Message deleteThrow(@RequestBody Gain record, HttpServletRequest request) {
		String status = "success";
		String msg = "";
		try {
			int num = this.gainService.deletebyid(record.getGainid());
		} catch (Exception e) {
			status = "fail";
			msg = e.getMessage();
		}
		Message message = new Message();
		message.setStatus(status);
		message.setMsg(msg);
		return message;
	}

	@RequestMapping(value = "/admin/gain/deleteallgain", method = RequestMethod.POST)
	@ResponseBody
	public Message deleteAllThrow(HttpServletRequest request) {
		String status = "success";
		String msg = "";
		try {
			int num = this.gainService.delete();
		} catch (Exception e) {
			status = "fail";
			msg = e.getMessage();
		}
		Message message = new Message();
		message.setStatus(status);
		message.setMsg(msg);
		return message;
	}

	@RequestMapping(value = "/admin/gain/finishallgain", method = RequestMethod.POST)
	@ResponseBody
	public Message finishAllUser(HttpServletRequest request) {
		String status = "success";
		String msg = "";
		try {
			int num = this.gainService.finish();
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