package cn.i623.blog;

import cn.i623.blog.entiy.Blog;
import cn.i623.blog.service.BlogService;
import cn.i623.blog.service.impl.BlogServiceImpl;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
    static ApplicationContext applicationContext = new ClassPathXmlApplicationContext
            ("applicationContext.xml");
    static BlogService blogService = (BlogService) applicationContext.getBean("blogServiceImpl");
    static Blog blog = (Blog) applicationContext.getBean("blog");

    public static void main(String[] args) {
       blogService.removeBlog(2);
    }


}
