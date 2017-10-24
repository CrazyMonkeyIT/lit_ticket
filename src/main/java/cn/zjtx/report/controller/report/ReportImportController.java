package cn.zjtx.report.controller.report;

import cn.zjtx.report.controller.BaseController;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * 报表导入
 * @author xiaxin
 * @date 2017-10-23
 */
@Controller
@RequestMapping("/report")
public class ReportImportController extends BaseController{
    private static final Logger logger = LoggerFactory.getLogger(ReportImportController.class);

    /**
     * 报表导入
     */
    @RequestMapping("/importPage.html")
    public String importPage(ModelMap modelMap){
        modelMap.addAttribute("custList",getCurrCustList());
        return "pages/report/importPage";
    }

    /**
     * 处理导入的文件
     */
    @RequestMapping("/uploadFile.html")
    @ResponseBody
    public JSONPObject uploadFile(@RequestParam(value = "file", required = false) MultipartFile file){
        return null;
    }
}
