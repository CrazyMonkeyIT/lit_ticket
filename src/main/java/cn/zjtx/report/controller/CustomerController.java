package cn.zjtx.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomerController {

	@RequestMapping(value = "/customer/list.html", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mv){
		mv.setViewName("pages/customer/list");
		return mv;
	}
}
