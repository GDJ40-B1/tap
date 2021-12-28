package com.btf.tap.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter(urlPatterns= "/nonMember/*")
public class nonMemberFilter implements Filter {
	
	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		Filter.super.init(fConfig);
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest)request).getSession();

		if(session.getAttribute("loginUser") == null) {
			((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath()+"/login");
			return;
		}
		
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		Filter.super.destroy();
	}
}
