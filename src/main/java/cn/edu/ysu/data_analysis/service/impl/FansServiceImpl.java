package cn.edu.ysu.data_analysis.service.impl;

import cn.edu.ysu.data_analysis.bean.Fans;
import cn.edu.ysu.data_analysis.mapper.FansMapper;
import cn.edu.ysu.data_analysis.service.FansService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "fansService")
public class FansServiceImpl implements FansService {
    @Autowired
    private FansMapper fansMapper;

    @Override
    public List<Fans> findAll() {
        return fansMapper.findAll();
    }

    @Override
    public List<Fans> findGeo() {
        return fansMapper.findGeo();
    }

    @Override
    public List<Fans> findGender() {
        return fansMapper.findGender();
    }

    @Override
    public List<Fans> findByCondition(Fans condition) {
        return fansMapper.findByCondition(condition);
    }
}
