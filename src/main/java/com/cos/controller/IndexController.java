package com.cos.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cos.domain.ProductVO;
import com.cos.service.ProductService;

@Controller
public class IndexController {

	@Inject
	private ProductService pService;
	
	
	@RequestMapping(value="index",method = {RequestMethod.GET, RequestMethod.POST})
	public String index(Model model) throws Exception {
		
		List<ProductVO> list = pService.productSelect();
		
		model.addAttribute("list", list);
		
		
		return "index2";
	}
	
	
	
}
