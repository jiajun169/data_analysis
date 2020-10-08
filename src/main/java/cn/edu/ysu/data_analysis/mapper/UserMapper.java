package cn.edu.ysu.data_analysis.mapper;

import cn.edu.ysu.data_analysis.bean.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserMapper {
    @Insert("insert into user values(#{id},#{username},#{password})")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    void save(User user);

    @Select("select u.id from user u where u.username=#{username} and u.password=#{password}")
    Long login(User user);

    @Select("select u.username,u.password from user u where u.username=#{username}")
    User findByName(String username);
}
