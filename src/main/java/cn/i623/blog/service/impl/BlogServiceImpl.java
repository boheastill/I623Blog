package cn.i623.blog.service.impl;

import cn.i623.blog.dao.BlogDao;
import cn.i623.blog.entiy.Blog;
import cn.i623.blog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {
    @Autowired
    BlogDao blogDao;
    @Autowired
    Blog blog;

    //查询全部
    public List<Blog> searchBlogList() {
        List<Blog> blogs = blogDao.findAllBlogs();
        /****blogs：要遍历的对象列表
         *    foreach方法：把单个对象放入自己的参数执行，循环blogs.lenth次
         *       lambda表达式：
         *       （输入参数）—> (输出值、执行语句)
         *       本例输入参数 键的作用范围是lambda表达式中，键的value是外层forecah方法传来的。
         *    对于每个传来的值，输出括号中sout打印
         * ***/
        blogs.forEach((blogsArg) -> System.out.println(blogsArg));
        return blogs;
    }

    //增加博客
    public void addBlog(Blog blog) {
//        blog.setTitle("t0asdfsda1");
//        blog.setAuthor("adf喀什的数量可否考虑a");
//        blog.setContent("啊大开始看");
        blogDao.addBlog(blog);
        //打印
        searchBlogList();
    }

    //查询单个
    public  void  searchBlog(int id){
        Blog blog= blogDao.queryBlogbyid(id);
        System.out.println(blog);
    }

    //修改
    public void editBlog (Blog blog){

        blogDao.updateBlog(blog);

        searchBlog(blog.getId());
    }
//删除
    public  int  removeBlog(int id){
        int effectNum= blogDao.deleteBlog(id);
        System.out.println(effectNum);
        return effectNum;
    }
}
