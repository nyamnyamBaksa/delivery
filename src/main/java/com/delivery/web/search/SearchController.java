package com.delivery.web.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {



@RequestMapping("/search")   
public ModelAndView list(
        @RequestParam(defaultValue="1") int curPage,

        @RequestParam(defaultValue="user_id") String search_option,

        @RequestParam(defaultValue="") String keyword

        )
         throws Exception{
    
    
    int count = 1000;
    
    
    //Page page = new Page(count, curPage);
    //int start = page.getPageBegin();
    //int end =  page.getPageEnd();
         

    //List<SearchDTO> list = memberboardservice.listAll(search_option, keyword, start, end);
    
    ModelAndView mav = new ModelAndView();
    //Map<String,Object> map = new HashMap()<>();   
    
   // map.put("list", list);                         
   // map.put("count", count);
   // map.put("search_option", search_option);
   // map.put("keyword", keyword);
    //mav.addObject("map", map);                    
    
    //System.out.println("map : "+map);
    mav.setViewName("board/memberboard");                
    
    return mav;    

}
}