package cn.edu.ysu.data_analysis.mapper;

import cn.edu.ysu.data_analysis.bean.Fans;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface FansMapper {
    @Select("select * from fans_data")
    List<Fans> findAll();
}
