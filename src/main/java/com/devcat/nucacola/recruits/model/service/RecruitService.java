package com.devcat.nucacola.recruits.model.service;

import java.util.ArrayList;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.recruits.model.vo.Apply;
import com.devcat.nucacola.recruits.model.vo.Declare;
import com.devcat.nucacola.recruits.model.vo.Recruit;
import com.devcat.nucacola.recruits.model.vo.RecruitDetail;
import com.devcat.nucacola.recruits.model.vo.RecruitSkill;
import org.mybatis.spring.SqlSessionTemplate;
import sun.security.util.Debug;


public interface RecruitService {
	
	// 채용공고 조회
		int selectListCount();
		ArrayList<Recruit> selectRecruitList(PageInfo pi);
		
	// 채용 공고 상세 조회
		int increaseCount(int rno);
		RecruitDetail selectRecruitDetail( int rno);
		ArrayList<RecruitSkill> selectRecruitSkill(int rno);
		int selectAppliesCount(int rno);
		int insertDeclare(Declare d);
	// 채용 공고 수정
		int updateRecruit(Recruit r);
		
		
	// 채용 공고 삭제
		int deleteRecruit(int rno);
	
	// 지원 조회
		ArrayList<Apply> selectApplyList(int userNo);
		int selectApplyCount(int userNo);
	// 지원한 내역 삭제
		int deleteApplyList(Apply ap);
		
	// 채용 등록	
	int insertRecruit(Recruit re);
	
	// 사용자의 회사 번호 알아오기
	int selectCompNo(int userNo);
	
	
		
}
