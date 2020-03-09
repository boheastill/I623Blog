package cn.i623.blog.service;

import cn.i623.blog.entiy.Blog;

import java.util.List;

public interface BlogService {
    //查询全部
    public List<Blog> searchBlogList();

    //增加博客
    public void addBlog(Blog blog);

    //查询单个
    public void searchBlog(int id);

    //修改
    public void editBlog(Blog blog);

    //删除
    public int removeBlog(int id);
}
