package cn.i623.blog.dao;

import cn.i623.blog.entiy.Blog;

import javax.sql.DataSource;
import java.util.List;

//托管类、关联属性dataSource

public interface BlogDao {


    public void setDataSource(DataSource dataSource);

    //增加博客
    public void addBlog(Blog blog);

    //查询全
    public List<Blog> findAllBlogs();

    //按条件查询:参数1sql 参数2结果集，可以是处理器，可以是Interget.class，参数3是单个条件
    public Blog queryBlogbyid(int id);
    //更新
    public void updateBlog(Blog blog);
    //删除
    public int deleteBlog(int id) ;
}