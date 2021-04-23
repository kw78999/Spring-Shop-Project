package com.cos.controller;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.jsoup.select.Evaluator.IsEmpty;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cos.domain.ProductOptionVO;
import com.cos.domain.ProductVO;
import com.cos.domain.ProductTextureVO;
import com.cos.service.ProductOptionServie;
import com.cos.service.ProductService;

@Controller
public class ProductController{
	
	private static final String FILE_SERVER_PATH =
			"C:\\Users\\mschoi.DI-SOLUTION\\Desktop\\WorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ShopingMall\\resources\\editor\\upload";
					
	
	@Inject
	private ProductService pService;
	@Inject
	private ProductOptionServie poService;
	
	@RequestMapping(value="productDetails",method=RequestMethod.GET)
	public String productDetails(HttpServletRequest req,Model model) throws Exception  {
		int pNum = Integer.parseInt(req.getParameter("pNum"));
		
		ProductVO product = pService.pSelectOne(pNum);
		model.addAttribute("product",product);
		
		ProductTextureVO productTexture = pService.tSelectOne(pNum);
		model.addAttribute("productTexture",productTexture);
		
		List<ProductOptionVO> oList = poService.optionSelect(pNum);
		model.addAttribute("oList",oList);
		
		return "product/productDetails";
	}
	
	@RequestMapping(value="productUploadPage",method=RequestMethod.GET)
	public String productUploadPage() {
		return "product/productUploadPage";
	}
	
	
	//파일업로드 , 상품업로드 , 재질 업로드 , 옵션있다면 옵션업로드
	@RequestMapping(value="productUpload",method=RequestMethod.POST)
	public String productUpload(@RequestParam("uploadFile") List<MultipartFile> file,
			ProductVO product,ProductOptionVO productOption,
			ProductTextureVO productTexture,ModelAndView mv,Model model) throws Exception {
		 
		
		for (int i = 0; i < file.size(); i++) {
			if(!file.get(i).getOriginalFilename().isEmpty()) {
				file.get(i).transferTo(new File(FILE_SERVER_PATH, file.get(i).getOriginalFilename()));
				model.addAttribute("msg", "File uploaded successfully.");
			}else { 
				model.addAttribute("msg", "Please select a valid mediaFile..");
			}
		}
		
		
		
		
		pService.productUpload(product);
		
		productTexture.setPNum(product.getPNum());
		poService.textureUpload(productTexture);
		
		if(null!=productOption.getList()) {
		//옵션이 있다면 insert 
			for (int i = 0; i < productOption.getList().size(); i++) {
				if(productOption.getList().get(i).getOSize() != null) {
					  productOption.getList().get(i).setPNum(product.getPNum());
					  poService.optionUpload(productOption.getList().get(i));
				}
			}
		}
		
		return "redirect:index";
		
	}
	
}
