## 1. 서비스소개 
### 서비스명
▪ MVC Communication 
### 서비스설명
▪ 본 프로젝트는 스프링(Spring) 프레임워크와 MVC 3Tier 아키텍처를 기반으로 한 커뮤니케이션 프로젝트입니다. <br>
▪ 회원관리기능, 게시글기능, 좋아요기능, 댓글기능, 답글기능, 조회수기능, 검색기능, 페이징기능, 게시글 작성자 프로필기능, 좌석발권 기능등을 제공하며 비동기 통신(AJAX)을 통해 실시간으로 목록을 갱신함으로 사용자 경험을 향상시켰습니다. <br>
▪ Bootstrap 3과 직관적인 JSP 기반 UI를 통해 사용자 간 손쉽게 소통하고, 효율적으로 커뮤니티 기능을 활용할 수 있는 웹 애플리케이션 개발을 목표로 합니다.

### 기능목록과 세부기능
#### 1. 회원 관리 기능
1-1. 로그인 / 로그아웃 <br>
▪ 로그인 <br>
▪ 로그아웃 <br>
1-2. 회원가입 <br>
▪ 아이디 중복 확인 <br>
▪ 비밀번호 일치 여부 확인 <br>
1-3. 회원정보 수정 <br>
▪ 프로필 이미지 업데이트 <br>
▪ 비밀번호 일치 여부 확인 <br>

#### 2. 게시글 기능
2-1. 게시글 작성 <br>
▪ 글 작성 <br>
▪ 이미지 업로드 <br>
2-2. 게시글 보기 <br>
2-3. 게시글 수정 <br>
2-4. 게시글 삭제 <br>

#### 3. 좋아요 기능
▪ 한 게시물당 좋아요 1개로 제한 <br>

#### 4. 댓글기능
▪ 댓글 등록 <br>
▪ 댓글 삭제 <br>

#### 5. 답글기능
▪ 답글 입력 <br>
▪ 답글 수정 <br>
▪ 답글 삭제 <br>

#### 6. 조회수 기능
▪ 상세 게시글 페이지 이동시 조회수 증가 <br>

#### 7. 페이징 기능
▪ 페이지 별 페이징 <br>
▪ 그룹(10페이지) 별 페이징 <br>
▪ 페이징 후 게시글 상세보기 후 목록 복귀시 페이징 정보 유지 <br>

#### 8. 검색 기능
▪ 이름/제목/내용 별 검색 기능 <br>
▪ 검색 후 게시글 본 뒤 목록 이동 시 검색 조건 유지 <br>
▪ 검색 후 게시글 상세보기 후 목록 복귀 시 검색 조건 유지 <br>

#### 9. 게시글 작성자 프로필
▪ 작성자 클릭 시 프로필 등 작성자 정보 표시 <br>

#### 10. 좌석 발권 기능
10-1. 좌석발권 <br>
▪ 사용자 당 한개 좌석만 발권하도록 제한 <br>
10-2.좌석발권 반납 <br>
10-3. 발권 정보 관리 <br>
▪ 현재 발권된 좌석 정보 <br>
▪ 과거 발권된 사용이력 <br>
<br>

## 2. 개발환경
▪ 개발 언어: Java 1.8 <br>
▪ 프레임워크: Spring Framework 5.0.7.RELEASE <br>
▪ 데이터베이스: MySQL 5.1 + MyBatis 3.4.6 <br>
▪ 웹 레이어: JSP, JSTL, Servlet 3.1, jQuery, AJAX, HTML/CSS <br>
▪ 로깅/유틸: SLF4J, Log4j, Lombok <br>
▪ 데이터베이스 연결: HikariCP, Spring JDBC <br>
▪ 개발 도구: eGovFrame 4.0.0, Eclipse, Apache Tomcat 9 <br>
<br>

## 3. 주요기능 구성 
### 3Tier 아키텍처

<p align="center">
  <img src="https://github.com/user-attachments/assets/60435bdd-9784-43a1-a2c1-194e88dab72d" width="500" />
</p>

### 1) Controller / RestController
▪ MainController <br>
▪ MemberController / MemeberRestController <br>
▪ BoardController / BoardRestController <br>
▪ SeatController / SeatRestController <br>
▪ CommentRestController <br>
▪ LikeRestController <br>

### 2) Service / ServiceImpl
▪ MemberService / MemberServiceImpl <br>
▪ BoardService / BoardServiceImpl <br>
▪ SeatService / SeatServiceImpl <br>
▪ CommentService / CommentServiceImpl <br>
▪ LikeService / LikeServiceImpl <br>

### 3) Mapper / mapper.xml
▪ MemberMapper / MemberMapper.xml <br>
▪ BoardMapper / BoardMapper.xml <br>
▪ SeatMapper / SeatMapper.xml <br>
▪ CommentMapper /CommentMapper.xml <br>
▪ LikeMapper /LikeMapper.xml <br>


<br>

## 4. 개발 포인트
▪ Spring MVC Framework와 3-Tier Structure의 Controller - Service - Model 계층 구조로 설계 <br>
▪ AJAX 비동기 통신을 통해 페이지 새로고침 없이 기능 구현 <br>
▪ MyBatis Mapper XML을 활용해 SQL을 명확하게 관리 <br>
▪ JSP와 jQuery, Bootstrap 3을 활용하여 직관적이고 반응형이며 간결한 사용자 인터페이스 제공 <br>
<br>

## 5. 기능설명
### 1) 페이징기능
▪ 도서조회: 데이터베이스의 모든 도서 정보를 조회하여 테이블로 표시 <br>
▪ 도서삭제: 삭제 버튼 클릭 시 비동기 요청으로 해당 도서 삭제 후 목록 재출력 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/17e7ac33-9249-4046-b902-67d1e321a0e1" width="1000" />
</p>


### 2) 검색기능
▪ 제목, 작가, 출판사, 보유 수, ISBN 입력 후 등록 버튼 클릭 시 비동기 전송 → DB 저장 → 목록 자동 갱신 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/7ec18d50-e6e5-4f65-ae6b-89a2ccad4d81" width="1000" />
</p>


### 3) 프로필수정기능
▪ 목록의 수정 버튼 클릭 시 수정 폼 표시 → 보유 도서 수만 수정 가능 → 저장 시 목록 갱신 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/27e3c6e3-7af6-4265-9466-156cb283d4f6" width="1000" />
</p>

### 4) 프로필수정기능
▪ 목록의 수정 버튼 클릭 시 수정 폼 표시 → 보유 도서 수만 수정 가능 → 저장 시 목록 갱신 <br>
<p align="center">
  <img  src="https://github.com/user-attachments/assets/23657602-12a7-4a3a-9a49-cd24451dc129" width="1000" />
</p>



### 3) 게시글 이미지 업로드 기능
▪ 목록의 수정 버튼 클릭 시 수정 폼 표시 → 보유 도서 수만 수정 가능 → 저장 시 목록 갱신 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/47fa076c-effa-44d1-91db-147b3d47d843" width="1000" />
</p>


### 3) 좋아요 기능
▪ 목록의 수정 버튼 클릭 시 수정 폼 표시 → 보유 도서 수만 수정 가능 → 저장 시 목록 갱신 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/13c19e33-981d-4e9e-baa9-eff6d3d69ddb" width="1000" />
</p>



<br>



