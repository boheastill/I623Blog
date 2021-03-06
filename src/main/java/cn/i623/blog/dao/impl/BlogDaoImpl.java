package cn.i623.blog.dao.impl;

import cn.i623.blog.dao.BlogDao;
import cn.i623.blog.entiy.Blog;
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
public class BlogDaoImpl implements BlogDao {


    //spring模板类
    private JdbcTemplate jdbcTemplate;

    //dataSource set到ac配置
    @Autowired//注入到了本类，类初始化顺带new出了jdbcTemplate
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
//        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }


    //增加博客
    public void addBlog(Blog blog) {
        Timestamp t = new Timestamp(new Date().getTime());
        this.jdbcTemplate.update(
                "insert into blog (title, content,creattime,modifytime,author) values (?,?,?,?,?)",//参数一定要先问，在出去单独仿佛之
                blog.getTitle(), blog.getContent(), t, t, blog.getAuthor());
    }

    /*
    查询多条记录封装成List<Student>
    如果要封装成List<Student>对象怎么办呢？
用queryForList方法则需要自己实现RowMapper接口。

    List<T> query(String sql, RowMapper<T> rowMapper, Object... args)
    作用：将多条记录封装成一个List集合
​

2) 映射接口，我们提供实现类BeanPropertyRowMapper
3) 占位符的值
​
    返回值：一个集合，每个元素是实体类对象


    *///2.查询全部，被调用类
    public List<Blog> listBlogs(int minIndex, int maxRow) {
        String sql = "select * from blog ORDER BY modifytime desc LIMIT ? OFFSET ?";
        return this.jdbcTemplate.query(sql, new BlogMapper(), maxRow, minIndex);
    }

    //2.查询全部，listBlogs中的返回值处理类
    private static final class BlogMapper implements RowMapper<Blog> {
        public Blog mapRow(ResultSet resultSet, int rowNum) throws SQLException {
            Blog blog = new Blog();
            blog.setId(resultSet.getInt("id"));
            blog.setTitle(resultSet.getString("title"));
            blog.setAuthor(resultSet.getString("author"));
            blog.setContent(resultSet.getString("content"));
            blog.setCreatTime(resultSet.getDate("creatTime"));
            blog.setModifyTime(resultSet.getDate("modifyTime"));
//            System.out.println("dao写入id:" + blog.getId());
            return blog;
        }
    }


    //按条件查询:参数1sql 参数2结果集，可以是处理器，可以是Interget.class，参数3是单个条件
    public Blog queryBlogbyid(int id) {
        Blog blog = this.jdbcTemplate.queryForObject(
                "select * from blog where id = ?",
                new RowMapper<cn.i623.blog.entiy.Blog>() {
                    public Blog mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Blog blog = new Blog();
                        blog.setTitle(rs.getString("title"));
                        blog.setAuthor(rs.getString("author"));
                        blog.setContent(rs.getString("content"));
                        blog.setCreatTime(rs.getDate("creatTime"));
                        blog.setModifyTime(rs.getDate("modifyTime"));
                        blog.setId(rs.getInt("id"));
                        return blog;
                    }
                }
                , id);
        return blog;
    }

    //更新:sql设置了update时候，修改时间 字段会自动更新。
    public void updateBlog(Blog blog) {

        this.jdbcTemplate.update("update blog set title = ?,author=?,content=? where id = ?",
                blog.getTitle(), blog.getAuthor(),blog.getContent(), blog.getId());
    }

    //删除
    public int deleteBlog(int id) {

        return this.jdbcTemplate.update("DELETE from blog where id  =  ?",
                id);

    }

}
