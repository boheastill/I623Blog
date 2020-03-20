package cn.i623.blog.service.impl;

import cn.i623.blog.dao.UserDao;
import cn.i623.blog.entiy.User;
import cn.i623.blog.pojo.UserForm;
import cn.i623.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


//注解为一个服务
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;
    public boolean login(UserForm user) {
        String formName = user.getName();

        String formPassword = user.getPassword();

        User userEntiy = userDao.querybyUser(formName);
        if (userEntiy!=null&& formPassword.equals(userEntiy.getPassword())){
            return true;
        }
        return false;
    }

    public boolean register(UserForm userForm) {
        if (true){
            User user =new User();
            user.setName(userForm.getName());
            user.setPassword(userForm.getPassword());
            userDao.addUser(user);
            return true;
        }
        return false;
    }
}