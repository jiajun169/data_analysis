package cn.edu.ysu.data_analysis.controller;

import cn.edu.ysu.data_analysis.bean.Result;
import cn.edu.ysu.data_analysis.bean.User;
import cn.edu.ysu.data_analysis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public Result login(User user) {
        return userService.login(user);
    }

    @RequestMapping("/regist")
    public Result regist(User user) {
        return userService.regist(user);
    }
}
