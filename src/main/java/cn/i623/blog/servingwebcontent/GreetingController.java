/*
package cn.i623.blog.servingwebcontent;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GreetingController {

    //@GetMapping annotation ensures that HTTP GET requests to /greeting are mapped to the greeting() method.
    //@RequestParam ：binds  value to greeting() method name parameter,not required.
    @GetMapping("/greeting")
    public String greeting(@RequestParam(name = "name", required = false, defaultValue = "World")
                                   String name, Model model) {
        model.addAttribute("name", name);//name parameter is added to a Model object,
        return "greeting";
    }

}*/
