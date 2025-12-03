## 1. 서비스소개 
### 서비스명
▪ 스프링 기반 도서관리시스템(Book Management System)
### 서비스설명
▪ 본 프로젝트는 스프링(Spring) 프레임워크와 MyBatis 기반으로 개발된 도서관리시스템 웹사이트 입니다. <br>
▪ 도서의 등록, 조회, 수정, 삭제(CRUD) 기능을 제공하며 비동기 통신(AJAX)을 통해 실시간으로 목록을 갱신함으로 사용자 경험을 향상시켰습니다. <br>
▪ 보유 도서를 효율적으로 관리하기 위한 웹 애플리케이션으로 관리자는 JSP 기반의 직관적인 UI를 통해 웹 화면에서 도서 정보를 손쉽게 관리할 수 있도록 하는 것을 목표로 합니다.

<br>

## 2. 개발환경
▪ 개발 언어: Java (JDK 11 이상) <br>
▪ 프레임워크: Spring Framework 4.x / MyBatis <br>
▪ 데이터베이스: MySQL <br>
▪ 프론트엔드: JSP, jQuery, AJAX, HTML/CSS <br>
▪ 개발도구: eGovFrame 4.0.0, Eclipse, Apache Tomcat 9 <br>

<br>

## 3. 주요기능 구성 
### 1) BookController / BookRestController
▪ BookController: 기본 페이지 이동, JSP 매핑 담당 <br>
▪ BookRestController: AJAX를 통한 비동기 데이터 처리 담당 (JSON 형태로 응답) <br>

### 2) Mapper + SQL Mapper (MyBatis)
▪ BookMapper.java: 인터페이스 정의 (CRUD 메서드 선언) <br>
▪ BookMapper.xml: 실제 SQL 쿼리 정의 <br>

### 3) main.jsp (메인 화면)
▪ 도서 목록을 테이블 형태로 표시 <br>
▪ 오른쪽에 [등록], [수정], [삭제] 버튼 제공 <br>
▪ 모든 기능은 비동기 방식(AJAX) 으로 동작 <br>

<br>

## 4. 개발 포인트
▪ Spring MVC 패턴을 적용하여 Controller - DAO - Mapper 계층 구조로 설계 <br>
▪ AJAX 비동기 통신을 통해 페이지 새로고침 없이 CRUD 기능 구현 <br>
▪ MyBatis Mapper XML을 활용해 SQL을 명확하게 관리 <br>
▪ JSP + jQuery로 직관적이고 간결한 사용자 UI 제공 <br>

<br>

## 5. 기능설명
### 1) 도서조회/삭제
▪ 도서조회: 데이터베이스의 모든 도서 정보를 조회하여 테이블로 표시 <br>
▪ 도서삭제: 삭제 버튼 클릭 시 비동기 요청으로 해당 도서 삭제 후 목록 재출력 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/8cc643a3-7593-4b01-86e5-0fe48b80f52f" width="1000" />
</p>


### 2) 도서등록
▪ 제목, 작가, 출판사, 보유 수, ISBN 입력 후 등록 버튼 클릭 시 비동기 전송 → DB 저장 → 목록 자동 갱신 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/7fd78e69-9cff-4e4f-a47a-9a5576ddc2fb" width="1000" />
</p>


### 3) 도서수정
▪ 목록의 수정 버튼 클릭 시 수정 폼 표시 → 보유 도서 수만 수정 가능 → 저장 시 목록 갱신 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/3777cc29-f608-44b4-aad4-f5081ec42ae7" width="1000" />
</p>

<br>





