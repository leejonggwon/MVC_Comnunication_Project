<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><!-- 줄바꿈, 날짜일정문자 잘라내는 기능들이 있다 --> 
<!-- fmt 태그는 주로 날짜/시간, 숫자, 메시지 포맷 처리에 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC Communication</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
.carousel-inner > .item > img,
.carousel-inner > .item > a > img {
	width: 70%;
	margin: auto;
}
</style>
 
</head>
<body>
	<div class="container">
	
		<h2><img  style="display:inline-block; height:45px; margin-right:1px;" class="img-circle" alt="" src="${cpath}/resources/images/logo2.jpg" /> MVC University Communication</h2>
		<div class="panel panel-default">
			<div class="panel-heading">Login</div>
			<div class="panel-body">
			
			<form action="${cpath}/member/loginProcess" method="post"> <!-- controller위치는 views 바로 아래에 있다 -->
				<table style="text-align: center; border: 1px solid #dddddd" class ="table table-borderd">
					<tr>
						<td style="width: 110px; vertical-align: middle;">아이디</td>
						<td><input type="text" name="memID" id="memID" class="form-control" maxlength="20" placeholder="아이디를 입력하세요"></td>						
					</tr>
					<tr>
						<td style="width: 110px; vertical-align: middle;">비밀번호</td>
						<td><input required="required" type="password" name="memPassword" id="memPassword" class="form-control" maxlength="20" placeholder="비밀번호를 입력하세요"></td>								
					</tr>
					<tr>
						<td colspan ="2">
							<span id="passMessage" style="text-align:center"></span> 
							<input type="submit" class="btn btn-success" value="로그인">
							<a type="button" class="btn btn-warning" href="${cpath}/member/joinForm">회원가입</a>														
							<!-- <button class="btn btn-warning" onclick="location.href='${cpath}/member/joinForm'">회원가입하기</button> -->
						</td>
					</tr>
				</table>
			</form> <!-- 로그인폼 -->
			
			<!-- 이미지 슬라이드 -->
			<div class="panel-body">
		    <div id="myCarousel" class="carousel slide">
		      <!-- Indicators -->
		      <ol class="carousel-indicators">
		        <li class="item1 active"></li>
		        <li class="item2"></li>
		        <li class="item3"></li>
		        <li class="item4"></li>
		      </ol>
		
	     	    <!-- Wrapper for slides -->
		      <div class="carousel-inner" role="listbox">
		
		        <div class="item active">
		          <img src="${cpath}/resources/loginImgs/communication1.jpg" alt="Chania" width="460" height="345">
		          <div class="carousel-caption">
		            <h3>커뮤니티 게시판</h3>
		            <p>게시물검색, 페이징, 이미지첨부, 답글, 댓글, 좋아요 기능</p>
		          </div>
		        </div>
		
		        <div class="item">
		          <img src="${cpath}/resources/loginImgs/communication2.png" alt="Chania" width="460" height="345">
		          <div class="carousel-caption">
		            <h3>열람실 좌석발권기능</h3>
		            <p>좌석발권, 좌석반납, 현재발권정보, 발권이력</p>
		          </div>
		        </div>
		    
		        <div class="item">
		          <img src="${cpath}/resources/loginImgs/communication3.png" alt="Flower" width="460" height="345">
		          <div class="carousel-caption">
		            <h3>자료검색</h3>
		            <p>항목별 자료검색, 자료등록 및 수정(관리자)</p>
		          </div>
		        </div>
		
		        <div class="item">
		          <img src="${cpath}/resources/loginImgs/communication4.png" alt="Flower" width="460" height="345">
		          <div class="carousel-caption">
		            <h3>메일기능</h3>
		            <p>메일발송, 수신자아이디확인, 메일삭제, 보낸메일이력, 열람상태 확인</p>
		          </div>
		        </div>
		        
		        <div class="item">
		          <img src="${cpath}/resources/loginImgs/communication5.png" alt="Flower" width="460" height="345">
		          <div class="carousel-caption">
		            <h3>회원관리기능</h3>
		            <p>아이디중복확인, 비밀번호 일치여부확인, 프로필이미지 업데이트, 회원정보수정</p>
		          </div>
		        </div>
		  
		      </div>
		
	  	    <!-- Left and right controls -->
		      <a class="left carousel-control" href="#myCarousel" role="button">
	   	        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		        <span class="sr-only">Previous</span>
		      </a>
		      <a class="right carousel-control" href="#myCarousel" role="button">
		        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		        <span class="sr-only">Next</span>
		      </a>
	  	    </div>	
			</div><!-- 이미지 슬라이드 -->
			
			</div>
			<div class="panel-footer">MVC Communication - All rights reserved</div>
		</div>
	</div>
	

   
   <!-- 회원가입 실패시 띄워줄 모달창 -->
   <div class="modal fade" id="myMessage" role="dialog">
     <div class="modal-dialog">
     
       <!-- 모달내용-->
       <div id="messageType" class="modal-content">
         <div class="modal-header panel-heading"> <!-- panel-heading을 넣어야 헤더 스타일이 적용된다 -->
           <button type="button" class="close" data-dismiss="modal">&times;</button>
           <h4 class="modal-title">${msgType}</h4> <!--MemberController에서 실패하면 joinForm에서 다시 이동할때 값을 보내준다 -->
         </div>
         <div class="modal-body">
           <p>${msg}</p> 
         </div>
         <div class="modal-footer">
           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         </div>
       </div>
   
     </div>
   </div>
   
	<script type="text/javascript">	
		//회원가입 실패시 띄워줄 모달창 실행
		//HTML 문서가 모두 로딩될 때까지 기다렸다가 그 안의 기능을 실행하겠다는 의미 
		$(document).ready(function(){
			if(${not empty msgType}){ //EL식
				if(${msgType eq "실패메세지"}){ //EL식
					$("#messageType").attr("class", "modal-content panel-warning");
				}else{
					$("#messageType").attr("class", "modal-content panel-success");
				}
			$("#myMessage").modal("show"); //모달창 실행
			};
		
			  // Activate Carousel
			  $("#myCarousel").carousel();
			    
			  // Enable Carousel Indicators
			  $(".item1").click(function(){
			    $("#myCarousel").carousel(0);
			  });
			  $(".item2").click(function(){
			    $("#myCarousel").carousel(1);
			  });
			  $(".item3").click(function(){
			    $("#myCarousel").carousel(2);
			  });
			  $(".item4").click(function(){
			    $("#myCarousel").carousel(3);
			  });
			    
			  // Enable Carousel Controls
			  $(".left").click(function(){
			    $("#myCarousel").carousel("prev");
			  });
			  $(".right").click(function(){
			    $("#myCarousel").carousel("next");
			  });
		});
		
		
		
		
	</script>
	
</body>
</html>

