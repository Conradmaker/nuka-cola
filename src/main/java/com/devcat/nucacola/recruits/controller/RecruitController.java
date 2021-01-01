package com.devcat.nucacola.recruits.controller;

import java.util.ArrayList;

import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.vo.Bookmark;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.posts.model.vo.Comment;
import com.devcat.nucacola.recruits.model.service.RecruitService;
import com.devcat.nucacola.recruits.model.vo.Declare;
import com.devcat.nucacola.recruits.model.vo.RecruitDetail;
import com.devcat.nucacola.recruits.model.vo.RecruitSkill;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.recruits.model.vo.Recruit;
import org.springframework.web.bind.annotation.ResponseBody;
import com.devcat.nucacola.recruits.model.vo.Apply;

import javax.servlet.http.HttpSession;

@Controller
public class RecruitController {
	@Autowired
	private RecruitService rService;
	
	@Autowired
	private MemberService mService;

	// 채용상세페이지
	@RequestMapping("detail.re")
	public String selectRecruit(int rno, Model model) {
		System.out.println(rno);

		RecruitDetail info = rService.selectRecruitDetail(rno);
		ArrayList<RecruitSkill> skillList = rService.selectRecruitSkill(rno);
		int appliesCount = rService.selectAppliesCount(rno);

		System.out.println(info);
		System.out.println(skillList);
		model.addAttribute("info",info);
		model.addAttribute("skills",skillList);
		model.addAttribute("appliesCount",appliesCount);
		return "/recruit/recruitDetail";
	}

	@ResponseBody
	@RequestMapping("declare.re")
	public String insertReply(int rno, String declareTitle, HttpSession session){
		System.out.println(rno+"////"+declareTitle);
		Member m= (Member) session.getAttribute("loginUser");
		Declare d = new Declare();
		d.setDeclareTitle(declareTitle);
		d.setRecruitNo(rno);
		d.setUserNo(m.getUserNo());
		int result = rService.insertDeclare(d);
		if(result > 0){
			return "success";
		}else{
			return "fail";
		}
	}
	
	// 지원한 내역조회
	@RequestMapping("list.ap")
	public String selectApplyList(int userNo, Model model, HttpSession session) {
		
		// 조회할 채용정보가져오기
		ArrayList<Apply> applyList = rService.selectApplyList(userNo);
		int applyCount = rService.selectApplyCount(userNo);
		System.out.println(applyList);
		System.out.println(applyCount);
		
		// applylist에 담아 model에 넣고 뿌려주기
		model.addAttribute("applyList", applyList);
		model.addAttribute("applyCount",applyCount);

		
		return "/apply/applyHistory";
			
	}
	// 지원한 내역 삭제하기(지원취소)
	@ResponseBody
	@RequestMapping(value="/delete.ap", produces="text/html; charset=utf-8")
	public void deleteApplyList(Apply ap, HttpSession session) {
		ap.setUserNo(ap.getUserNo());
		System.out.println(ap.getUserNo());
		int result = rService.deleteApplyList(ap);
		System.out.println(result);
		
//		return "redirect:list.ap?userNo="+loginUser.getUserNo();
	}
	
	@RequestMapping("recruitEnroll.re")
	public String recruitEnroll() {
		
		return "/recruit/recruitEnrollForm";
	}
	
	
	@RequestMapping("recruitInsert.re")
	public void insertRecruit(Recruit re, int userNo) {
		
		System.out.println(re);
		
		int compNo = rService.selectCompNo(userNo);
		
		System.out.println(compNo);
		
		
		re.setCompNo(compNo);
		
		
		int minSal = (int)(re.getRecruitMinSal());
		int maxSal = (int)(re.getRecruitMaxSal());
		
		
		System.out.println(minSal);
		System.out.println(maxSal);
		
		re.setRecruitMinSal(minSal);
		re.setRecruitMaxSal(maxSal);
		
		System.out.println(re);

		int result = rService.insertRecruit(re);
		
		if(result>0) {
			System.out.println("삽입 성공!");
			
		}
	}
	// 채용관리 페이지
	@RequestMapping("mDetail.re")
	public String selectRecruitManage(int rno, Model model) {
		
		
		
		return "/recruit/recruitManageDetail";
		
	}
	
	
	
}
