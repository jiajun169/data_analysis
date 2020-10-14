package cn.edu.ysu.data_analysis.service.impl;

import cn.edu.ysu.data_analysis.bean.Result;
import cn.edu.ysu.data_analysis.bean.User;
import cn.edu.ysu.data_analysis.mapper.UserMapper;
import cn.edu.ysu.data_analysis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public Result regist(User user) {
        Result result = new Result();
        result.setSuccess(false);
        result.setDetail(null);
        User existUser = userMapper.findByName(user.getUsername());
        if (existUser != null) {
            result.setMsg("用户名已存在！");
        } else {
            userMapper.save(user);
            result.setMsg("注册成功！");
            result.setSuccess(true);
            result.setDetail(user);
        }
        return result;
    }

    @Override
    public Result login(User user) {
        Result result = new Result();
        result.setSuccess(false);
        result.setDetail(null);
        Long id = userMapper.login(user);
        if (id == null) {
            result.setMsg("用户名或密码错误！");
        } else {
            result.setMsg("登陆成功！");
            result.setSuccess(true);
            result.setDetail(user);
        }
        return result;
    }

    @Override
    public Result update(User user) {
        userMapper.update(user);
        Result result = new Result();
        result.setSuccess(true);
        result.setDetail(null);
        result.setMsg("修改成功！");
        return result;
    }

}
