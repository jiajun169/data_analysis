package cn.edu.ysu.data_analysis.service;

import cn.edu.ysu.data_analysis.bean.Result;
import cn.edu.ysu.data_analysis.bean.User;

public interface UserService {
    Result regist(User user);

    Result login(User user);
}
