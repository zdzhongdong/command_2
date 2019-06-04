package com.lovo.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
/**
 * 异常处理
 * @author Administrator
 *
 */
public class MyExecption implements HandlerExceptionResolver{

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
	      ex.printStackTrace(); //后台显示方便开发人员看
	      ModelAndView mv=new ModelAndView("error");
	      mv.addObject("error",StaticTool.PAGEERROR);
		return mv;
	}

}
