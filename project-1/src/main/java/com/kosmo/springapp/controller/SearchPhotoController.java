package com.kosmo.springapp.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kosmo.springapp.service.SearchPhotoMapper;

@RestController
public class SearchPhotoController {
	private final SearchPhotoMapper searchPhotoMapper;
	
	@Autowired
    public SearchPhotoController(SearchPhotoMapper searchPhotoMapper) {
        this.searchPhotoMapper = searchPhotoMapper;
    }
	
	@CrossOrigin
	@GetMapping("/searchphotono.do")
    public String matchPhotoNo(@RequestParam String searchPhotoName,HttpServletResponse response ) {
		System.out.println("searchPhotoName:"+searchPhotoName);
        String searchPhotoNo = searchPhotoMapper.findNoByName(searchPhotoName);
        System.out.println("searchPhotoNo:"+searchPhotoNo);
        if (searchPhotoNo != null) {
            String redirectUrl = "/detail.do?no=" + searchPhotoNo;
            try {
                response.sendRedirect(redirectUrl);
                return null;
            } catch (IOException e) {
                e.printStackTrace();
                return "실패";
            }
        } else {
        	String redirectNotUrl = "/ranking/selectfood.do";
            try {
                response.sendRedirect(redirectNotUrl);
                return null;
            } catch (IOException e) {
                e.printStackTrace();
                return "실패";
            }
        }
    }
}