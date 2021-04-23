package com.cos.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.logging.Logger;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.domain.MemberVO;
import com.cos.service.MemberService;
import com.cos.util.DateUtil;
import com.cos.util.KaKaoApi;
import com.cos.util.NaverLoginBO;
import com.cos.util.ZipUtil;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class MemberController {
	private final static Logger logger = Logger.getGlobal();
	
	private String apiResult = null;

	@Autowired
	private NaverLoginBO naverLoginBO;

	@Inject
	private MemberService memberService;
	@Inject
	private JavaMailSenderImpl mailSender;// root_context.xml 의존성 객체주입

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		model.addAttribute("url", naverAuthUrl);

		return "login/login";
	}
	
	@RequestMapping(value = "kakaoTest", method = RequestMethod.GET)
	public String kakaoTest(@RequestParam("code") String code,HttpSession session) {
		
		KaKaoApi kApi = new KaKaoApi();
		String access_token = kApi.getAccessToken(code);
		
		HashMap<String, Object> userInfo = kApi.getUserInfo(access_token);
	    System.out.println("login Controller : " + userInfo);
	    
	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if (userInfo.get("email") != null) {
	        session.setAttribute("id", "kakao  "+userInfo.get("email"));
	        session.setAttribute("access_Token", access_token);
	    }
	    
	    return "forward:index";
	}
	
	
	
	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "loginTest", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException, org.json.simple.parser.ParseException {
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		
		
		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		System.out.println("response_obj   "+response_obj);
		// response의 nickname값 파싱
		String name = (String) response_obj.get("name");
		System.out.println("name   "+name);
		
		// 4.파싱 닉네임 세션으로 저장
		session.setAttribute("id", "naver "+name); // 세션 생성
		model.addAttribute("result", apiResult);
		
		return "forward:index";
	}

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "login/join";
	}

	@ResponseBody
	@RequestMapping(value = "idCheck", method = RequestMethod.GET)
	public int idCheck(@RequestParam("id") String id) throws Exception {
		int cnt = memberService.idCheck(id);
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping(value = "mlist", method = RequestMethod.GET)
	public List<MemberVO> mlist() throws Exception {
		List<MemberVO>list = memberService.mlist();
		logger.info("member객체 수 : "+list.size());
		return list;
	}
	
	// 회원가입
	@Transactional
	@RequestMapping(value = "newJoin", method = RequestMethod.POST)
	public String newJoin(MemberVO member, HttpServletRequest req, Model model) throws Exception {
		// 생년월일
		String y = req.getParameter("birth1");
		String m = req.getParameter("birth2");
		String d = req.getParameter("birth3");
		DateUtil du = new DateUtil(y, m, d);
		member.setBirth(du.birthFormat());
		// 주소
		String zip1 = req.getParameter("zip1");
		String zip2 = req.getParameter("zip2");
		String zip3 = req.getParameter("zip3");
		ZipUtil zu = new ZipUtil(zip1, zip2, zip3);
		member.setZipCode(zu.zipFormat());

		String email = req.getParameter("email");
		String emailSelect = req.getParameter("emailSelect");
		member.setEmail(email + "@" + emailSelect);

		String phone1 = req.getParameter("phone1");
		String phone2 = req.getParameter("phone2");
		member.setPhone("010-" + phone1 + "-" + phone2);
		memberService.insert(member);
		logger.info("insert");
		
		memberService.emailCheck(member.getId());
		logger.info("emailcheck");
		
		model.addAttribute("email", email + "@" + emailSelect);
		return "forward:mailSend";
	}

	@RequestMapping(value = "/mailSend", method = RequestMethod.POST)
	public String mailSend(final MemberVO member, Model model, final HttpServletRequest req) throws Exception {

		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

				Random rd = new Random();
				int joinCode = rd.nextInt(9000) + 1000;
				HttpSession session = req.getSession();
				session.setAttribute("joinCode", joinCode);
				session.setMaxInactiveInterval(300);

				String email = req.getParameter("email");
				String emailSelect = req.getParameter("emailSelect");
				helper.setTo(email + "@" + emailSelect);
				helper.setSubject(member.getId() + "님 가입을 축하합니다.");
				helper.setText("인증번호 입니다. <br>" + joinCode, true);
			}
		};

		model.addAttribute("memberId", member.getId());
		model.addAttribute("email", req.getParameter("email") + "@" + req.getParameter("emailSelect"));

		mailSender.send(preparator);

		return "redirect:emailCheck";

	}

	@RequestMapping(value = "emailCheck", method = RequestMethod.GET)
	public String emailCheck(Model model, HttpServletRequest req) {
		model.addAttribute("memberId", req.getParameter("memberId"));
		model.addAttribute("email", req.getParameter("email"));

		return "login/emailCheck";
	}

	// �̸��� ���� ���ε�
	@RequestMapping(value = "emailCertify", method = RequestMethod.GET)
	public String emailCertify(Model model, HttpServletRequest req) throws Exception {
		String id = req.getParameter("id");
		memberService.emailCheck(id);

		return "login/login";
	}

	// �α���
	@RequestMapping(value = "/newLogin", method = RequestMethod.POST)
	public String newLogin(MemberVO member, Model model, HttpServletRequest req) throws Exception {
		int cnt = memberService.login(member);
		if (cnt == 1) {
			HttpSession session = req.getSession();
			session.setAttribute("id", member.getId());
			return "redirect:index";
		} else {
			model.addAttribute("msg", "로그인 실패");
			model.addAttribute("url", "login");
			return "redirectJsp";
		}
	}

	// �α׾ƿ�
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String userLogout(HttpServletRequest req, Model model) throws IOException {
		req.getSession().invalidate();

		model.addAttribute("msg", "로그아웃 되었습니다.");
		model.addAttribute("url", "index");

		return "redirectJsp";
	}

	// �񵿱� ����� ���� ResPonseBody
	// �����ڵ� ����
	@ResponseBody
	@RequestMapping(value = "emailJoin", method = RequestMethod.GET)
	public int emailJoin(HttpServletRequest req, HttpSession session) throws IOException {

		String code = req.getParameter("code");
		// �ð��ʰ�
		if (session.getAttribute("joinCode") == null) {
			return 0;
		} else {
			// ����
			if (session.getAttribute("joinCode").toString().equals(code)) {
				return 1;
				// �����ڵ� Ʋ��
			} else {
				return 2;
			}
		}

	}

}
