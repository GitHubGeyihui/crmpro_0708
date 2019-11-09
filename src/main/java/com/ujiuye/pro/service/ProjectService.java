package com.ujiuye.pro.service;

import com.ujiuye.pro.bean.*;
import com.ujiuye.util.MarkInfo;

import javax.management.modelmbean.ModelMBean;
import java.util.List;

public interface ProjectService {
    List<Project> getProAndOtherInfo(MarkInfo markInfo);

    boolean saveProInfo(Project project);

    List<Analysis> showAllAnalysis();

    boolean saveAnalysis(Analysis analysis);

    List<Module> showAllModule();

    boolean saveModuleInfo(Module module);

    Module checkModel(String modelname, Integer pid);

    List<Function> showAllFunction();

    Analysis showAnalysisAndModuleByPid(MarkInfo markInfo);

    Function checkFunction(String functionName, Integer mid);

    boolean saveFunctionInfo(Function function);

    List<Attachment> showAllAttachment(MarkInfo markInfo);

    boolean saveAttachmentInfo(Attachment attachment);

    List<Function> showNoTaskInfoFunction(Integer mid);
}
