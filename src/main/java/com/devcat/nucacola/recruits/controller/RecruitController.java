package com.devcat.nucacola.recruits.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.common.template.Pagination;
import com.devcat.nucacola.company.model.service.CompanyService;
import com.devcat.nucacola.company.model.vo.Industries;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.recruits.model.service.RecruitService;
import com.devcat.nucacola.recruits.model.vo.Apply;
import com.devcat.nucacola.recruits.model.vo.ApplyList;
import com.devcat.nucacola.recruits.model.vo.Counsel;
import com.devcat.nucacola.recruits.model.vo.Declare;
import com.devcat.nucacola.recruits.model.vo.Recruit;
import com.devcat.nucacola.recruits.model.vo.RecruitDetail;
import com.devcat.nucacola.recruits.model.vo.RecruitManage;
import com.devcat.nucacola.recruits.model.vo.RecruitSkill;
import com.devcat.nucacola.recruits.model.vo.UserCareer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Controller
public class RecruitController {
	@Autowired
	private RecruitService rService;
	
	@Autowired
	private CompanyService cService;

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

	//지원 상세조회
	@RequestMapping("detail.ap")
	public String selectApplyDetail(int ano, Model model){
		
		System.out.println(ano);
		
		Apply apply = rService.selectApplyDetail(ano);
		
		System.out.println(apply);
		
		int uno = apply.getUserNo();
		
		ArrayList<RecruitSkill> skillList = rService.selectUserSkills(uno);
		ArrayList<UserCareer> careerList = rService.selectCareers(uno);
		
		System.out.println(skillList);
		System.out.println(careerList);
		
		
		model.addAttribute("a",apply);
		model.addAttribute("s",skillList);
		model.addAttribute("c",careerList);
		
		return "/apply/applyDetail";
	}

	// 단계변경
	@RequestMapping(value="changeprog.ap" ,method = RequestMethod.GET)
	public String changeProgress(int rno,int number){
		System.out.println(rno);
		RecruitSkill rp = new RecruitSkill();
		rp.setRecruitNo(rno);
		rp.setSkillNo(number);
		rService.changeProgress(rp);
		System.out.println("redirect:/detail.ap?ano="+rno);
		return "redirect:/detail.ap?ano="+rno;
	}


	// 지원한 내역조회
	@RequestMapping("list.ap")
	public String selectApplyList(int userNo, Model model) {
		
		// 조회할 채용정보가져오기
		ArrayList<ApplyList> applyList = rService.selectApplyList(userNo);
		int applyCount = rService.selectApplyCount(userNo);
		System.out.println(applyList);
		System.out.println(applyCount);

		int submitState = 0;
		int passState = 0;
		int joinState = 0;
		int failState = 0;
		
		for(ApplyList al : applyList) {
			
			if(al.getApplyProg() == 0) { //채용조건이 0이라면 서류접수에 1 		
				submitState++;				
			}else if(al.getApplyProg() == 1) { // 채용조건이 1이라면 서류합격에 1
				passState++;
			}else if(al.getApplyProg() == 2) { // 채용조건이 2라면 팀 합류에 1
				joinState++;
			}else {								// 채용조건이 3이라면 탈락에 1
				failState++;
			}

		}
		
		// applylist에 담아 model에 넣고 뿌려주기
		model.addAttribute("submitState", submitState);
		model.addAttribute("passState",passState);
		model.addAttribute("joinState", joinState);
		model.addAttribute("failState",failState);
		model.addAttribute("applyList", applyList);
		model.addAttribute("applyCount",applyCount);

		
		return "/apply/applyHistory";
			
	}
	
	
	// 지원한 내역 삭제하기(지원취소)
	@ResponseBody
	@RequestMapping(value="/delete.ap", produces="text/html; charset=utf-8")
	public void deleteApplyList(int userNo, int recruitNo) {
		
		// 새로운 ap 생성자 생성
		Apply ap = new Apply();
		// ap에 userNo와 recruitNo 담기
		ap.setUserNo(userNo);
		ap.setRecruitNo(recruitNo);
		
		System.out.println(ap);
		int result = rService.deleteApplyList(ap);
		
		if(result > 0) {
			System.out.println("삭제성공");
		}else {
			System.out.println("삭제실패");
		}
		
		//return "redirect:list.ap?userNo="+loginUser.getUserNo();
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


		int minSal =re.getRecruitMinSal();
		int maxSal =re.getRecruitMaxSal();


		System.out.println(minSal);
		System.out.println(maxSal);

		re.setRecruitMinSal(minSal);
		re.setRecruitMaxSal(maxSal);

		System.out.println(re);

		int result = rService.insertRecruit(re);

		if (result > 0) {
			System.out.println("삽입 성공!");

		}
	}


	// 채용관리 페이지
	@RequestMapping("manageDetail.re")
	public String selectRecruitManageDetail(int rno, Model model) {
		
		// 지원자 조회를 위한 ArrayList
		ArrayList<RecruitManage> manageList = rService.selectRecruitManageDetail(rno);
		int bookmarkCount = rService.selectBookmarkCount(rno);
		System.out.println(bookmarkCount);
		// 지원자 수 조회를 위한 변수
		int appliesCount = rService.selectAppliesCount(rno);
		
		//String endDate = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
		// manageList에서 date값 뽑기

		System.out.println(manageList);

		int submitState = 0;
		int passState = 0;
		int joinState = 0;
		int failState = 0;
		for(RecruitManage al : manageList) {
			
			if(al.getApplyProg() == 0) { //채용조건이 0이라면 서류접수에 1 		
				submitState++;				
			}else if(al.getApplyProg() == 1) { // 채용조건이 1이라면 서류합격에 1
				passState++;
			}else if(al.getApplyProg() == 2) { // 채용조건이 2라면 팀 합류에 1
				joinState++;
			}else {								// 채용조건이 3이라면 탈락에 1
				failState++;
			}
		
		}
		model.addAttribute("submitState",submitState);
		model.addAttribute("passState",passState);
		model.addAttribute("joinState",joinState);
		model.addAttribute("failState",failState);
		model.addAttribute("appliesCount",appliesCount);
		model.addAttribute("manageList",manageList);
		return "/recruit/recruitManageDetail";
	}
	

	//------------- 채용검색 페이지 -------------
	//맨 처음 보이는 채용검색 화면 
	@RequestMapping("list.re")
	public String recruitSearch(@RequestParam(value="currentPage",defaultValue="1") int currentPage, Model model) {
		
		//***셀렉트박스 option 세팅***
		//산업분야
		ArrayList<Industries> industryList = cService.selectIndustryList();
		model.addAttribute("industryList",industryList);
		
		//테크스택
		ArrayList<Skills> skillList = rService.selectSkillList();
		model.addAttribute("skillList",skillList);
		
		//지역검색
		ArrayList<String> locationList = rService.selectLocationList();
		model.addAttribute("locationList",locationList);

		
		//채용공고리스트 Logic
		//채용공고테이블의 기업번호들 distinct로 가져와 배열에 담는다. 이렇게하면 채용공고 있는 회사번호리스트 만들어짐.
		//회사번호 리스트 순회하면서 각 기업번호별로 회사테이블에서 회사정보랑 채용리스트 조회해서 각각 HashMap에 담는다.
		//그 HashMap을 recruitInfoList에 add한다. 
		
		//***채용공고리스트***
		//PageInfo에 쓰일 채용진행중인 회사 수 조회
		int compCount = rService.selectCompCount();
		PageInfo pi = Pagination.getPageInfo(compCount, currentPage, 1, 1);
		
		ArrayList<HashMap<String, Object>> recruitInfoList = new ArrayList<>();	//채용정보(하나의 회사정보+그 회사가 진행중인 채용정보들)담을 ArrayList 
		ArrayList<String> cnoList = rService.selectCnoList(pi); //채용공고 한 개 이상 게시한 회사번호들 가져온다. 페이징처리는 회사갯수기준으로한다.
		
		for(String cno : cnoList) {
			
			HashMap<String, Object> recruitInfo = new HashMap<>();
			ArrayList<Industries> compIndusList = cService.selectCompanyIndustryList(Integer.parseInt(cno));//회사 산업분야저장
			
			recruitInfo.put("company",cService.selectCompany(Integer.parseInt(cno)));//HashMap에 회사정보 담음
			recruitInfo.put("industries",compIndusList);//회사 산업분야정보 담음
			recruitInfo.put("recruitList",rService.selectRecruitList(Integer.parseInt(cno)));//HashMap에 해당회사채용공고리스트 담음
			recruitInfoList.add(recruitInfo);//채용정보리스트에 회사정보+그회사채용리스트 해쉬맵 담음
		}
		
		model.addAttribute("recruitInfoList",recruitInfoList);
		
		return "recruit/recruitSearch";
	}
	
	//스크롤 내렸을 때 실행되는 컨트롤러
	@ResponseBody
	@RequestMapping(value="loadMoreList.re",produces="application/json; charset=utf-8")
	public String loadSearchedList(@RequestParam(value="currentPage",defaultValue="2") int currentPage,String keywordList){
		
		//받아와야할 정보
		//활동분야, 산업분야, 테크스택, 채용조건, 연봉, 지역, 검색어
		
		
		ObjectMapper mapper = new ObjectMapper(); //String을 객체로 변환하기위한 mapper
		
		
		if(keywordList!=null) {
			
			Map<String, Object> keywords;
			
			try {
				
				keywords = mapper.readValue(keywordList, Map.class);
				String keyword = (String)keywords.get("keyword");
				ArrayList<String> position = (ArrayList<String>) keywords.get("position");
				ArrayList<String> industry = (ArrayList<String>) keywords.get("industry");
				ArrayList<String> techStack = (ArrayList<String>) keywords.get("techStack");
				ArrayList<String> condition = (ArrayList<String>) keywords.get("condition");
				ArrayList<String> salary = (ArrayList<String>) keywords.get("salary");
				ArrayList<String> address = (ArrayList<String>) keywords.get("address");
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
		}
		
		
		//검색관련 키워드 전부없을 때 로드(초기화면에서 로드하는거)
		
		
		//검색관련 키워드 있을 때 로드
		
		
		return null;
		
	}
	
	
	
	@ResponseBody
	@RequestMapping("insertingMessage.ap")
	public String insertMessage(Counsel cs) {
		
		System.out.println("보내온 메세지의 값 : " + cs);
		
		// insert 실시
		int result = rService.insertCounsel(cs);
		
		if(result>0) {
			
			// counselNo 알아오기
//			int counselNo = rService.selectCounselNo(cs);
//			
//			System.out.println("counselNo : " + counselNo);
			
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="selectMessageList.ap",produces="application/json; charset=utf-8")
	public String selectMessageList(int applyNo) {
		
		System.out.println("메세지 전체 조회용 번호 "+ applyNo);
		
		// 전체 조회 담을 공간
		ArrayList<Counsel> csAllList = new ArrayList();
		
		csAllList = rService.selectCounselList(applyNo);
		
		System.out.println("전체 조회해온 메세지 리스트 : " + csAllList);
		
		
		return new Gson().toJson(csAllList);
	}
	
	
}
