package cn.zjtx.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	
	@RequestMapping(value = "/test/test.html", method = RequestMethod.GET)
	public ModelAndView test(ModelAndView mv){
		mv.setViewName("helloword");
		mv.addObject("name", "Myron");
		return mv;
	}

}
