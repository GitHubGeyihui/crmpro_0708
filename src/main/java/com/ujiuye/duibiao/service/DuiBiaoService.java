package com.ujiuye.duibiao.service;

import com.ujiuye.duibiao.bean.Datacollect;
import com.ujiuye.duibiao.bean.Indexvalue;
import com.ujiuye.util.MarkInfo;

import java.util.List;
import java.util.Map;

public interface DuiBiaoService {
    List<Datacollect> showDaInfo(MarkInfo markInfo);

    Map<String,Object> getOneByDaid(Datacollect datacollect);

    boolean saveIndexValueInfo(Indexvalue indexvalue);

    List<Indexvalue> showAllIndexValue();
}
