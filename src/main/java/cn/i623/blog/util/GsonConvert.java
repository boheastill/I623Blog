package cn.i623.blog.util;

import com.google.gson.Gson;

public class GsonConvert {

    String Object2Json(Object object){
        Gson gson= new Gson();
        return gson.toJson(object);
    }
}
