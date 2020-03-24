package cn.i623.blog.controller;

import cn.i623.blog.entiy.Blog;
import cn.i623.blog.pojo.BlogForm;
import cn.i623.blog.pojo.UserForm;
import cn.i623.blog.service.BlogService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/blog")
public class BlogController {
    @Autowired
    BlogService blogService;

    @RequestMapping(value = "/tryToMain")
    public String ruturnMain(UserForm userForm) {
//        //登录状态，就转发
//        if (userForm.getName() == null || "".equals(userForm.getName().trim().replace(" ", ""))) {
//            return "register";
//        } else {
//            return "mian";
//        }
        return "main";
    }

    @RequestMapping(value = "/add")
    public String saveBlog(@ModelAttribute("blog") BlogForm blogForm) {
        blogService.addBlog(blogForm);
        return "addview";
    }

    @RequestMapping(value = "/findlist")
    public String listBlog(Model model) {
        int maxRow=30;
        int page = 1;


        List<BlogForm> listBlogs = blogService.listBlogs(maxRow, page);
        /*for (BlogForm blog:listBlogs){
            System.out.println("控制类"+blog.getId());
        }*/

        model.addAttribute("listBlogs",listBlogs);
//        model.addAttribute(listBlogs);
        return "listBlogView";
    }


    @RequestMapping(value = "/edit")
    public String editBlog(@ModelAttribute("blog") BlogForm blogForm) {
        blogService.editBlog(blogForm);
        return "editblog";
    }

    /**
     * 读取所保存的markdown数据
     *
     * @return
     */
    @RequestMapping(value = "getBolgForm")//和js里面名字一样，这里被访问
    @ResponseBody//返回页面
    public String getBolgForm(BlogForm blogForm, HttpServletRequest req) {
        System.out.println("blogform控制");
        String blogId = req.getParameter("blogId");
        System.out.println(blogId);
        Blog blog = blogService.searchBlog(50);
        blogForm.setContent(blog.getContent());
        blogForm.setTitle(blog.getTitle());
        blogForm.setAuthor(blog.getAuthor());
        blogForm.setCreatTime(blog.getCreatTime());
        blogForm.setModifyTime(blog.getModifyTime());
        Gson gson = new Gson();
        String blogFormJson = gson.toJson(blogForm);
//        System.out.println("后台发送："+blogFormJson);
        return blogFormJson;
    }


    /**
     * 上传文件
     *
     * @return
     */
    @RequestMapping("uploadMdFile.json")
    @ResponseBody
    public Map<String, Object> getContent(HttpServletRequest request, @RequestParam(value = "file", required = false) MultipartFile file, String topicCode) {
        Map<String, Object> resultMap = new HashMap<>();
        if (topicCode != null && !"".equals(topicCode)) {
            //该CODE用于对应图片存储，实际项目中需要存储该文章与图片的关系，我这不做处理
            System.out.println("主题CODE->" + topicCode);
        }
        try {
            // 检测是不是存在上传文件
//            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            boolean isMultipart = true;
            if (isMultipart) {
                MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
                Map<String, MultipartFile> multipartFileMap = multipartRequest.getFileMap();
                for (Map.Entry<String, MultipartFile> entryFile : multipartFileMap.entrySet()) {
                    MultipartFile value = entryFile.getValue();
                    //读取输入流
                    InputStream is = value.getInputStream();
                    //获取文件名
                    String fileName = value.getOriginalFilename();
                    //声明byte缓冲数组
                    byte[] b = new byte[(int) value.getSize()];
                    is.read(b);
                    //将文件名上传的name作为返回的key，默认为file
                    resultMap.put(entryFile.getKey(), fileName);
                    //返回接口调用状态码
                    resultMap.put("retCode", "success");
                    //返回图片访问路径，此处可以改为OSS分布式存储，根据项目具体情况调整
                    resultMap.put("rootPath", "http://localhost:8080/" + fileName);
                    //上传到文件服务器路径，此处我直接上传到项目部署编译路径，需要调整
                    OutputStream os = new FileOutputStream(new File("D:\\hub\\boheaSpances\\i623blogResourse", fileName));
                    os.write(b);
                    os.flush();
                }
            }
        } catch (Exception e) {
        }
        return resultMap;
    }
}