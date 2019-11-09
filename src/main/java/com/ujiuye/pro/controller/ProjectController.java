package com.ujiuye.pro.controller;

        import com.ujiuye.pro.bean.*;
        import com.ujiuye.pro.service.ProjectService;
        import com.ujiuye.usual.bean.Task;
        import com.ujiuye.util.MarkInfo;
        import com.ujiuye.util.ResultInfo;
        import org.apache.commons.io.FileUtils;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.http.HttpHeaders;
        import org.springframework.http.HttpStatus;
        import org.springframework.http.MediaType;
        import org.springframework.http.ResponseEntity;
        import org.springframework.stereotype.Controller;
        import org.springframework.web.bind.annotation.RequestMapping;
        import org.springframework.web.bind.annotation.ResponseBody;
        import org.springframework.web.multipart.MultipartFile;

        import javax.servlet.http.HttpSession;
        import java.io.File;
        import java.io.IOException;
        import java.security.PublicKey;
        import java.util.List;

@Controller
@RequestMapping("/pro")
public class ProjectController {
    @Autowired
    private ProjectService projectService;

    //展示信息
    @RequestMapping("showProAndOtherInfo")
    @ResponseBody
    public List<Project> showProAndOtherInfo(MarkInfo markInfo) {
        List<Project> list = projectService.getProAndOtherInfo(markInfo);
        System.out.println("========================>" + list.size());
        return list;
    }


    //添加信息
    @RequestMapping("saveInfo")
    public String saveInfo(Project project) {
        boolean flag = projectService.saveProInfo(project);
        return "project-base";
    }

    //显示所有需求信息
    @RequestMapping("showAllAnalysis")
    @ResponseBody
    public List<Analysis> showAllAnalysis() {
        return projectService.showAllAnalysis();
    }

    //添加需求信息（文件上传）
    @RequestMapping("saveAnalysis")
    public String saveAnalysis(Analysis analysis, MultipartFile file) {
        String path = "E:\\uplode\\";
        if (file.getSize() > 0) {
            //获取文件名
            String originalFilename = file.getOriginalFilename();
            path += originalFilename;
            File uplodFile = new File(path);
            try {
                file.transferTo(uplodFile);
                analysis.setProname(originalFilename);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        boolean flag = projectService.saveAnalysis(analysis);
        return "project-need";
    }

    @RequestMapping("downLoadFile")
    //下载需求内容
    public ResponseEntity<byte[]> downLoadFile(String filename) throws IOException {
        String path = "E:\\uplode\\" + filename;
        File file = new File(path);
        //设置响应头信息
        HttpHeaders headers = new HttpHeaders();
        //设置字符编码集
        String NewFileName = new String(filename.getBytes("ISO-8859-1"), "UTF-8");
        headers.setContentDispositionFormData("attachment", NewFileName);
        //响应信息（二进制流的方式）
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.OK);
    }


    //所有模块展示
    @RequestMapping("showAllModule")
    @ResponseBody
    public List<Module> showAllModule() {
        return projectService.showAllModule();
    }

    //添加一个模块信息
    @RequestMapping("saveModuleInfo")
    public String saveModuleInfo(Module module) {
        boolean flag = projectService.saveModuleInfo(module);
        return "project-model";
    }

    //校验当前模块是否已添加
    @RequestMapping("checkModel")
    @ResponseBody
    public ResultInfo checkModel(String modelname, Integer pid) {
        ResultInfo resultInfo = new ResultInfo();
        Module module = projectService.checkModel(modelname, pid);
        if (module != null) {
            resultInfo.setFlag(true);
            resultInfo.setMessage("模块不名称可用");
        } else {
            resultInfo.setFlag(false);
            resultInfo.setMessage("模块名称可用");
        }
        return resultInfo;
    }

    //异步显示模块信息
    @RequestMapping("showAllFunction")
    @ResponseBody
    public List<Function> showAllFunction() {
        return projectService.showAllFunction();
    }

    @RequestMapping("showAnalysisAndModuleByPid")
    @ResponseBody
    public Analysis showAnalysisAndModuleByPid(MarkInfo markInfo) {
        return projectService.showAnalysisAndModuleByPid(markInfo);
    }

    @RequestMapping("checkFunction")
    @ResponseBody
    public ResultInfo checkFunction(String functionName, Integer mid) {
        ResultInfo resultInfo = new ResultInfo();
        Function function = projectService.checkFunction(functionName, mid);
        if (function != null) {
            resultInfo.setFlag(true);
            resultInfo.setMessage("功能不名称可用");
        } else {
            resultInfo.setFlag(false);
            resultInfo.setMessage("功能名称可用");
        }
        return resultInfo;
    }


    //添加功能
    @RequestMapping("saveFunctionInfo")
    public String saveFunctionInfo(Function function) {
        boolean flag = projectService.saveFunctionInfo(function);
        return "project-function";
    }

    //显示没有被分配成任务的功能信息
    @RequestMapping("showNoTaskInfoFunction")
    @ResponseBody
    public List<Function>showNoTaskInfoFunction(Integer mid){
        return projectService.showNoTaskInfoFunction(mid);
    }


    //异步显示所有附件功能
    @RequestMapping("showAllAttachment")
    @ResponseBody
    public List<Attachment> showAllAttachment(MarkInfo markInfo) {
        return projectService.showAllAttachment(markInfo);
    }

    //附件下载附件
    @RequestMapping("downloadAtt")
    public ResponseEntity<byte[]> downloadAtt(String filename) throws IOException {
        String path = "E:\\uplode\\" + filename;
        File files = new File(path);
        //设置响应头信息
        HttpHeaders headers = new HttpHeaders();
        //设置字符编码集
        String NewFileName = new String(filename.getBytes("ISO-8859-1"), "UTF-8");
        headers.setContentDispositionFormData("attachment", NewFileName);
        //响应信息（二进制流的方式）
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(files), headers, HttpStatus.OK);

    }

    //附件文件上传
    @RequestMapping("saveAttachmentInfo")
    public String saveAttachmentInfo(Attachment attachment, MultipartFile files) {
        String path = "E:\\uplode\\";
        if (files.getSize() > 0) {
            //获取文件名
            String originalFilename = files.getOriginalFilename();
            path += originalFilename;
            File uplodFile = new File(path);
            try {
                files.transferTo(uplodFile);
                attachment.setPath(originalFilename);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        boolean flag = projectService.saveAttachmentInfo(attachment);
        return "project-file";
    }

}
