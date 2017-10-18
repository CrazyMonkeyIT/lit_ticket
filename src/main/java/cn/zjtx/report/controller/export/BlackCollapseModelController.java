package cn.zjtx.report.controller.export;

import cn.zjtx.report.controller.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 黑色倒闭模型
 * @author xiaxin
 * @date 2017-10-17
 */
@Controller
@RequestMapping("/export/blackCollapseModel")
public class BlackCollapseModelController extends BaseController{
    private static final Logger logger = LoggerFactory.getLogger(BlackCollapseModelController.class);

    /**
     * 页面
     * @param mm
     * @return
     */
    @RequestMapping("/page.html")
    public String page(ModelMap mm){
        return "pages/export/blackCollapseModel";
    }
}
