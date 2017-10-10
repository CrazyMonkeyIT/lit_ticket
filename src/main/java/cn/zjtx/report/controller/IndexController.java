package cn.zjtx.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

	@RequestMapping(value = "/index.html", method = RequestMethod.GET)
	public ModelAndView index(ModelAndView mv){
		mv.setViewName("pages/index");
		return mv;
	}
}
