## 1. 서비스소개 
### 서비스명
▪ MVC Communication 
### 서비스설명
▪ 본 프로젝트는 스프링(Spring) 프레임워크와 MVC 3Tier 아키텍처를 기반으로 한 커뮤니케이션 프로젝트입니다. <br>
▪ 회원관리기능, 게시글기능, 좋아요기능, 댓글기능, 답글기능, 조회수기능, 검색기능, 페이징기능, 게시글 작성자 프로필기능, 좌석발권 기능등을 제공하며 비동기 통신(AJAX)을 통해 실시간으로 목록을 갱신함으로 사용자 경험을 향상시켰습니다. <br>
▪ Bootstrap 3과 직관적인 JSP 기반 UI를 통해 사용자 간 손쉽게 소통하고, 효율적으로 커뮤니티 기능을 활용할 수 있는 웹 애플리케이션 개발을 목표로 합니다.
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
▪ 로그인 인증 후 접근 가능<br>
▪ 비회원 접근 제한
<p align="center">
  <img src="https://github.com/user-attachments/assets/0cb0e457-c6f2-47b1-99a3-d4e7997db389" width="700" />
</p>


### 회원가입 
▪ 아이디 중복 확인 <br>
▪ 비밀번호 일치 여부 확인 <br>
▪ 필수 회원정보 미입력 시 메시지 출력 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/c0f902f9-7ea9-4dfc-88ec-9979f3d688ab" width="700" />
</p>
<br>

<p align="center">
  <img src="https://github.com/user-attachments/assets/9c085db7-79aa-481f-ab79-535fa2b8303c" width="700" />
</p>


### 게시글 기능
▪ 게시글목록 <br>
▪ 게시글 상세보기 할 때마다 조회수 1씩 증가 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/0a122f65-9bce-4f81-b762-8f6790dfc456" width="700" />
</p>
<br>

▪ 게시글작성(제목 미입력 시 경고 메세지 츨력) <br>
▪ 파일업로드 <br>
▪ 게시글 목록으로 이동 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/dc0f357c-811e-431b-a6c7-a932bbccc20b" width="700" />
</p>
<br>

▪ 게시글수정 <br>
▪ 게시글 삭제 <br>
▪ 답글 삭제시 "작성자에 의해 삭제된 게시글입니다" 표시 <br>
▪ 게시글 목록으로 이동 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/ec86688e-1c55-4a6f-8235-bbbcaf023806" width="700" />
</p>
<br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/b08a566b-a55a-4d16-a10c-9153ca70eb75" width="700" />
</p>
<br>


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
▪ 좋아요 버튼 누르면 실시간 반영 <br>
▪ 한 게시물당 좋아요 1회 제한 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/ebba14ae-58e9-4bea-a988-c3109df47188" width="700" />
</p>
<br>

<p align="center">
  <img src="https://github.com/user-attachments/assets/ea25b674-ba77-4274-8d89-80a540cbac17" width="700" />
</p>


### 답글 기능
▪ 답글 입력 <br>
▪ 게시물의 그룹, 순서, 원본글 여부(원본글 0, 댓글 1, 대댓글 2)를 설정하여 답글 작성 가능 <br>
▪ 답글 수정 <br>
▪ 답글 삭제 <br>

 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/914e5327-c125-4770-a3db-aa747a5d7c5b" width="700" />
</p>

<br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/0317260d-3a48-443a-9f49-545327951b52" width="700" />
</p>


### 댓글 기능
▪ 댓글 등록 <br>
▪ 댓글 등록 <br>
▪ 댓글 삭제 시 “ 작성자에 의해 삭제된 댓글입니다” 표시<br>
 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/20f0a64f-0f82-480e-a688-ba863262144a" width="700" />
</p>

### 프로필 이미지 업데이트
▪ 회원가입을 완료한 후 최초 로그인 시 기본 프로필 이미지가 설정된다
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

▪ 지정 좌석 발권 <br>
▪ 발권 후 다른 좌석을 다시 발권하려 할 경우 “현재 사용 중인 좌석이 있습니다”라는 경고창을 출력 <br>
▪ 다른 이용자가 사용 중인 좌석은 발권할 수 없도록 제한 <br>
▪ 발권 좌석 반납기능 <br>
▪ 현재 발권 정보 및 과거 발권 기록 조회 기능 <br>
<br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/4d48fa39-f5a7-4725-bedd-a9e998489841" width="700" />
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
  <img src="https://github.com/user-attachments/assets/76bbfae3-1233-4430-9691-e353ce6112fb" width="700" />
</p>
<br>

<p align="center">
  <img src="https://github.com/user-attachments/assets/ba052632-d567-4a80-a469-c97f51d0e3e7" width="700" />
</p>
<br>



### 자료검색

▪ 도서명, 작가, 출판사 등 다양한 검색 옵션을 활용하여 등록된 자료를 조회<br>
▪ 관리자는 자료 등록 및 수정, 삭제 등 접근 가능 <br>
<br>

<p align="center">
  <img src="https://github.com/user-attachments/assets/b2c9cd1d-be97-4c08-8974-ffce61128b9a" width="700" />
</p>
<br>

<p align="center">
  <img src="https://github.com/user-attachments/assets/0a68bfdf-6214-4b0e-80b7-ef4ffcd65ca3" width="700" />
</p>
<br>

<p align="center">
  <img src="https://github.com/user-attachments/assets/0fb6fac7-7102-4aad-aa10-99afe4e6b354" width="700" />
</p>
<br>

<p align="center">
  <img src="https://github.com/user-attachments/assets/cf39b06c-bc58-4c0f-99bb-1ed5b8c49c3f" width="700" />
</p>
<br>


### 메세지

▪ 수신한 메시지 내역을 확인 <br>
▪ 받은 메세지 수 및 미열람 메세지 수 표시<br>
▪ 메시지 열람 여부(열람/미열람) 상태 표시 <br>
▪ 체크박스로 선택한 메시지를 삭제 <br>
▪ 발신자 아이디 및 제목 등 조건별로 메시지를 검색 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/dae99c42-4b00-4bed-a322-877f94e66e2b" width="700" />
</p>
<br>

▪ 사용자가 메시지를 작성할 수 있는 기능 <br>
▪ 중복 확인 버튼을 이용해 수신자 아이디를 확인하는 기능<br>

<p align="center">
  <img src="https://github.com/user-attachments/assets/6ae20045-dc41-4416-b951-24993b053397" width="700" />
</p>
<br>

<p align="center">
  <img src="https://github.com/user-attachments/assets/7daf435d-1931-459b-9b65-ba556c39709f" width="700" />
</p>
<br>

▪ 발신자 아이디 클릭 시 작성자 프로필 확인 및 메시지 전송 버튼 제공 <br>
▪ 보내기 버튼 클릭 시 해당 발신자를 기준으로 메시지 작성 화면으로 이동 <br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/b56f2461-9a6d-44df-9781-0dc4c73a67d2" width="700" />
</p>
<br>
<p align="center">
  <img src="https://github.com/user-attachments/assets/f5408e1c-d19c-4d66-ab25-1b5e2cbb21d5" width="700" />
</p>
<br>


<br>

