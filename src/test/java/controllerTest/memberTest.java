package controllerTest;

import static org.junit.Assert.assertTrue;

import java.io.File;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cos.domain.MemberVO;
import com.cos.domain.ProductOptionVO;
import com.cos.domain.ProductTextureVO;
import com.cos.domain.ProductVO;
import com.cos.service.MemberService;
import com.cos.service.ProductOptionServie;
import com.cos.service.ProductService;

import domainTest.MemberVOTest;
import serviceTest.MemberServiceTest;
import serviceTest.MemberServiceTestImpl;


public class memberTest {
	
	
	MemberServiceTest memberServiceTest = new MemberServiceTestImpl();
	
	
	JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
	
	
	@Ignore
	public void newLogin() throws Exception{ 
		
		MemberVOTest member = new MemberVOTest();
		member.setId("admin");
		member.setPwd("1");
		
		int cnt = memberServiceTest.login(member);
		assertTrue(cnt==1);
	}
	
	
	@Test
	public void mailSend() throws Exception {
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() { 
			@Override public void prepare(MimeMessage mimeMessage) throws Exception { 
				final MimeMessageHelper helper = 
						new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
				
		MemberVOTest member = new MemberVOTest();
		member.setId("test");
				
		Random rd = new Random();
		int joinCode = rd.nextInt(9000)+1000;
//		HttpSession session = req.getSession();
//		session.setAttribute("joinCode", joinCode);
//		session.setMaxInactiveInterval(300);  
		
		//String email = req.getParameter("email");
		//String emailSelect = req.getParameter("emailSelect");
		
		helper.setTo("kw7899@naver.com");
		helper.setSubject(member.getId() +" 님 가입을 축하합니다."); 
		helper.setText("인증번호 입니다. <br>"+joinCode, true); } };
		
		
		mailSender.send(preparator); 
		
	}
	
}