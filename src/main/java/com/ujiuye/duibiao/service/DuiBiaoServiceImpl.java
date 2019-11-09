package com.ujiuye.duibiao.service;

import com.ujiuye.duibiao.bean.Datacollect;
import com.ujiuye.duibiao.bean.Indexvalue;
import com.ujiuye.duibiao.mapper.DatacollectMapper;
import com.ujiuye.duibiao.mapper.IndexvalueMapper;
import com.ujiuye.util.MarkInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DuiBiaoServiceImpl implements DuiBiaoService {
    @Resource
    private DatacollectMapper datacollectMapper;
    @Resource
    private IndexvalueMapper indexvalueMapper;

    @Override
    public List<Datacollect> showDaInfo(MarkInfo markInfo) {
        return datacollectMapper.showDaInfo(markInfo);
    }

    @Override
    public Map<String, Object> getOneByDaid(Datacollect datacollect) {
        Map<String, Object> map = new HashMap<String, Object>();
        //根据主键值查询的出来的最新年份的企业的信息
        Datacollect datacollect1 = datacollectMapper.selectByPrimaryKey(datacollect.getDaid());
        map.put("one", datacollect1);
        MarkInfo markInfo = new MarkInfo();
        markInfo.setMark(2);
        //已经查询出来对象的主键值
        markInfo.setEid(datacollect1.getDaid());
        //已经查询出来的企业的名称
        markInfo.setInfo(datacollect1.getDacname());
        List<Datacollect> datacollects = datacollectMapper.showDaInfo(markInfo);
        map.put("more", datacollects);
        return map;
    }

    @Override
    public boolean saveIndexValueInfo(Indexvalue indexvalue) {
        return indexvalueMapper.insert(indexvalue)>0;
    }

    @Override
    public List<Indexvalue> showAllIndexValue() {
        return indexvalueMapper.showAllIndexValue();
    }
}
