package com.ujiuye.pro.service;

import com.ujiuye.pro.bean.*;
import com.ujiuye.pro.mapper.*;
import com.ujiuye.util.MarkInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProjectServiceImpl implements ProjectService {
    @Resource
    private ProjectMapper projectMapper;
    @Resource
    private AnalysisMapper analysisMapper;
    @Resource
    private ModuleMapper moduleMapper;
    @Resource
    private FunctionMapper functionMapper;
    @Resource
    private AttachmentMapper attachmentMapper;

    @Override
    public List<Project> getProAndOtherInfo(MarkInfo markInfo) {
        return projectMapper.getProAndOtherInfo(markInfo);
    }

    //添加信息
    @Override
    public boolean saveProInfo(Project project) {
        return projectMapper.insert(project) > 0;
    }

    //显示需求页面的内容
    @Override
    public List<Analysis> showAllAnalysis() {
        return analysisMapper.showAllAnalysis();
    }

    @Override
    public boolean saveAnalysis(Analysis analysis) {
        return analysisMapper.insert(analysis) > 0;
    }

    @Override
    public List<Module> showAllModule() {
        return moduleMapper.showAllModule();
    }

    @Override
    public boolean saveModuleInfo(Module module) {
        return moduleMapper.insert(module) > 0;
    }

    @Override
    public Module checkModel(String modelname, Integer pid) {
        return moduleMapper.checkModel(modelname, pid);
    }

    @Override
    public List<Function> showAllFunction() {
        return functionMapper.getAllFunction();
    }

    @Override
    public Analysis showAnalysisAndModuleByPid(MarkInfo markInfo) {
        Analysis analysis = analysisMapper.selectByPrimaryKey(markInfo.getPid());
        //调用的模块查询
        List<Module> infoByAk = moduleMapper.getInfoByAk(markInfo);
        analysis.setModuleList(infoByAk);
        return analysis;
    }

    @Override
    public Function checkFunction(String functionName, Integer mid) {
        return functionMapper.checkFunction(functionName,mid);
    }

    @Override
    public boolean saveFunctionInfo(Function function) {
        return functionMapper.insert(function)>0;
    }

    @Override
    public List<Attachment> showAllAttachment(MarkInfo markInfo) {
        return attachmentMapper.showAllAttachment(markInfo);
    }

    @Override
    public boolean saveAttachmentInfo(Attachment attachment) {
        return attachmentMapper.insert(attachment)>0;
    }

    @Override
    public List<Function> showNoTaskInfoFunction(Integer mid) {
        return functionMapper.showNoTaskInfoFunction(mid);
    }


}
