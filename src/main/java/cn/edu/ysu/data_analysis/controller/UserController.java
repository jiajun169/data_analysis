package cn.edu.ysu.data_analysis.controller;

import cn.edu.ysu.data_analysis.bean.Result;
import cn.edu.ysu.data_analysis.bean.User;
import cn.edu.ysu.data_analysis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public Result login(User user, HttpSession session) {
        session.setAttribute("user", user);
        return userService.login(user);
    }

    @RequestMapping("/regist")
    public Result regist(User user) {
        return userService.regist(user);
    }

    @RequestMapping("/update")
    public Result update(User user, HttpSession session) {
        session.setAttribute("user", user);
        return userService.update(user);
    }

    @RequestMapping("/logout")
    public void logout(HttpServletResponse response, HttpSession session) throws IOException {
        session.removeAttribute("user");
        response.sendRedirect("/login.html");
    }
}
