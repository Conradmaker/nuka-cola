<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <link rel="stylesheet" href="../../css/common.css" />
    <link rel="stylesheet" href="../../css/apply-history.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="../../css/footer.css">
</head>
<body>
	  <header>
    <div class="inner">
      <div class="left__header">
        <div class="logo">
          <img src="../../assets/logo.png" alt="logo" />
        </div>
        <ul class="header__nav">
          <li class="header__nav-item">PARTNER</li>
          <li class="header__nav-item">COMPANY</li>
          <li class="header__nav-item">EMPLOYMENT</li>
        </ul>
      </div>
      <div class="right__header">
        <i class="material-icons">menu</i>
        <span>MENU</span>
      </div>
    </div>
  </header>
  <!-- 메뉴바 끝 -->

  <main class="apply-history__main-wrapper">
    <div class="inner">
      <div class="apply-history__title">
        <strong>지원 내역 조회</strong>
      </div>
      <div class="apply-history__contents">
        <div class="apply-history__left-sidebar">
          <div class="left-sidebar__item">
            <a href="#" class="left-sideber__viewing">진행 중인 채용 정보 (1)</a>
          </div>
          <div class="left-sidebar__item">
            <ul>
              <li><a href="#">서류 접수 (1)</a></li>
              <li><a href="#">서류 합격 (1)</a></li>
              <li><a href="#">팀 합류 (1)</a></li>
              <li><a href="#">탈락 (1)</a></li>
            </ul>
          </div>
          <div class="left-sidebar__item">
            <a href="#">마감된 채용 정보 (0)</a>
          </div>
              <div class="left-sidebar__item">
                <ul>
                  <li><a href="#">팀 합류 (0)</a></li>
                  <li><a href="#">탈락 (0)</a></li>
                </ul>
              </div>
        </div>
        <div class="apply-history__right-content">
          <div class="apply-history__sub-title">
            진행 중인 채용 정보 (1)
          </div>
          <div class="apply-history__list">
            <div class="apply-info">
              <div class="apply-info__content">
                <div class="apply-info__recruit-info">
                  <span>데브캣개발자모집</span>
                  <span>신입, 경력</span>
                  <span>게시 2020.11.25</span>
                </div>
                <div class="apply-info__apply-state">
                  <div class="recruit-stage">
                    <span class="state-sign submit-state"><!--채용진행상태사인--></span>
                    <span>서류접수</span>
                  </div>
                  <span>6일 후 만료</span>
                  <span class="apply-state__apply-date">2020.11.25 19:19 지원</span>
                </div>
              </div>
              <div class="apply-info__btn">
                <form action="">
                  <input type="hidden" name="applyNo" value="">
                  <button type="submit" class="apply-cancel__btn">지원 취소</button>
                </form>
                <button type="button" class="apply-detail__btn"onclick="location.href='./recruit-detail.html'">
                  채용 정보 확인
                </button>
              </div>
            </div><!--apply-info-->
            
           <c:forEach var="a" items="${ Applylist }">
            <div class="apply-info">
              <div class="apply-info__content">
                <div class="apply-info__recruit-info">
                  <span>${ a.recruitTitle }</span>
                  <span>${ a.applyProg  }</span>
                  <span>게시 2020.11.25</span>
                </div>
                <div class="apply-info__apply-state">
                  <div class="recruit-stage">
                    <span class="state-sign join-state"><!--채용진행상태사인--></span>
                    <span>팀 합류</span>
                  </div>
                  <span>6일 후 만료</span>
                  <span class="apply-state__apply-date">2020.11.25 19:19 지원</span>
                </div>
              </div>
              <div class="apply-info__btn">
                <form action="">
                  <input type="hidden" name="applyNo" value="">
                  <button type="submit" class="apply-cancel__btn">지원 취소</button>
                </form>
                <button type="button" class="apply-detail__btn"onclick="location.href='./recruit-detail.html'">
                  채용 정보 확인
                </button>
              </div>
            </div><!--apply-info-->
            </c:forEach>
            
            <div class="apply-info">
              <div class="apply-info__content">
                <div class="apply-info__recruit-info">
                  <span>데브캣개발자모집</span>
                  <span>신입, 경력</span>
                  <span>게시 2020.11.25</span>
                </div>
                <div class="apply-info__apply-state">
                  <div class="recruit-stage">
                    <span class="state-sign pass-state"><!--채용진행상태사인--></span>
                    <span>서류합격</span>
                  </div>
                  <span>6일 후 만료</span>
                  <span class="apply-state__apply-date">2020.11.25 19:19 지원</span>
                </div>
              </div>
              <div class="apply-info__btn">
                <form action="">
                  <input type="hidden" name="applyNo" value="">
                  <button type="submit" class="apply-cancel__btn">지원 취소</button>
                </form>
                <button type="button" class="apply-detail__btn"onclick="location.href='./recruit-detail.html'">
                  채용 정보 확인
                </button>
              </div>
            </div><!--apply-info-->



            <div class="apply-info">
              <div class="apply-info__content">
                <div class="apply-info__recruit-info">
                  <span>데브캣개발자모집</span>
                  <span>신입, 경력</span>
                  <span>게시 2020.11.25</span>
                </div>
                <div class="apply-info__apply-state">
                  <div class="recruit-stage">
                    <span class="state-sign fail-state"><!--채용진행상태사인--></span>
                    <span>탈락</span>
                  </div>
                  <span>6일 후 만료</span>
                  <span class="apply-state__apply-date">2020.11.25 19:19 지원</span>
                </div>
              </div>
              <div class="apply-info__btn">
                <form action="">
                  <input type="hidden" name="applyNo" value="">
                  <button type="submit" class="apply-cancel__btn">지원 취소</button>
                </form>
                <button type="button" class="apply-detail__btn"onclick="location.href='./recruit-detail.html'">
                  채용 정보 확인
                </button>
              </div>
            </div><!--apply-info-->

            
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
	
	
	
	
</body>
</html>