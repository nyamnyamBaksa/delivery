package com.delivery.web.review;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/reviewwrite")
	public String reviewwrite(@RequestParam(value = "sno", required = false) int sno, Model model) {

		List<Map<String, Object>> reviewgroup = reviewService.reviewgroup(sno);
		
	    model.addAttribute("reviewgroup", reviewgroup);
	    
	    return "reviewwrite";
	}
	

    @PostMapping("/reviewwrite")
    public String saveReview(@RequestParam Map<String, Object> map, HttpSession session) {
    	
    	map.put("mno", (Integer) session.getAttribute("mno"));
    	
    	int rating = Integer.parseInt((String) map.get("rating"));
    	
    	map.put("rscore",rating);
    	 System.out.println(map);
    	int result = reviewService.saveReview(map);
    	
    	if(result == 1) {
    		return "redirect:/food/review?sno="+ map.get("sno");
    	} 
    	return "login";
    }

    @GetMapping("/food/review")
    public String review(@RequestParam(value="sno", required = false) int sno , Model model) {
    	
    	List<Map<String, Object>> review = reviewService.review(sno);
    	model.addAttribute("reviewview", review);
    	
    	Map<String, Object> countrscore = reviewService.countrscore(sno);
    	model.addAttribute("countrscore",countrscore);
    	
    	return "review";
    }
    @ResponseBody
	@PostMapping("/reviewwrite/img") // 모바일 전용
	public String updateReviewImg(@RequestParam("file") MultipartFile file, @RequestParam Map<String, Object> map,
	        HttpSession session) {
    
	    System.out.println(file);
	    System.out.println(map);
	    
	    
	    if (session.getAttribute("mid") != null && (int) session.getAttribute("mgrade") >= 1) {  
	        if (file != null && !file.isEmpty()) {
	            String path = "src/main/webapp/img/review";

	            LocalDateTime ldt = LocalDateTime.now();
				String format = ldt.format(DateTimeFormatter.ofPattern("YYYYMMddHHmmss"));
				// 이미지 저장
				String realFileName = format + file.getOriginalFilename();

	            File newFileName = new File(path, realFileName);
	            
	            // 디렉토리가 존재하지 않으면 생성
	            if (!newFileName.getParentFile().exists()) {
	                newFileName.getParentFile().mkdirs();
	            }

	            try {
	                byte[] fileBytes = file.getBytes();
	                System.out.println(fileBytes);
	                System.out.println("Copying to: " + newFileName.getAbsolutePath());
	                // 파일 경로를 생성하지 않고 직접 복사
	                FileOutputStream fos = new FileOutputStream(newFileName);
	                fos.write(fileBytes);
	                fos.close();

	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	            String reviewImg = realFileName;
	            JSONObject json = new JSONObject();
	            json.put("reviewImg", reviewImg);
	            return json.toString();
	            
	        } else {
	            return "redirect:/mypage/main";
	        }
	    } else {
	        return "redirect:/login";
	    }
	}
  
}
