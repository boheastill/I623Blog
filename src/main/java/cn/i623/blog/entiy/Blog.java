package cn.i623.blog.entiy;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Date;

@Data
@Component
public class Blog {
    //字段一一对应sql字段，仅可不区分大小写。
    private String title; //
    private String content; //
    private Date creatTime; //
    private Date modifyTime; //
    private String author; //
    private int id; //
}
