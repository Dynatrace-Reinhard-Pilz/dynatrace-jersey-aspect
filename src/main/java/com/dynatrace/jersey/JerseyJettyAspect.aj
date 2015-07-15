package com.dynatrace.jersey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jetty.server.Request;

public aspect JerseyJettyAspect {
	
	void around(
		final String target,
		final Request request,
		final HttpServletRequest httpServletRequest,
		final HttpServletResponse httpServletResponse
	) throws IOException, ServletException:
			execution(
				void org.glassfish.jersey.jetty.JettyHttpContainer.handle(
					String, Request, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse
				)
			)
			&&
			args(target, request, httpServletRequest, httpServletResponse)
		{
			final ServiceRunnable proceedRunnable = new ServiceRunnable() {
				@Override
				public void service() {
					proceed(target, request, httpServletRequest, httpServletResponse);
				}
			};
			
			ServletRequest req = httpServletRequest;
			ServletResponse res = httpServletResponse;
			
			new RPServletContainer(proceedRunnable).service(req, res);
		}
	
}
