<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>COMPANY PROFILE</title>
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
    <link rel="stylesheet" href="../company/profile/profile(member-modal).html)" />
    <link rel="stylesheet" href="../../css/profile/profile(member-modal).css" />
    <link rel="stylesheet" href="../../css/common.css" />
    <link rel="stylesheet" href="../../css/profile/profile(member).css" />
 
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
    <section class="visual__section">
      <div class="inner">
        <div class="visual__left">
          <div class="avatar">
            <img src="../../assets/avatar.png" alt="" />
          </div>
          <div>
            <div class="main__info">
              <strong>유원근</strong>
              <span>Apple.inc @ CEO</span>
              <span>Node.js / React.js / Vue.js / Java</span>
            </div>
            <ul class="people__info">
              <li>팔로우 <strong>102</strong></li>
              <li>팔로우 <strong>102</strong></li>
              <li>팔로우 <strong>102</strong></li>
            </ul>
          </div>
        </div>
        <button class="btn visual__right" id="add__member__open">구성원추가</button>
      </div>
    </section>
    <main class="content__section">
      <div class="inner">
        <div class="section__title">
          <ul>
            <li>ABOUT</li>
            <li>채용</li>
            <li class="nav-active">구성원</li>
          </ul>
        </div>
        <div class="main__main__section">
            <div class="main__section__left">
                <div class="content__wrapper">
                  <ul class="left__info">
                    <li><a href="#"><strong>TOP</strong></a></li>
                    <li><a href="#">주요구성원</a></li>
                    <li><a href="#">구성원</a></li>
                  </ul>
                </div>
              </div>
          <div class="main__section__right">
            <div class="content__wrapper">

              <!-- 주요인물 -->
              <div class="main_character">
                <div class="main_character__left">
                    <h2>대표</h2>
                    <div class="charater__info">
                      <div class="member__avatar">
                        <img src="../../assets/avatar.png" alt="" />
                      </div>
                      <div class="member__info__list">
                        <ul class="member__info">
                            <li><strong>Elon Reeve Musk</strong></li>
                            <li>TESLA,SPACE x @CEO</li>
                        </ul>
                      </div>
                    </div>
                </div>
                <div class="main_character__right">
                  <h2>채용담당자</h2>
                  <div class="charater__info">
                    <div class="member__avatar">
                      <img src="../../assets/avatar.png" alt="" />
                    </div>
                    <div class="member__info__list">
                      <ul class="member__info">
                        <li><strong>Elon Reeve Musk</strong></li>
                        <li>TESLA,SPACE x @CEO</li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>


              <!-- 구성원 -->
              <div class="member">
                <h2>구성원</h2>
                  <div class="box">
                    <!-- 구성원 결과 for문 -->
                    <div class="charater__info">
                      <div class="member__avatar">
                        <img src="../../assets/avatar.png" alt="" />
                      </div>
                      <div class="member__info__list">
                        <ul class="member__info">
                            <li><strong>Elon Reeve Musk</strong></li>
                            <li>TESLA,SPACE x @CEO</li>
                        </ul>
                      </div>
                    </div>

                    <div class="charater__info">
                      <div class="member__avatar">
                        <img src="../../assets/avatar.png" alt="" />
                      </div>
                      <div class="member__info__list">
                        <ul class="member__info">
                            <li><strong>Elon Reeve Musk</strong></li>
                            <li>TESLA,SPACE x @CEO</li>
                        </ul>
                      </div>
                    </div>

                    <div class="charater__info">
                      <div class="member__avatar">
                        <img src="../../assets/avatar.png" alt="" />
                      </div>
                      <div class="member__info__list">
                        <ul class="member__info">
                            <li><strong>Elon Reeve Musk</strong></li>
                            <li>TESLA,SPACE x @CEO</li>
                        </ul>
                      </div>
                    </div>

                    <div class="charater__info">
                      <div class="member__avatar">
                        <img src="../../assets/avatar.png" alt="" />
                      </div>
                      <div class="member__info__list">
                        <ul class="member__info">
                            <li><strong>Elon Reeve Musk</strong></li>
                            <li>TESLA,SPACE x @CEO</li>
                        </ul>
                      </div>
                    </div>

                    <!-- 구성원 결과 for문 -->
                  
              </div>

              <div class="member_btn">
                <button class="btn">more</button>
              </div>
            </div>
          </div>

        </div>
      </div>
    </main>
    <!-- 구성원 추가 모달 -->
    <div class="modal hidden">
      <div class="modal__overlay"></div>
      <div class="modal__content">
          <form class="content__inner">
              <div class="modal__title">
                  <h2>구성원 추가</h2>
              </div>
              <div class="email">
                  <p>이메일</p>
                  <input type="search">
              </div>
              <div class="modal__member__content">
                 <!-- 기업의 구성원 for문 -->
                  <div class="charater__info">
                      <div class="charater__info__left">
                          <div class="member__avatar">
                          <img src="../../assets/avatar.png" alt="" />
                          </div>
                          <label for="add_option" class="add__member__check">
                          <ul class="add__member__info">
                              <li><strong>Elon Reeve Musk</strong></li>
                              <li>TESLA,SPACE x @CEO</li>
                          </ul>
                          </label>
                      </div>
                      <div class="charater__info__right">
                        <input type="checkbox" id="add_option">
                      </div>
                  </div>
                  <div class="charater__info">
                      <div class="charater__info__left">
                          <div class="member__avatar">
                          <img src="../../assets/avatar.png" alt="" />
                          </div>
                          <label for="add_option" class="add__member__check">
                          <ul class="add__member__info">
                              <li><strong>Elon Reeve Musk</strong></li>
                              <li>TESLA,SPACE x @CEO</li>
                          </ul>
                          </label>
                      </div>
                      <div class="charater__info__right">
                        <input type="checkbox" id="add_option">
                      </div>
                  </div>

                  <div class="charater__info">
                      <div class="charater__info__left">
                          <div class="member__avatar">
                          <img src="../../assets/avatar.png" alt="" />
                          </div>
                          <label for="add_option" class="add__member__check">
                          <ul class="add__member__info">
                              <li><strong>Elon Reeve Musk</strong></li>
                              <li>TESLA,SPACE x @CEO</li>
                          </ul>
                          </label>
                      </div>
                      <div class="charater__info__right">
                        <input type="checkbox" id="add_option">
                      </div>
                  </div>

                  <div class="charater__info">
                      <div class="charater__info__left">
                          <div class="member__avatar">
                          <img src="../../assets/avatar.png" alt="" />
                          </div>
                          <label for="add_option" class="add__member__check">
                          <ul class="add__member__info">
                              <li><strong>Elon Reeve Musk</strong></li>
                              <li>TESLA,SPACE x @CEO</li>
                          </ul>
                          </label>
                      </div>
                      <div class="charater__info__right">
                        <input type="checkbox" id="add_option">
                      </div>
                  </div>

                  <div class="charater__info">
                      <div class="charater__info__left">
                          <div class="member__avatar">
                          <img src="../../assets/avatar.png" alt="" />
                          </div>
                          <label for="add_option" class="add__member__check">
                          <ul class="add__member__info">
                              <li><strong>Elon Reeve Musk</strong></li>
                              <li>TESLA,SPACE x @CEO</li>
                          </ul>
                          </label>
                      </div>
                      <div class="charater__info__right">
                        <input type="checkbox" id="add_option">
                      </div>
                  </div>
                  <!-- 기업의 구성원 for문 -->
              </div>
              <div class="position">
                  <p>직책</p>
                  <input type="search">
              </div>
              <div class="button__box">
                  <button type="button" class="btn modal__close">close</button>
                  <button type="submit" class="btn btn-blue">추가</button>
              </div>
          </form>
      </div>
  </div>

  <script>
      window.onload = function() {
      
      function onClick() {
          const modal = document.querySelector(".modal");
          modal.classList.remove("hidden");
      }   
      function offClick() {
          const modal = document.querySelector(".modal");
          modal.classList.add("hidden");
      }

      document.getElementById('add__member__open').addEventListener('click', onClick);
      document.querySelector('.modal__close').addEventListener('click', offClick);

      };


    </script>

  <!-- 구성원 추가 모달 -->
  </body>
</html>
