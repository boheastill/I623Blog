package cn.i623.blog.dao;

import cn.i623.blog.entiy.Blog;

import javax.sql.DataSource;
import java.util.List;

//托管类、关联属性dataSource

public interface BlogDao {


     void setDataSource(DataSource dataSource);

    //增加博客
     void addBlog(Blog blog);

    //列表查询
     List<Blog> findAllBlogs();

    //查询
     Blog queryBlogbyid(int id);
    //更新
     void updateBlog(Blog blog);
    //删除
     int deleteBlog(int id) ;
}