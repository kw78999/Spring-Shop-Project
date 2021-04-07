package com.cos.controller;

import java.io.IOException;
import java.util.Map;
import java.util.Random;
import java.util.logging.Logger;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.domain.MemberVO;
import com.cos.service.MemberService;
import com.cos.util.DateUtil;
import com.cos.util.ZipUtil;

@Controller
public class MemberController {
	private final static Logger logger = Logger.getGlobal();
	
	@Inject
	private MemberService memberService;
	@Inject
	private JavaMailSenderImpl mailSender;//root_context.xml 의존성 객체주입
	
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String login() {
		return "login/login";
	}
	
	@RequestMapping(value="join",method=RequestMethod.GET)
	public String join() {
		return "login/join";
	}
	
	@ResponseBody
	@RequestMapping(value="idCheck",method=RequestMethod.GET)
	public int idCheck(@RequestParam("id")String id) throws Exception {
		int cnt = memberService.idCheck(id);
		return cnt; 
	}
	//ȸ������
	@RequestMapping(value = "newJoin", method = RequestMethod.POST)
	public String newJoin(MemberVO member,HttpServletRequest req,Model model) throws Exception{
		//3���� ��¥���� �����Ͽ� member�� �ѱ��
		String y = req.getParameter("birth1");
		String m = req.getParameter("birth2");
		String d = req.getParameter("birth3");
		DateUtil du = new DateUtil(y,m,d);
		member.setBirth(du.birthFormat());
		//3�� �ּ� �����ڷ� �����ϸ� �ϳ��� ����
		String zip1 = req.getParameter("zip1");
		String zip2 = req.getParameter("zip2");
		String zip3 = req.getParameter("zip3");
		ZipUtil zu = new ZipUtil(zip1, zip2, zip3);
		member.setZipCode(zu.zipFormat());
		//�̸��� ����
		String email = req.getParameter("email");
		String emailSelect = req.getParameter("emailSelect");
		member.setEmail(email+"@"+emailSelect);
		//���ѹ� ����
		String phone1 = req.getParameter("phone1");
		String phone2 = req.getParameter("phone2");
		member.setPhone("010-"+phone1+"-"+phone2);
		memberService.insert(member);
		
		model.addAttribute("email",email+"@"+emailSelect);
		return "forward:mailSend";
	}
	@RequestMapping(value="/mailSend",method = RequestMethod.POST)
	public String mailSend(final MemberVO member,Model model,final HttpServletRequest req) throws Exception {
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() { 
			@Override public void prepare(MimeMessage mimeMessage) throws Exception { 
				final MimeMessageHelper helper = 
						new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
					
		Random rd = new Random();
		int joinCode = rd.nextInt(9000)+1000;
		HttpSession session = req.getSession();
		session.setAttribute("joinCode", joinCode);
		session.setMaxInactiveInterval(300);  
		
		String email = req.getParameter("email");
		String emailSelect = req.getParameter("emailSelect");
		helper.setTo(email+"@"+emailSelect);
		helper.setSubject(member.getId() +"님 가입을 축하합니다."); 
		helper.setText("인증번호 입니다. <br>"+joinCode, true); } };
		
		model.addAttribute("memberId",member.getId());
		model.addAttribute("email",req.getParameter("email")+"@"+req.getParameter("emailSelect"));
		
		mailSender.send(preparator); 
		
		return "redirect:emailCheck";
		
	}
	
	@RequestMapping(value="emailCheck",method=RequestMethod.GET)
	public String emailCheck(Model model,HttpServletRequest req) {
		model.addAttribute("memberId",req.getParameter("memberId"));
		model.addAttribute("email",req.getParameter("email"));
		
		
		return "login/emailCheck"; 
	}
	
	//�̸��� ���� ���ε�
	@RequestMapping(value="emailCertify",method=RequestMethod.GET)
	public String emailCertify(Model model,HttpServletRequest req) throws Exception {
		String id = req.getParameter("id");
		memberService.emailCheck(id);
		
		return "login/login"; 
	}
	
	//�α���
	@RequestMapping(value = "/newLogin", method = RequestMethod.POST)
	public String newLogin(MemberVO member, Model model,
			HttpServletRequest req) throws Exception{
		int cnt = memberService.login(member);
		if(cnt==1) {
			HttpSession session = req.getSession();
			session.setAttribute("id", member.getId());
			return "redirect:index";
		}else {
			model.addAttribute("msg","로그인 성공");
			model.addAttribute("url","login");
			return "redirectJsp";
		}
	}
	//�α׾ƿ�
	@RequestMapping(value="logout",method=RequestMethod.GET)
	public String userLogout(HttpServletRequest req,Model model) throws IOException {
		req.getSession().invalidate();
		
		model.addAttribute("msg","로그아웃 되었습니다.");
		model.addAttribute("url","index");
		
		return "redirectJsp";
	}
	
	//�񵿱� ����� ���� ResPonseBody
	//�����ڵ� ����
	@ResponseBody
	@RequestMapping(value="emailJoin",method=RequestMethod.GET)
	public int emailJoin(HttpServletRequest req,HttpSession session)  throws IOException {
		
			String code=req.getParameter("code");
			//�ð��ʰ�
			if(session.getAttribute("joinCode")==null) {
				return 0;
			}else{
				//����
				if(session.getAttribute("joinCode").toString().equals(code)) {
					return 1;
				//�����ڵ� Ʋ��
				}else {
					return 2;
				}
		}
		
	}
	
}
