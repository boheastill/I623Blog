package cn.i623.blog.service;

import cn.i623.blog.pojo.UserForm;

public interface UserService {
    boolean login(UserForm user);
    boolean register(UserForm user);
}