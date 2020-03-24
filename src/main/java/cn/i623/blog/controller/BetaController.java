package cn.i623.blog.controller;

import cn.i623.blog.entiy.Blog;
import cn.i623.blog.pojo.BlogForm;
import cn.i623.blog.pojo.UserForm;
import cn.i623.blog.service.BlogService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value = "/beta")
public class BetaController {

    @RequestMapping(value = "/icon")
    public String ruturnMain(UserForm userForm) {
        //登录状态，就转发
        return "icondemo";
    }


}