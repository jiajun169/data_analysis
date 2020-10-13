package cn.edu.ysu.data_analysis.service;

import cn.edu.ysu.data_analysis.bean.Fans;

import java.util.List;

public interface FansService {
    List<Fans> findAll();

    List<Fans> findGeo();

    List<Fans> findGender();

    List<Fans> findByCondition(Fans condition);
}
