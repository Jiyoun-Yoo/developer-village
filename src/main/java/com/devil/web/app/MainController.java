package com.devil.web.app;

import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.devil.domain.Tag;
import com.devil.domain.User;
import com.devil.service.TagService;

@Controller
@RequestMapping
@SessionAttributes("loginUser")
public class MainController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  TagService tagService;

  @GetMapping("main.do")
  public String initMain(@ModelAttribute("loginUser") User loginUser, Model model) throws Exception {
    
    List<Tag> tagList = tagService.list((String) null);
    model.addAttribute("tagList", tagList);
    return "main/main";
  }
}