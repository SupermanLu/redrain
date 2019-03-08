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

import com.redrain.model.Info;
import com.redrain.model.InfoList;
import com.redrain.model.Message;
import com.redrain.model.User;
import com.redrain.model.UserList;
import com.redrain.service.UserService;

@Controller
public class UserController {
	@Resource
	private UserService userService;

	@RequestMapping(value = "/user/loginout", method = RequestMethod.GET)
	@ResponseBody
	public Message toLoginPage(HttpServletRequest request) {
		String status = "success";
		String msg = "";
		try {
			HttpSession session = request.getSession();
			session.invalidate();
		} catch (Exception e) {
			status = "fail";
			msg = e.getMessage();
		}
		Message message = new Message();
		message.setMsg(msg);
		message.setStatus(status);
		return message;
	}

	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	@ResponseBody
	public Message toLogin(@RequestBody User user, HttpServletRequest request) {
		String status = "success";
		String msg = "";
		List<User> userList = this.userService.getUserByUserName(user.getUsername());

		if (userList.toArray().length > 0) {
			User userRes = (User) userList.toArray()[0];
			if (userRes.getPassword().equals(user.getPassword()) && "admin".equals(userRes.getRole())) {

				status = "success";
				msg = "登陆成功";
				// 将数据存储到session中
				HttpSession session = request.getSession();
				session.setAttribute("userid", userRes.getUserid());
				session.setAttribute("name", userRes.getName());
				session.setAttribute("role", userRes.getRole());

			} else {
				status = "fail";
				msg = "密码错误";
			}
		} else {
			status = "fail";
			msg = "用户名不存在";
		}
		Message message = new Message();
		message.setMsg(msg);
		message.setStatus(status);
		return message;

	}

	@RequestMapping(value = "/admin/user/changepassword", method = RequestMethod.POST)
	@ResponseBody
	public Message toChangPassword(@RequestParam("userid") String userid,
			@RequestParam("oldpassword") String oldpassword, @RequestParam("newpassword") String newpassword,
			HttpServletRequest request) {
		String status = "success";
		String msg = "";
		User userRes = this.userService.getUserById(userid);

		if (userRes != null) {
			if (userRes.getPassword().equals(oldpassword)) {
				userRes.setPassword(newpassword);
				this.userService.updateByPrimaryKey(userRes);
			} else {
				status = "fail";
				msg = "旧密码不对";
			}
		} else {
			status = "fail";
			msg = "没有该用户";
		}
		Message message = new Message();
		message.setStatus(status);
		message.setMsg(msg);
		return message;
	}

	@RequestMapping(value = "/admin/user/importExcel", method = RequestMethod.POST)
	@ResponseBody
	public Message importExcel(@RequestParam("myfile") MultipartFile myFile) {
		String status = "success";
		String msg = "";
		try {
			int num = this.userService.importExcel(myFile);
		} catch (Exception e) {
			status = "fail";
			msg = e.getMessage();
		}
		Message message = new Message();
		message.setStatus(status);
		message.setMsg(msg);
		return message;
	}

	@RequestMapping(value = "/admin/user/adduser", method = RequestMethod.POST)
	@ResponseBody
	public Message addUser(@RequestBody User user, HttpServletRequest request) {
		String status = "success";
		String msg = "";
		try {
			if(!user.getUsername().equals("admin"))
			{
				List<User> list=this.userService.getUserByUserName(user.getUsername());
				if(list.size()>0) {
					User updUser=list.get(0);
					updUser.setFixedmoney(user.getFixedmoney());
					updUser.setFloatercount(user.getFloatercount());
					this.userService.updateByPrimaryKey(updUser);
				}
				else {
					int num = this.userService.insert(user);
				}
				
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

	@RequestMapping(value = "/admin/user/getUser", method = RequestMethod.GET)
	@ResponseBody
	public UserList getList(HttpServletRequest request) throws UnsupportedEncodingException {
		User user = new User();
		user.setLimit(Integer.parseInt(request.getParameter("limit")));
		user.setOffset(Integer.parseInt(request.getParameter("offset")));
		user.setSearch(URLDecoder.decode(request.getParameter("search").toString(), "UTF-8"));
		List<User> userList = this.userService.selectList(user);
		List<User> userListTotal = this.userService.selectCount(user);
		UserList list = new UserList();
		list.setRows(userList);
		list.setTotal(userListTotal.toArray().length);
		return list;
	}

	@RequestMapping(value = "/admin/user/getUserbyid", method = RequestMethod.POST)
	@ResponseBody
	public User getInfoById(@RequestBody User user, HttpServletRequest request) {
		User resUser = this.userService.getUserById(user.getUserid());
		return resUser;
	}

	@RequestMapping(value = "/admin/user/updateuser", method = RequestMethod.POST)
	@ResponseBody
	public Message updateInfo(@RequestBody User user, HttpServletRequest request) {
		String status = "success";
		String msg = "";
		User resUser = this.userService.getUserById(user.getUserid());
		resUser.setUsername(user.getUsername());
		resUser.setFixedmoney(user.getFixedmoney());
		resUser.setFloatercount(user.getFloatercount());
		try {
			int num = this.userService.update(resUser);
		} catch (Exception e) {
			status = "fail";
			msg = e.getMessage();
		}
		Message message = new Message();
		message.setStatus(status);
		message.setMsg(msg);
		return message;
	}

	@RequestMapping(value = "/admin/user/deletebyid", method = RequestMethod.POST)
	@ResponseBody
	public Message deleteInfo(@RequestBody User user, HttpServletRequest request) {
		String status = "success";
		String msg = "";
		try {
			int num = this.userService.deletebyid(user.getUserid());
		} catch (Exception e) {
			status = "fail";
			msg = e.getMessage();
		}
		Message message = new Message();
		message.setStatus(status);
		message.setMsg(msg);
		return message;
	}

	@RequestMapping(value = "/admin/user/deletealluser", method = RequestMethod.POST)
	@ResponseBody
	public Message deleteAllUser(HttpServletRequest request) {
		String status = "success";
		String msg = "";
		try {
			int num = this.userService.delete();
		} catch (Exception e) {
			status = "fail";
			msg = e.getMessage();
		}
		Message message = new Message();
		message.setStatus(status);
		message.setMsg(msg);
		return message;
	}

	@RequestMapping(value = "/user/CheckSignIn", method = RequestMethod.POST)
	@ResponseBody
	public Message CheckSignIn(HttpServletRequest request) {
		String status = "success";
		String msg = "";
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("commonuserid");
		if (userid == null) {
			status = "fail";
			msg = "未登录";
		}
		Message message = new Message();
		message.setStatus(status);
		message.setMsg(msg);
		return message;
	}

	@RequestMapping(value = "/user/commonlogin", method = RequestMethod.POST)
	@ResponseBody
	public Message Login(@RequestBody User user, HttpServletRequest request) {
		String status = "0";
		String msg = "";
		HttpSession session = request.getSession();
		try {
			List<User> userList = this.userService.getUserByUserName(user.getUsername());
			if (true) {
				if (userList.size() > 0) {
					status = "0";
					Integer count=0;
					User userRes=new User();
					for(int i=0;i<userList.size();i++){
						User userItem = (User) userList.toArray()[i];
						if ("admin".equals(userItem.getRole())) {
							status = "fail";
							msg = "登录失败";
						} else {						
							// 将数据存储到session中
							if(userItem.getFloatercount()>0)
							{
								count+=userItem.getFloatercount();
								if(userRes.getUsername()==null) {
									userRes=userItem;
								}
								
							}
							if(i==(userList.size()-1)) 
							{
								if(userRes.getUsername()==null) {
									userRes=userItem;
								}
							}
						}
					}
					session.setAttribute("commonuserid", userRes.getUserid());
					session.setAttribute("commonname", userRes.getName());
					msg = count.toString();
				} else {
					if(!user.getUsername().equals("admin"))
					{
						user.setName(user.getUsername());
						user.setFloatercount(0);
	
						int num = this.userService.insert(user);
	
						userList = this.userService.getUserByUserName(user.getUsername());
	
						if (userList.toArray().length > 0) {
							User userRes = (User) userList.toArray()[0];
							status = "0";
							msg = userRes.getFloatercount().toString();
							// 将数据存储到session中
	
							session.setAttribute("commonuserid", userRes.getUserid());
							session.setAttribute("commonname", userRes.getName());
						}
					}
					else {
						status="fail";
						msg="用户名输入不合法";
					}

				}

			}
			else {
				status="fail";
				msg="验证码错误";
			}
		} catch (Exception e) {
			status = "fail";
			msg = e.getMessage();
		}
		Message message = new Message();
		message.setMsg(msg);
		message.setStatus(status);
		return message;

	}

	/**
	 * 获取验证码
	 * 
	 * @param response
	 * @param session
	 */
	@RequestMapping("/user/getVerifyCode")
	public void generate(HttpServletResponse response, HttpSession session) {
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		String verifyCodeValue = drawImg(output);

		session.setAttribute("verifyCodeValue", verifyCodeValue);

		try {
			ServletOutputStream out = response.getOutputStream();
			output.writeTo(out);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 绘画验证码
	 * 
	 * @param output
	 * @return
	 */
	private String drawImg(ByteArrayOutputStream output) {
		String code = "";
		// 随机产生4个字符
		for (int i = 0; i < 4; i++) {
			code += randomChar();
		}
		int width = 70;
		int height = 25;
		BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
		Font font = new Font("Times New Roman", Font.PLAIN, 20);
		// 调用Graphics2D绘画验证码
		Graphics2D g = bi.createGraphics();
		g.setFont(font);
		Color color = new Color(66, 2, 82);
		g.setColor(color);
		g.setBackground(new Color(226, 226, 240));
		g.clearRect(0, 0, width, height);
		FontRenderContext context = g.getFontRenderContext();
		Rectangle2D bounds = font.getStringBounds(code, context);
		double x = (width - bounds.getWidth()) / 2;
		double y = (height - bounds.getHeight()) / 2;
		double ascent = bounds.getY();
		double baseY = y - ascent;
		g.drawString(code, (int) x, (int) baseY);
		g.dispose();
		try {
			ImageIO.write(bi, "jpg", output);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return code;
	}

	/**
	 * 随机参数一个字符
	 * 
	 * @return
	 */
	private char randomChar() {
		Random r = new Random();
		String s = "ABCDEFGHJKLMNPRSTUVWXYZ0123456789";
		return s.charAt(r.nextInt(s.length()));
	}

}