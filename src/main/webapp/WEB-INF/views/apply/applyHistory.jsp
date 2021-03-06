<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Apply</title>
  
  <link
	      rel="stylesheet"
	      href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"
	      integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw=="
	      crossorigin="anonymous"
    />
    
  <link
	      href="https://fonts.googleapis.com/icon?family=Material+Icons"
	      rel="stylesheet"
    />
    
  <link rel="stylesheet" href="resources/css/common.css" />
  <link rel="stylesheet" href="resources/css/recruit/apply-history.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="resources/css/footer.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  
</head>
<body>

	<jsp:include page="../common/mainMenu.jsp"/>

  <!-- 메뉴바 끝 -->

  <main class="apply-history__main-wrapper">
    <div class="inner">
      <div class="apply-history__title">
        <strong>지원 내역 조회</strong>
      </div>
      <div class="apply-history__contents">
        <div class="apply-history__left-sidebar">
          <div class="left-sidebar__item">
            <a href="#" class="left-sideber__viewing">내 지원정보 (${ applyCount })</a>
          </div>
          <div class="left-sidebar__item">
            <ul>
              <li><a href="#">서류 접수 (${submitState})</a></li>
              <li><a href="#">서류 합격 (${passState})</a></li>
            </ul>
          </div>
          <div class="left-sidebar__item">
            <a href="#">마감된 채용 정보 (0)</a>
          </div>
              <div class="left-sidebar__item">
                <ul>
                  <li><a href="#">팀 합류 (${joinState })</a></li>
                  <li><a href="#">탈락 (${failState })</a></li>
                </ul>
              </div>
        </div>
        <div class="apply-history__right-content">
          <div class="apply-history__sub-title">
            	<span>진행 중인 지원정보 (${ applyCount })</span>
          </div>
          <div class="apply-history__list">
         
           <c:forEach var="a" items="${applyList}">
            <div class="apply-info">
              <div class="apply-info__content" onclick="location.href='detail.ap?ano=${a.applyNo}'">
                <div class="apply-info__recruit-info">
                  <span>${ a.recruitTitle }</span>
                
                <!-- 채용조건에 따른 조건문 -->  
                  <c:choose>
                  	<c:when test="${a.recruitRequ eq 0 }">
                  		<span>신입</span>
                  	</c:when>
                  	<c:when test="${a.recruitRequ eq 1 }">
                  		<span>경력</span>
                  	</c:when>
                  	<c:when test="${a.recruitRequ eq 2 }">
                  		<span>신입, 경력</span>
                  	</c:when>
                  </c:choose>
                  
                  <span>공고게시일 : ${ a.createdAt} </span>
                </div>
                
                <!-- 채용단계에 따른 조건문 -->
                <div class="apply-info__apply-state">
                  <c:choose>
                  	<c:when test="${a.applyProg eq 0}">
                  <div class="recruit-stage">
                    <span class="state-sign submit-state"></span>
                    <span>서류접수</span>
                  </div>
                  	</c:when>
                  	<c:when test="${a.applyProg eq 1}">
                  <div class="recruit-stage">
                    <span class="state-sign pass-state"></span>
                    <span>서류합격</span>
                  </div>
                  	</c:when>
                  	<c:when test="${a.applyProg eq 2}">
                  <div class="recruit-stage">
                    <span class="state-sign join-state"></span>
                    <span>팀 합류</span>
                  </div>
                  	</c:when>
                  	<c:when test="${a.applyProg eq 3}">
                  <div class="recruit-stage">
                    <span class="state-sign fail-state"></span>
                    <span>탈락</span>
                  </div>
                  	</c:when>
                  </c:choose>
                  
                  <span>공고는 ${a.recruitDl}일 남았습니다</span>
                  <span class="apply-state__apply-date">내 지원일 ${a.appliedAt}</span>
                </div>
              </div>
              <div class="apply-info__btn">
                <form action="">
                  <input class="recruit-no" type="hidden" name="recruitNo" value="${a.recruitNo}">
                  <input class="user-no" type="hidden" name="loginUser" value="${loginUser.userNo}">
                  <button type="button" class="apply-cancel__btn">지원 취소</button>
                </form>
                <button type="button" class="apply-detail__btn" onclick="location.href='detail.re?rno=${a.recruitNo}'">
                  		채용 정보 확인
                </button>
              </div>
            </div><!--apply-info-->
          </c:forEach>
            

          </div><!--apply-history__list-->
        </div>
      </div>
    </div><!--보라끝-->
  </main><!--빨강끝-->
  <footer class="common__footer">
    <div class="footer__left-area">
      <div class="footer__logo">
          <img src="../../assets/footer-logo.PNG" alt="logo">
      </div>
      <div class="footer__inc-info">
        <span>상호명 : 누카콜라</span>
        <span>공동대표 : 정찬복 유원근 손지원 성수지 배진원 이준호</span>
        <span>사업자등록번호 : 999-99-88282</span>
        <span>주소 : MountainView, CA, USA. Santa Clara Country</span>
        <span>이메일 : devcat123@gmail.com</span>
      </div>
    </div>
    <div class="footer__right-area">
      <div class="footer__icons">
        <i class="fa fa-facebook-square fa-2x" aria-hidden="true"></i>
        <i class="fa fa-instagram fa-2x" aria-hidden="true"></i>
        <i class="fa fa-twitter-square fa-2x" aria-hidden="true"></i>
      </div>
    </div>
  </footer>
	
  <script defer>
  
  // 지원취소 버튼 요청시 실행할 Axios
               
  document.querySelectorAll('.apply-cancel__btn').forEach((v,i)=>{
      console.log(v);
          v.addEventListener('click',()=>{
        	  
               let item = v.parentNode.parentNode.parentNode;
			   let userNo = item.querySelector('.user-no').value;
			   let recruitNo = document.querySelectorAll('.recruit-no')[i].value;
				

               console.log(recruitNo);
               console.log(userNo);
               axios.get('delete.ap',{
                 params:{
                   userNo:userNo,
                   recruitNo:recruitNo
                 }
              })
              .then(function(){
              });
               
               
               
               let applyCount= document.querySelector('.apply-history__sub-title');
                let applyCountNum = applyCount.querySelector('span').innerText;
                applyCountNum=parseInt(applyCountNum);
                console.log(applyCountNum);
                applyCountNum = --applyCountNum;
                applyCountNum.innerText = applyCountNum;
                applyCount.querySelector('span').innerText = applyCountNum;
               item.remove(); 

            });
         });
  
  
  
  
  
  
  
  </script>
	
	
</body>
</html>