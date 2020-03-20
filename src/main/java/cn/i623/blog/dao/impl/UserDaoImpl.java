package cn.i623.blog.dao.impl;

import cn.i623.blog.dao.UserDao;
import cn.i623.blog.entiy.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {


    //spring模板类
    private JdbcTemplate jdbcTemplate;

    //dataSource set到ac配置
    @Autowired//注入到了本类，类初始化顺带new出了jdbcTemplate
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    //增加用户
    public void addUser(User user) {
        Timestamp creattime = new Timestamp(new Date().getTime());
        this.jdbcTemplate.update(
                "insert into user (name, PASSWORD,creattime) values (?,?,?)",//参数？申明，再赋值
                user.getName(), user.getPassword(), creattime);
    }


    //2.查询全部，被调用类
    public List<User> findAll() {
        return this.jdbcTemplate.query("select * from user", new UserMapper());
    }

    //2.查询全部，findAllUsers中的返回值处理类
    private static final class UserMapper implements RowMapper<User> {
        public User mapRow(ResultSet resultSet, int rowNum) throws SQLException {
            User user = new User();
            user.setId(resultSet.getInt("id"));
            user.setName(resultSet.getString("title"));
            user.setPassword(resultSet.getString("author"));
            user.setScore(resultSet.getInt("content"));
            user.setCreattime(resultSet.getDate("creatTime"));
            return user;
        }
    }


    //按条件查询:参数1sql 参数2结果集，可以是处理器，可以是Interget.class，参数3是单个条件
    public User querybyUser(String name) {
        User user = this.jdbcTemplate.queryForObject(
                "select * from user where name = ?",
                new RowMapper<User>() {
                    public User mapRow(ResultSet resultSet, int rowNum) throws SQLException {
                        User user = new User();
                        user.setId(resultSet.getInt("id"));
                        user.setName(resultSet.getString("name"));
                        user.setPassword(resultSet.getString("password"));
                        user.setScore(resultSet.getInt("score"));
                        user.setCreattime(resultSet.getDate("creatTime"));
                        return user;
                    }
                }
                , name);
        return user;
    }

    //更新
    public void updateUser(User user) {

        this.jdbcTemplate.update("update user set name=?, PASSWORD=?,score=? where id = ?",
                user.getName(), user.getPassword(), user.getScore(), user.getId());
    }

    //删除
    public int deleteUser(int id) {

        return this.jdbcTemplate.update("DELETE from user where id  =  ?",
                id);
    }

}
