package cn.i623.blog.entiy;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.sql.Date;

@Data
@Component
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

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


}