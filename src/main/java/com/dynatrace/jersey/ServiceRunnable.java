package com.dynatrace.jersey;

import java.io.IOException;

import javax.servlet.ServletException;

public interface ServiceRunnable {
	
	void service() throws ServletException, IOException;

}
