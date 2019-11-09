package com.ujiuye.util;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		// 将login.jsp 放行
		String requestURI = request.getRequestURI();
		String newurl = requestURI.substring(requestURI.lastIndexOf("/") + 1, requestURI.length());
		if ("login.jsp".equals(newurl)) {
			arg2.doFilter(request, response);
		} else {
			Object obj = request.getSession().getAttribute("activeUser");
			if (obj != null) {
				arg2.doFilter(request, response);
			} else {
				response.sendRedirect(request.getContextPath() + "/login.jsp");
			}
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
