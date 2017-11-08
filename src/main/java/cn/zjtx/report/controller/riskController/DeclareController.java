package cn.zjtx.report.controller.riskController;

import cn.zjtx.report.controller.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 业务申报
 * @author xiaxin
 * @date 2017-11-5
 */
@Controller
@RequestMapping("/riskController/declare")
public class DeclareController extends BaseController{
    private static final Logger logger = LoggerFactory.getLogger(DeclareController.class);

    @RequestMapping("/page.html")
    public String page(){
        return "pages/riskController/declare";
    }

    @RequestMapping("/admittance.html")
    public String admittance(){
        return "pages/riskController/admittance";
    }
}
