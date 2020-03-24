package cn.i623.blog.pojo;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Date;


@Data
public class UserForm {

    private static final long serialVersionUID = 145155515L;

    /**
     * id
     */
    private Integer id;

    /**
     * name
     */
    private String name;

    /**
     * password
     */
    private String password;

    /**
     * score
     */
    private Integer score;

    /**
     * creattime
     */
    private Date creattime;
    private String command;

}
