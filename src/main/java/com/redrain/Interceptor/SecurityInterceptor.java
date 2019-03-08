package com.redrain.Interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class SecurityInterceptor implements HandlerInterceptor{

	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// 说明处在编辑的页面
		HttpSession session = request.getSession();
		String role = (String) session.getAttribute("role");
		if (role!=null) {
			return true;
		}
		else {
			// 没有登陆，转向登陆界面
			//request.getRequestDispatcher("/login.jsp").forward(request,response);
			response.setContentType("application/json; charset=utf-8");
	        PrintWriter writer = response.getWriter();
	        writer.print("{\"login\":\"true\"}");
	        writer.close();
	        response.flushBuffer();
		    return false;
		}
	}

}
