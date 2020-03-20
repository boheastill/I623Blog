package cn.i623.blog.dao;

import cn.i623.blog.entiy.User;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

//托管类、关联属性dataSource

public interface UserDao {


    //新增用户
    public void addUser(User user);

    //查询用户
    public List<User> findAll();

    public User querybyUser(String username) ;

    //更新用户
    public void updateUser(User user);

    //删除用户
    public int deleteUser(int id);
}