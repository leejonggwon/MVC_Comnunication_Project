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
▪ 회원정보 등록 <br>
▪ 필수 회원정보 미입력 시 경고 메시지 출력 <br>
▪ 아이디 중복 확인 <br>
▪ 비밀번호 일치 여부 확인 <br>
1-3. 회원정보 수정 <br>
▪ 프로필 이미지 업데이트 <br>
▪ 비밀번호 일치 여부 확인 <br>
<br>

#### 2. 게시글 기능
2-1. 게시글 보기 <br>
2-2. 게시글 작성 <br>
▪ 제목 미입력 시 경고 메시지 출력 <br>
2-3. 파일 업로드 <br>
2-4. 게시글 수정 <br>
2-5. 게시글 삭제 <br>
2-6. 게시글 목록으로 이동 <br>
<br>

#### 3. 작성자 프로필 및 메시지 기능
▪ 게시글 작성자를 클릭하면 작성자의 프로필 확인 및 메시지 전송 기능 제공 <br>
<br>

#### 4. 좋아요 기능
▪ 한 게시물당 좋아요 1회 제한 <br>
<br>

#### 5. 댓글 기능
5-1. 댓글 등록 <br>
5-2. 댓글 삭제 <br>
5-3. 댓글 삭제 시 “삭제된 댓글입니다” 표시 <br>
<br>

#### 6. 답글 기능
6-1. 답글 입력 <br>
▪ 게시물의 그룹, 순서, 원본글 여부(원본글 0, 댓글 1, 대댓글 2)를 설정하여 답글 작성 가능 <br>
6-2. 답글 수정 <br>
6-3. 답글 삭제 <br>
▪ 답글 삭제 시 “삭제된 답글입니다” 표시 <br>
<br>

#### 7. 조회수 기능
7-1. 게시글 상세보기시 조회수 1 회 증가 <br>
<br>

#### 8. 페이징 기능
8-1. 페이지 별 페이징 <br>
8-2. 그룹 별 페이징 <br>
8-3. 게시글 상세보기 후 목록으로 돌아갈 때 이전 페이징 정보를 그대로 유지하는 기능 <br>
<br>

#### 9. 검색 기능
9-1. 옵션 별 검색 <br>
9-2. 검색 후 게시글 열람 뒤 목록으로 돌아갈 때 기존 검색 조건 유지 기능 <br>
<br>

#### 10. 좌석 발권 기능
10-1. 지정 좌석 발권 <br>
10-2. 발권 후 다른 좌석을 다시 발권하려 할 경우 “현재 사용 중인 좌석이 있습니다”라는 경고창을 출력 <br>
10-3. 다른 이용자가 사용 중인 좌석은 발권할 수 없도록 제한한다 <br>
10-4. 발권 좌석 반납기능 <br>
10-5. 현재 발권 정보 및 과거 발권 기록 조회 기능  <br>
<br>

#### 11. 자료검색
11-1. 도서명, 작가, 출판사 등 검색 옵션을 활용하여 등록된 자료를 조회하는 기능 <br>
11-2.관리자는 자료 수정 및 삭제 등 관리 기능 접근 가능 <br>
<br>

#### 12. 메세지
12-1. 받은 메세지 조회 <br>
12-2. 수신 메시지 조회 및 답장 기능 제공 <br>
12-3. 메세지작성 <br>
▪ 제목 발신자 미입력 시 경고 메시지 출력
12-4. 수신자 아이디 조회 <br>
12-5. 메세지삭제 <br>
12-6. 보낸 메세지 조회 <br>
12-7. 열람 유무와 전체 열람 건수를 확인하는 기능 <br>
12-8. 발신자 또는 수신자를 클릭하면 해당 프로필 확인 및 메시지 전송 기능 제공 <br>
12-9. 새 메시지 도착 시 알림 기능 지원 <br>
<br>


## 2. 개발환경
▪ 개발 언어: Java 1.8 <br><br>
▪ 프레임워크: Spring Framework 5.0.7.RELEASE <br><br>
▪ 데이터베이스: MySQL 5.1 + MyBatis 3.4.6 <br><br>
▪ 웹 레이어: JSP, JSTL, Servlet 3.1, jQuery, AJAX, HTML/CSS <br><br>
▪ 로깅/유틸: SLF4J, Log4j, Lombok <br><br>
▪ 데이터베이스 연결: HikariCP, Spring JDBC <br><br>
▪ 개발 도구: eGovFrame 4.0.0, Eclipse, Apache Tomcat 9 <br><br>
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

### 로그인 페이지
▪ 로그인 인증 후 접근 가능
▪ 비회원 접근 제한
<p align="center">
  <img src="https://github.com/user-attachments/assets/0cb0e457-c6f2-47b1-99a3-d4e7997db389" width="700" />
</p>


### 회원가입 
▪ 아이디 중복 확인 <br>
▪ 비밀번호 일치 여부 확인 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/c0f902f9-7ea9-4dfc-88ec-9979f3d688ab" width="700" />
</p>
<br>
▪ 필수 회원정보 미입력 시 메시지 출력 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/9c085db7-79aa-481f-ab79-535fa2b8303c" width="700" />
</p>


### 게시글 기능
▪ 게시글목록 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/5b7e897f-3798-48e7-9a0c-b68c88f5d718" width="700" />
</p>
<br>
▪ 게시글작성(제목 미입력 시 경고 메세지 츨력), 파일업로드, 게시글 목록으로 이동 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/dc0f357c-811e-431b-a6c7-a932bbccc20b" width="700" />
</p>


### 작성자 프로필 및 메시지 기능
▪ 게시글 작성자를 클릭하면 작성자의 프로필 확인 및 메시지 전송 기능 제공 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/11dc8b88-47f1-4ff6-901e-4ad6e8a04fd8" width="700" />
</p>

### 페이징 기능
▪ 페이지별 페이징  <br>
▪ 그룹별 페이징  <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/d2fe94cd-49ad-4f58-9061-c77fde558f7f" width="700" />
</p>


### 검색 기능
▪ 옵션 별 검색  <br>
▪ 검색 후 게시글 열람 뒤 목록으로 돌아갈 때 기존 검색 조건 유지 기능<br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/3c6536bf-2269-4559-bd3c-565a92aced1d" width="700" />
</p>


### 좋아요 기능
▪ 한 게시물당 좋아요 1회 제한  <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/857baa6a-3d77-4c92-9316-4623ecedd5bd" width="700" />
</p>

### 답글 기능
▪ 답글 입력, 답글 수정, 답글삭제 
 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/914e5327-c125-4770-a3db-aa747a5d7c5b" width="700" />
</p>

<br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/0317260d-3a48-443a-9f49-545327951b52" width="700" />
</p>


### 댓글 기능
▪ 댓글 등록, 댓글삭제 
 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/20f0a64f-0f82-480e-a688-ba863262144a" width="700" />
</p>

### 프로필 이미지 업데이트
<br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/dd5f5947-9e2c-4f26-9967-2ca24eb0f15e" width="700" />
</p>
<br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/5a3f6ae3-09c3-4523-8ada-63b9f04c5348" width="700" />
</p>
<br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/7dcc091d-196a-4ddc-8c9f-5e29a5ab4969" width="700" />
</p>

### 좌석 발권 기능

▪ 지정 좌석 발권
▪ 발권 후 다른 좌석을 다시 발권하려 할 경우 “현재 사용 중인 좌석이 있습니다”라는 경고창을 출력
▪ 다른 이용자가 사용 중인 좌석은 발권할 수 없도록 제한한다
▪ 발권 좌석 반납기능 
▪ 현재 발권 정보 및 과거 발권 기록 조회 기능 
<br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/66b84b81-0009-4ce8-bab9-b0bce9c781b1" width="700" />
</p>

<br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/5a3f6ae3-09c3-4523-8ada-63b9f04c5348" width="700" />
</p>
<br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/da917843-c222-4312-b2d3-1ddcfa740a87" width="700" />
</p>
<br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/a60243e9-81d3-493e-b4ea-e78f0a2a1cb3" width="700" />
</p>
<br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/605a7345-e421-445f-ba4f-382d5a4f9abe" width="700" />
</p>
<br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/ba052632-d567-4a80-a469-c97f51d0e3e7" width="700" />
</p>
<br>




