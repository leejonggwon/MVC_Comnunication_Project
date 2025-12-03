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
</head>
<body>
	
	<div class="container">
		<h2>MVC Communication</h2>
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
							<input type="submit" class="btn btn-primary" value="로그인">
							<a type="button" class="btn btn-warning" href="${cpath}/member/joinForm">회원가입</a>														
							<!-- <button class="btn btn-warning" onclick="location.href='${cpath}/member/joinForm'">회원가입하기</button> -->
						</td>
					</tr>
					
				</table>
			</form>
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
			}
		});
		
		
	</script>
	
</body>
</html>

