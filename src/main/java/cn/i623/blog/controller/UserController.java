package cn.i623.blog.controller;

import javax.servlet.http.HttpSession;

import cn.i623.blog.pojo.UserForm;
import cn.i623.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.sun.org.apache.commons.logging.Log;
//import com.sun.org.apache.commons.logging.LogFactory;
@Controller
@RequestMapping("/user")
public class UserController {
    // 得到一个用来记录日志的对象，这样在打印信息的时候能够标记打印的是哪个类的信息
//    private static final Log logger = LogFactory.getLog(UserController.class);

    @Autowired
    public UserService userService;
    /**
     * 处理登录
     */
    @RequestMapping("/login")
    public String login(UserForm user, HttpSession session, Model model) {
        model.addAttribute("user",user);
        if (user.getName()!=null &&userService.login(user)) {
//            session.setAttribute("u", user);
//            logger.info("成功");
            return "main"; // 登录成功，跳转到 main.jsp
        } else {
//            logger.info("失败");
            model.addAttribute("messageError", "用户名或密码错误");
            return "login";
        }
    }

    /**
     * 处理注册
     */
    @RequestMapping("/register")
    public String register(@ModelAttribute("user") UserForm user) {

        System.out.println("注册-----------"+user.toString());
        if (user.getName()!=null &&userService.register(user)) {
//            logger.info("成功");
            return "main"; // 注册成功，跳转到 login.jsp
        } else {
//            logger.info("失败");
            // 使用@ModelAttribute("user")与model.addAttribute("user",user)的功能相同
            // 在register.jsp页面上可以使用EL表达式${user.uname}取出ModelAttribute的uname值
//            model.addAttribute("userName", user.getName());
            return "register"; // 返回register.jsp
        }
    }
}