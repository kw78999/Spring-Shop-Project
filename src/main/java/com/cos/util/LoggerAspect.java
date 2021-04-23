package com.cos.util;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import lombok.extern.slf4j.Slf4j;


@Aspect
@Component
@Slf4j
public class LoggerAspect {
	
//	@Before("within(com.cos.controller.MemberController)")
//    public void MC_before(){
//        log.info("MC-start");
//    }
//	@After("within(com.cos.controller.MemberController)")
//	public void MC_after() {
//		log.info("MC-end");
//	}
//	
//	@Before("within(com.cos.controller.IndexController)")
//    public void ID_before(){
//        log.info("ID-start");
//    }
//	@After("within(com.cos.controller.IndexController)")
//	public void ID_after() {
//		log.info("ID-end");
//	}
	
	@Around("within(com.cos.controller.*)")
	public Object aroundAdvice( ProceedingJoinPoint pjp) throws Throwable {
		// before advice
		StopWatch sw = new StopWatch();
		sw.start();
		
		Object result = pjp.proceed();
		
		// after advice
		sw.stop();
		Long total = sw.getTotalTimeMillis();
		
		// 어떤 클래스의 메서드인지 출력하는 정보는 pjp 객체에 있다.
		String className = pjp.getTarget().getClass().getName();
		String methodName = pjp.getSignature().getName();
		String taskName = className + "." + methodName;
		
		
		log.info("AOP Around--"+taskName + " , " + total + "(ms)");
		
		return result;
	}
}
