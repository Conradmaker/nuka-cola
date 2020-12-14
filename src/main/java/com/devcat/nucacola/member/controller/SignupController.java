package com.devcat.nucacola.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.service.MemberServiceImpl;
import com.devcat.nucacola.member.model.vo.Member;

@Controller
public class SignupController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberServiceImpl mailsender;//이메일인증전용
	
	// 로그인 폼 화면 띄우기
	@RequestMapping("loginForm.me")
	public String loginForm() {
		return "user/login";
	}
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv, HttpServletRequest request) {
		
		Member loginUser = mService.loginMember(m);
		
		System.out.println("암호화 전 비번 : " + m.getUserPwd());
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())
				&& loginUser.getEmailAuth().equals("Y")) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("timeline/timeline");
			
		}else if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			
			mailsender.mailSendWithUserKey(loginUser,request); // 이 부분 작동이 안되는 거 같음!?
			session.setAttribute("alertMsg", "작성해주신 이메일로 회원가입 인증메일을 보냈습니다.\n인증을 완료해주세요!");
			mv.setViewName("redirect:/");
			
		}else {
			mv.addObject("errorMsg", "로그인 실패!");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "user/login";
	}
	
	
	//회원가입 폼 화면 띄우기
	@RequestMapping("signupForm.me")
	public String signupForm() {
		return "user/signup";
	}
	
	
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model, HttpSession session, HttpServletRequest request) {
		
		System.out.println(m);
		
		// 회원가입 시 입력한 비밀번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		
		
		int result = mService.insertMember(m);
		
		
		
		if(result>0) {//회원가입 성공
			
			//인증메일 보내기 메소드
			mailsender.mailSendWithUserKey(m,request);//직전에 insert한 회원 userNo 조회해 가져와서 추가로 넘겨주자 일단은 그냥함
			
			session.setAttribute("alertMsg", "작성해주신 이메일로 회원가입 인증메일을 보냈습니다.\n인증을 완료해주세요!");
			return "redirect:/";
			
		}else {//회원가입 실패
			
			model.addAttribute("errorMsg","회원가입 실패!");
			return "common/errorPage";
			
		}
		
	}
	
	
	//인증메일 받고 인증 링크 누르면 실행되는 메소드 
	@RequestMapping("confirmEmail.me")
	public String confirmEmail(Member m,Model model, HttpSession session) {
		
		//DB에 auth값을 Y로 변경해주자
		
		int result = mailsender.confirmEmail(m);
		
		if(result>0) {
			session.setAttribute("alertMsg", "이메일 인증이 완료되었습니다! 환영합니다 :)");
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg","이메일인증 실패");
			return "common/errorPage";
		}
	}
	

	
	
	
	
}