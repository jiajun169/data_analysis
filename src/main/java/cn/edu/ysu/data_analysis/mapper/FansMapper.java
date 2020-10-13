package cn.edu.ysu.data_analysis.mapper;

import cn.edu.ysu.data_analysis.bean.Fans;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface FansMapper {
    @Select("select * from fans_data")
    List<Fans> findAll();

    @Select("select location from fans_data")
    List<Fans> findGeo();

    @Select("select gender from fans_data")
    List<Fans> findGender();

    @Select({"<script>" +
            "select * from fans_data" +
            "<where>" +
            "<if test=\"name != null and name !=''\">" +
            " and name like concat('%', #{name}, '%')" +
            "</if>" +
            "<if test=\"gender != null and gender !=''\">" +
            " and gender=#{gender}" +
            "</if>" +
            "<if test=\"location != null and location != ''\">" +
            " and location=#{location}" +
            "</if>" +
            "</where>" +
            "</script>"})
    List<Fans> findByCondition(Fans condition);
}
