package cn.i623.blog.webHierarchy.servlet.impl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

/** 在线更新1.update 2.reload
 * idea service 控制台乱码1.mysql：log改gbk。 2.java sout  ：edit 服务器，取消勾选使用环境变量 3.参数乱码， 设置encode
 * */
@WebServlet("/WebService")
public class WebService extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String title; //
    private String content; //
    private Date creatTime; //
    private Date modifyTime; //
    private String author; //
    private int id; //

    /**
     * @see HttpServlet#HttpServlet()
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    //1.java的sout语句，redploy或者重启服务器才生效
    //2.output 页面，可以输出控制台语句
    //3.页面每次提交，会经过现在这个页面
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setCharacterEncoding("UTF-8");
        String title = new String(request.getParameter("title").getBytes("ISO-8859-1"), "UTF-8");

    }


    // 处理 POST 方法请求的方法
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        String title = request.getParameter("title");
        System.out.println(title);
        request.getRequestDispatcher("index.jsp").forward(request, response); //内容转发
    }

    /**
     * 判断字符串的编码
     *
     * @param str
     * @return
     */
    public static String getEncoding(String str) {
        String encodeArray[] = new String[]{
                "UTF-8",
                "ISO-8859-1",
                "GB2312",
                "GBK",
                "GB18030",
                "Big5",
                "Unicode",
                "ASCII"
        };
        for (String encode : encodeArray) {
            try {
                if (str.equals(new String(str.getBytes(encode), encode))) {
                    return encode;
                }
            } catch (Exception ex) {
            }
        }
        return "";
    }


}