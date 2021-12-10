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

import org.springframework.stereotype.Component;

import com.btf.tap.vo.User;

@WebFilter(urlPatterns= "/host/*")
public class hostLoginFilter implements Filter {
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		Filter.super.init(filterConfig);
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// 호스트 로그인 상태에서만 요청할수 있도록 필터링
		System.out.println("hostLoginFilter.doFilter() 실행");
		HttpSession session = ((HttpServletRequest)request).getSession();
		
		// 로그인이 되어있지 않거나 호스트가 아니라면
		if(session.getAttribute("loginUser") == null || !((User)session.getAttribute("loginUser")).getUserLevel().equals("host")) {
			((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath()+"/");
			return;
		}
		
		chain.doFilter(request, response);
	}
	
	@Override
	public void destroy() {
		Filter.super.destroy();
	}

}
