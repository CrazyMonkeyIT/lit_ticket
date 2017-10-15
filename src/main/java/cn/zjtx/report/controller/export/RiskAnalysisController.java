package cn.zjtx.report.controller.export;

import cn.zjtx.report.controller.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 风险分析
 * @author xiaxin
 * @date 2017-10-15
 */
@Controller
@RequestMapping("/export/riskAnalysis")
public class RiskAnalysisController extends BaseController{
    private static final Logger logger = LoggerFactory.getLogger(RiskAnalysisController.class);

    /**
     * 页面
     */
    @RequestMapping("/page.html")
    public String page(ModelMap modelMap){
        return "pages/export/riskAnalysis";
    }
}
