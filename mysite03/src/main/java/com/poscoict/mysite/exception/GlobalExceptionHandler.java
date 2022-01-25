package com.poscoict.mysite.exception;

import java.io.PrintWriter;
import java.io.StringWriter;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(Exception.class)
	public String ExceptionHandler(Model model,Exception e) {
		//1. 로깅
		
		StringWriter errors = new StringWriter();
		e.printStackTrace(new PrintWriter(errors));
		model.addAttribute("exception", errors.toString());
		
		
		//2. 사과 페이지(HTML 응답, 정상 종료)
		return "error/exception";
	}
}