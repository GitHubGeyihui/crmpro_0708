package com.ujiuye.duibiao.controller;

import com.sun.corba.se.spi.orb.DataCollector;
import com.ujiuye.duibiao.bean.Datacollect;
import com.ujiuye.duibiao.bean.Indexvalue;
import com.ujiuye.duibiao.service.DuiBiaoService;
import com.ujiuye.util.MarkInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/db")
public class DuiBiaoController {
    @Autowired
    private DuiBiaoService duiBiaoService;

    @RequestMapping("showDaInfo")
    @ResponseBody
    public List<Datacollect> showDaInfo(MarkInfo markInfo) {
        return duiBiaoService.showDaInfo(markInfo);
    }

    //异步显示添加对标基本信息
    @RequestMapping("getOneByDaid")
    @ResponseBody
    public Map<String, Object> getOneByDaid(Datacollect datacollect) {
        return duiBiaoService.getOneByDaid(datacollect);
    }

    //添加指标信息
    @RequestMapping("saveIndexValueInfo")
    public String saveIndexValueInfo(Indexvalue indexvalue, MultipartFile files) throws Exception {
        String path = "E:\\uplode\\";
        String filename = null;
        if (files.getSize() > 0) {
            filename = files.getOriginalFilename();
            path += filename;
            File file = new File(path);
            files.transferTo(file);
        }
        indexvalue.setInFile(filename);
        indexvalue.setEmpFk5(1);
        boolean flag = duiBiaoService.saveIndexValueInfo(indexvalue);
        return "indexvalue-base";
    }
    @RequestMapping("showAllIndexValue")
@ResponseBody
    public List<Indexvalue> showAllIndexValue(){
        return  duiBiaoService.showAllIndexValue();
    }
}
