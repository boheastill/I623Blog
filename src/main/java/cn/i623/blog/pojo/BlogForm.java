package cn.i623.blog.pojo;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Date;

@Data
public class BlogForm {
    //字段一一对应网页界面
    private String title; //
    private String content; //
    private Date creatTime; //
    private Date modifyTime; //
    private String author; //
    private int id; //
}
