package cn.i623.blog.service.impl;

import cn.i623.blog.dao.BlogDao;
import cn.i623.blog.entiy.Blog;
import cn.i623.blog.pojo.BlogForm;
import cn.i623.blog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {
    @Autowired
    BlogDao blogDao;
    @Autowired
    Blog blog;

    //查询全部
    public List<BlogForm> listBlogs(int maxRow, int page) {
//        System.out.println("进入bloglit服务类");
        //页n ，1开始计算；行m， 0开始
        //    页 1 1 1 1
        //    页 2 2 2 2
        //    页 3 3 3 3
        //起始=mn-m,结束=mn-1
        int minIndex = maxRow * page - maxRow;
//        int maxIndex = maxRow * page - 1;
        page++;
        List<Blog> listBlogs = blogDao.listBlogs(minIndex, maxRow);
        /****listBlogs：列表对象，用来被遍历
         *    foreach方法：循环 列表的长度 次，blog变量代表当前正在被遍历对象。
         *       lambda表达式：
         *       （输入参数）—> (输出值、执行语句)
         *       本例输入参数 键的作用范围是lambda表达式中，键的value是外层forecah方法传来的。
         *    对于每个传来的值，输出括号中sout打印
         * ***/
        List<BlogForm> listBlogForms = new ArrayList<>();
        //遍历bolglist
        for (int i = 0; i < listBlogs.size(); i++) {
            BlogForm blogForm = new BlogForm();
            blog = listBlogs.get(i);
            blogForm.setId(blog.getId());
            blogForm.setTitle(blog.getTitle());
            blogForm.setAuthor(blog.getAuthor());
            blogForm.setContent(blog.getContent());
            blogForm.setCreatTime(blog.getCreatTime());
            blogForm.setModifyTime(blog.getModifyTime());
            //add保存对象的引用，自己不保存对象数据。
            //list add 了对象，对象变了，list保存的值也变了。
            // 导致最开始存的所有值都会因为对象的变化而丢失，最后每一行都是最后一个add上去的值
            listBlogForms.add(blogForm);
//            System.out.println("服务listformsid" + listBlogForms.get(i).getId());
        }
//        System.out.println("服务返回" + listBlogForms.toString());
        return listBlogForms;
    }

    //增加博客
    public void addBlog(BlogForm blogForm) {
        Blog blog=new Blog();
        blog.setTitle(blogForm.getTitle());
        blog.setAuthor(blogForm.getAuthor());
        blog.setContent(blogForm.getContent());
//        System.out.println(blogForm.getContent());

        //写入dao
        blogDao.addBlog(blog);
        //打印
//        searchBlogList();
    }

    //查询
    public Blog searchBlog(int id){
        Blog blog= blogDao.queryBlogbyid(id);
//        System.out.println(blog);
        return blog;
    }

    //修改
    public void editBlog (BlogForm blogForm){
        blog.setTitle(blogForm.getTitle());
        blog.setAuthor(blogForm.getAuthor());
        blog.setContent(blogForm.getContent());
        blogDao.updateBlog(blog);
//        searchBlog(blog.getId());
    }
//删除
    public  int  removeBlog(int id){
        int effectNum= blogDao.deleteBlog(id);
        System.out.println(effectNum);
        return effectNum;
    }
}
