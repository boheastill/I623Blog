package cn.i623.blog.service;

import cn.i623.blog.entiy.Blog;
import cn.i623.blog.pojo.BlogForm;

import java.util.List;

public interface BlogService {
    //查询全部
     List<BlogForm> listBlogs(int maxRow,
             int page);

    //增加博客
     void addBlog(BlogForm blogForm);

    //查询单个
     BlogForm searchBlog(int id);

    //修改
     void editBlog(BlogForm blogForm);

    //删除
     int removeBlog(int id);
}
