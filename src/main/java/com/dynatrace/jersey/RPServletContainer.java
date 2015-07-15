package com.dynatrace.jersey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.glassfish.jersey.servlet.ServletContainer;

public class RPServletContainer extends ServletContainer {
	
	private static final long serialVersionUID = 1L;
	
	private final ServiceRunnable proceedRunnable;
	
	public RPServletContainer(ServiceRunnable proceedRunnable) {
		this.proceedRunnable = proceedRunnable;
	}
	
	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		proceedRunnable.service();
	}
	
	
}
