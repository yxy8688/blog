package com.yc.ssm.us.web.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import com.yc.ssm.us.util.ServletUtil;

@WebFilter("/*")
public class CharactorEncodingFilter extends AbstractFilter {
	private String encoding = "utf-8";

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
		response.setContentType("charset=" + encoding);
		chain.doFilter(request, response);

	}

}
