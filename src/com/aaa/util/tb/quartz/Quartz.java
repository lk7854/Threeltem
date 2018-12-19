package com.aaa.util.tb.quartz;

import org.springframework.beans.factory.annotation.Autowired;

import com.aaa.service.tb.IndentService;

/**
 * methodInvokingJobDetailFactoryBean
 * 
 * @author Administrator
 * 
 */

public class Quartz {
	@Autowired
	IndentService is;

	@SuppressWarnings("deprecation")
	private void execute() {
		is.koufei();
	}
}
