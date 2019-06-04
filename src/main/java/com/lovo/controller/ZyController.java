package com.lovo.controller;

import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.lovo.bean.ZyEntity;
import com.lovo.service.IZyService;
import com.lovo.util.ImportExcelUtil;

@Controller
@RequestMapping("zy")
public class ZyController {

	@Autowired
	private IZyService zy; 
	
	@RequestMapping("zy.lovo")
	@ResponseBody
	public List<ZyEntity> find(String area) {
		return zy.findByArea(area);
		
	}
	@RequestMapping("excelImport.lovo")
	public ModelAndView UploadFile(HttpServletRequest request)throws Exception{
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;  
        System.out.println("通过传统方式form表单提交方式导入excel文件！");

        InputStream in =null;
        List<List<Object>> listob = null;
        MultipartFile file = multipartRequest.getFile("eFile");
        if(file.isEmpty()){
           
            return new ModelAndView(new RedirectView("jsp/main.jsp"));
        }
        in = file.getInputStream();
        listob = new ImportExcelUtil().getBankListByExcel(in,file.getOriginalFilename());
        in.close();

        //该处可调用service相应方法进行数据保存到数据库中，现只对数据输出
        for (int i = 0; i < listob.size(); i++) {
            List<Object> lo = listob.get(i);
           ZyEntity a = new ZyEntity(null, null, null, null, null);
           System.out.println(String.valueOf(lo.get(1))+"*****"+String.valueOf(lo.get(2))+"*****"+String.valueOf(lo.get(3))+"*****"+String.valueOf(lo.get(4)));
            a.setfZyname(String.valueOf(lo.get(1)));
            a.setfZyadd(String.valueOf((lo.get(2))));
            a.setfZytype(String.valueOf(lo.get(3)));
            a.setfZyurl(String.valueOf(lo.get(4)));
            
            zy.add(a);
        }
		
		 
		 return new ModelAndView(new org.springframework.web.servlet.view.RedirectView("../jsp/dd-publicshow.jsp"));
	}
}
