package cn.zjtx.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorController {

    @RequestMapping(value = "/error/404.html", method = RequestMethod.GET)
    public ModelAndView error404(ModelAndView mv){
        mv.setViewName("pages/error/404");
        return mv;
    }
}
