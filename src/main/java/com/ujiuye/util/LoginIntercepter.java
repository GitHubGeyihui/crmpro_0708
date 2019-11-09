package com.ujiuye.util;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginIntercepter implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}
//拦截控制器@RequestMapping
	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse resp, Object arg2) throws Exception {
		Object obj = arg0.getSession().getAttribute("activeUser");
		if(obj!=null) {
			return true;
		}else {
            resp.sendRedirect(arg0.getContextPath()+"/login.jsp");
			return false;
		}
	
	}

}
