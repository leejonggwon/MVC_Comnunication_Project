<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--JSTL Core 라이브러리: JSP에서 조건문, 반복문, 변수 설정 등을 할 때 사용, 자바 코드 대신 JSTL 문법으로 표현 가능 -->     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!-- JSTL Functions(함수) 라이브러리: 줄바꿈, 날짜일정문자 잘라내는 기능들이 있다 -->  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--JSTL Formatting라이브러리: fmt 태그는 주로 날짜/시간, 숫자, 메시지 포맷 처리에 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!-- ${cpath}/login/loginProcess 이렇게 쓰인다  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC Communication</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>

</style>
</head>
<body>
	<div class="container">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	  <div class="panel panel-default">
		<div class="panel-heading">Board Content</div>
		<div class="panel-body">
		<table class="table table-bordered table-hover">
			<tr>
				<td style="text-align: center">번호</td>
				<td>${vo.idx}</td>
			</tr>
			<tr>
				<td style="text-align: center">제목</td>
				<td><c:out value="${vo.title}"/></td>
			</tr>
			<tr>
				<td style="text-align: center">내용</td>
				<td>
					<textarea class="form-control" readonly="readonly" rows="8" cols=""><c:out value="${vo.content}"/></textarea>
					
					<c:if test="${not empty vo.imgpath}">
					<br>
						<img src="${cpath}/resources/board/${vo.imgpath}" 
        							style="max-width:100%; height:auto;">
					</c:if>
				</td>
			</tr>
			<tr>
				<td style="text-align: center">작성자</td>
				<td>${vo.writer}</td>
			</tr>
			<tr>
				<td style="text-align: center">조회수</td>
				<td>${vo.count}</td>
			</tr>
			<tr>
				<td style="text-align: center">공감수</td>
				<td id="likeView"></td> 	
			</tr>
			<tr>
				<td colspan="2" style="text-align:center">
					
					<!--좋아요버튼자리-->
					<button id="likeBtn" class="btn btn-default btn-sm" type="button" onclick="likePlus()">♡</button>
					
					<c:if test="${not empty mvo}"> <!-- mvo가 비어있지 않는 상황: 로그인한 상황을 말한다 -->
					<button data-btn="reply" class="btn btn-sm btn-primary">답글쓰기</button>
					<button data-btn="modify" class="btn btn-sm btn-success">수정화면</button>   
					</c:if>
					
					<c:if test="${empty mvo}"> <!--로그인 안한 상황을 말한다 -->
					<button disabled="disabled" class="btn btn-sm btn-primary">답글</button>
					<button disabled="disabled" class="btn btn-sm btn-success">수정</button>   
					</c:if>
					<button data-btn="list" class="btn btn-sm btn-warning">목록</button>			
				</td>
			</tr>		
		</table>
		
		<form id="frm" method="get" action="">
			<input id="idx" type="hidden" name="idx" value="${vo.idx}" >
			<input type="hidden" name="page" value="${cri.page}">
			<input type="hidden" name="perPageNum" value="${cri.perPageNum}">	
				
			<!-- type과 keyword를 넘기기위한 부분 추가하면 결과값(type, keyword)이 유지된다 -->
		  	<input type="hidden" id="type" name="type" value="${cri.type}">
		  	<input type="hidden" id="keyword" name="keyword" value="${cri.keyword}">		
		</form>
		</div> <!-- 게시판 panel-body 끝 -->
		
			
		<!-- 댓글작성폼 -->
		<div class="panel-body" id="cmtform"> 
			<form id="cmtfrm"> 
				<input type="hidden" name="idx" value="${vo.idx}">
				<input type="hidden" name="memID" value="${mvo.memID}">					
				<input type="hidden" name="memName" value="${mvo.memName}">					
				<input type="hidden" name="memProfile" value="${mvo.memProfile}">				
				<table id="cmtTbl" class="table table-bordered table-hover">
					<tr>
						<td style="text-align: center; vertical-align: middle;">댓글작성자</td>
						<td><input readonly="readonly" type="text" name="memNickName" value="${mvo.memNickName}" class="form-control"></td> 
						<td style="text-align:center; vertical-align:middle; width:80px;">
							<button class="btn btn-default btn-sm" type="reset" id="fclear">취소</button>
						</td>
					</tr>
					<tr>
						<td style="text-align: center; vertical-align: middle;">댓글내용</td>
						<td>
							<textarea placeholder="댓글을 입력해주세요." rows="2" cols="" " name="cmtContent" class="form-control"></textarea>
						</td> 
						<td style="text-align:center; vertical-align:middle; width:80px;"> 
							<button class="btn btn-primary btn-sm" type="button" onclick="cmtInsert()">댓글등록</button>											
						</td>
					</tr>		                        
				</table>
			</form>		
		</div> 
		
		<!-- 댓글리스트폼 -->
		<div class="panel-body">
			<table id="cmtList" class="table table-bordered table-hover"> 	
				<tbody id="cmtView">
					<!--비동기 방식으로 가져온 댓글 나오게할 부분-->		
				</tbody>				
			</table>		
		</div>
		
		
		
		<div class="panel-footer">MVC Communication - All rights reserved</div>
	  </div>
	</div>
	
	<script type="text/javascript">
		//링크처리하기 
		$(document).ready(function() { //로딩되면 함수를 작동시키겠다 	
			
			//**$("button") → $("button[data-btn]"): <button>이면서 data-btn 속성을 가진 버튼만 선택		
			$("button[data-btn]").on("click", function(){ //버튼을 클릭하면 함수실행한다 
		
				var formData = $("#frm"); //form 태그 action값 주소를 바꿔주기위해 요소 가져오기 
				var btn = $(this).data("btn"); //현재 발생한 이벤트(클릭한 버튼요소)의 data-btn 속성값인
				                               // reply, modify, list 등 btn의 값을 가져온다  	 	
						                                                  
				if(btn == "reply"){ //답글버튼을 누르면
					formData.attr("action","${cpath}/board/reply"); //action 속성을 reply URL경로로 바꿔준다 
				}else if(btn == "modify"){
					formData.attr("action","${cpath}/board/modify"); 
				}else if(btn == "list"){
					formData.attr("action","${cpath}/board/list"); 
					formData.find("#idx").remove(); //id="frm"요소안에 id="idx"를 찾아서 삭제한다
				}
				
				formData.submit(); //form태그의 id="frm"에 submit을 작동한다		
			});
			loadCmt();    //비동기방식으로 댓글 리스트 가져오기 기능
			
			likeCount();  //likeCount 불러오기 기능
					
			selectLike(); //Like객체 likeAvailable 불러오기
		}); //end ready()
		
		
		//비동기방식으로 댓글리스트를 가져오는 기능
		function loadCmt() {
			//문자열 → 정수(10진수)로 변환하는 역할
			var idx =  parseInt("${vo.idx}", 10);
			
			$.ajax({
				url : "${cpath}/comment/loadCmt",    
				type: "get",      
				data : { "idx" : idx }, 
				dataType: "json",  //서버로부터 돌려받을 데이터 타입
				success: cmtView,  //콜백함수:다른 함수의 인자로 전달되어 특정 작업이 끝난 후 호출되는 함수
				error: function(){ alert("댓글로드실패"); }
			});
		}
		
		//댓글의 정보를 받아온다
		//서버로부터 비동기방식통신을 하고 성공했을때 작동하는 함수, 
		function cmtView(data){
			
			var listHtml = "";
		
			//$.each: jQuary반목문
			//data: AJAX 요청에서 서버가 반환한 전체 데이터
			//index: 배열의 인덱스, obj: 배열의 해당 인덱스 값 data[index]
			$.each(data, function(index, obj){ //index:순서 표시자
				
				//1763895209000 → 2025-11-23 21:11 
				var date = new Date(obj.cmtIndate); //Data 객체로 변환
				//Date 객체에서 각 정보를 뽑아 보기 좋은 문자열로 변환
		        var formatted = date.getFullYear() + '-' +
		                        ('0' + (date.getMonth()+1)).slice(-2) + '-' +		                        
		                        // 11+1 → 12
		                        // '0' + 12 →'012' (문자열)
		                        // ('012').slice(-2)  → "12" :뒤에서 2자리만 가져오기 때문에 두 자리 확보
		                        // "12"+'-' → "12-"
		                        ('0' + date.getDate()).slice(-2) + ' ' +
		                        ('0' + date.getHours()).slice(-2) + ':' +
		                        ('0' + date.getMinutes()).slice(-2);
		                        
				listHtml += "<tr>";
				
				//프로필 이미지가 있으면 업로드 경로의 이미지를 사용하고, 없으면 기본 이미지를 사용
			    var imgSrc = obj.memProfile 
                ? "${cpath}/resources/upload/" + obj.memProfile 
                : "${cpath}/resources/images/default.png"; 
                
                listHtml += "<td style='text-align:center; vertical-align:middle; width:80px;'>"
                listHtml += "<img style='width:30px; height:30px;' class='img-circle' src='" + imgSrc + "' />";
                listHtml += "</td>";  
                
				listHtml += "<td style='text-align:center; vertical-align:middle; width:120px;'>" + obj.memNickName + "</td>";
     
				//if문으로 삭제유무 표시
				if (obj.cmtAvailable == 0) {
					listHtml += "<td><textarea class='form-control' readonly='readonly' rows='1' cols=''>";
					listHtml += "작성자에 의해 삭제된 댓글입니다.</textarea></td>";
				} else if (obj.cmtAvailable == 1) {
					listHtml += "<td><textarea class='form-control' readonly='readonly' rows='1' cols=''>"; 
					listHtml += obj.cmtContent + "</textarea></td>";
				}	

				listHtml += "<td style='text-align:center; vertical-align:middle; width:180px;'>" + formatted + "</td>"; //댓글날짜		
				
				//삭제된 게시물이면 삭제버튼 비활성화한다
				listHtml += "<td style='text-align:center; vertical-align:middle; width:80px;'>";					
				var memID = "${mvo.memID}"; //현재로그인된 memID
				if (obj.cmtAvailable == 0) {									
					listHtml += "<button disabled type='button' class='btn btn-default btn-sm'>삭제됨</button>";					
				} else if (obj.cmtAvailable == 1 &&  memID == obj.memID) {				
					listHtml += "<button type='button' class='btn btn-primary btn-sm'"; 		
					listHtml += "onclick='cmtDelete(" + obj.cmtIdx + ")'>삭제</button>";		
				} else if (obj.cmtAvailable == 1 &&  memID != obj.memID) {				
					listHtml += "<button disabled type='button' class='btn btn-primary btn-sm'"; 		
					listHtml += "onclick='cmtDelete(" + obj.cmtIdx + ")'>삭제</button>";		
				}
				listHtml += "</td>";	
				
				listHtml += "</tr>";
			});
			
			$("#cmtView").html(listHtml);	
		}
		

		//댓글 등록버튼
		function cmtInsert(){

			//form 안의 입력값들을 AJAX로 바로 보낼 수 있는 문자열로 변환해주는 함수		
			var fData = $("#cmtfrm").serialize();
			console.log("fData: ", fData);
			//idx=123&memID=son&cmtContent=%EB%8C%93%EA%B8%80+%EB%82%B4%EC%9A%A9
			
			$.ajax({
				url : "${cpath}/comment/cmtInsert",
				type : "post",
				data : fData, 
				success : function(){ 
					loadCmt(); ////비동기방식으로 댓글리스트 가져오기 기능
				}, 
				error : function(){ alert("댓글등록실패")}
			});
			$("#fclear").trigger("click");
			//등록 후 폼을 초기 상태로 돌리기 위해 클릭 이벤트를 강제로 실행
		};
		
		
		//댓글삭제기능
		function cmtDelete(cmtIdx){
			//확인/취소창 
			if(!confirm("댓글을 삭제하겠습니까?")) {
		        return; //취소를 누르면 함수종료 된다
		    }	
			
			$.ajax({
				url : "${cpath}/comment/cmtDelete", 
				type : "get",        
				data : { "cmtIdx" : cmtIdx }, 
				success : function(){ 
					loadCmt(); 		
				},      
				error : function(){ alert("댓글삭제기능 오류")}
			});
		};
		
		
		//likeCount 불러오기 기능
		function likeCount(){
			var idx =  parseInt("${vo.idx}", 10);		
			
			$.ajax({
				url : "${cpath}/like/likeCount",    
				type: "get",      
				data : {"idx" : idx},  
				dataType: 'json',
				success: function(data){				
					$("#likeView").text(data.likeCount);								
			        },  
				error: function(){ alert("likeCount 불러오기실패"); }
			});
		};
		
		
		//likeCount+1
		function likePlus(){
			var idx =  parseInt("${vo.idx}", 10);		
			
			$.ajax({
				url : "${cpath}/like/likePlus",    
				type: "post",      
				data : { "idx" : idx},  
				success: function(){	
					insertLike(); //Like객체생성하기
					likeCount();  //likeCount 불러오기
			        },  
				error: function(){ alert("likeCount+1 실패"); }
			});
		};
		
		
		//Like객체생생하기
		function insertLike(){
			var idx =  parseInt("${vo.idx}", 10);	
			var memID = "${mvo.memID}";
			
			$.ajax({
				url : "${cpath}/like/insertLike",    
				type: "post",      
				data : {"idx" : idx, "memID" : memID},  
				success: function(){			
					selectLike(); //Like객체 likeAvailable 불러오기
			        },  
				error: function(){ alert("Like객체생생실패"); }
			});
		};
		
		
		//Like객체 likeAvailable 불러오기
		function selectLike(){
			var idx =  parseInt("${vo.idx}", 10);	
			var memID = "${mvo.memID}";
			
			$.ajax({
				url : "${cpath}/like/selectLike",    
				type: "get",      
				data : {"idx" : idx, "memID" : memID},
				dataType: 'json',
				success: function(data){	
					likeView(data); //버튼을 좋아요취소 상태로변경
			        },  
				error: function(){ }
			});
		};
		
		//사용자가 좋아요를 누른 상태라면 버튼을 좋아요취소 상태로 변경
		function likeView(data){
			if (data == 1) {
			    $("#likeBtn").text("♡").attr("onclick", "unLike()")
			    .removeClass()
		        .addClass("btn btn-danger btn-sm"); 
			}
		};
		
		
		//likeCount-1 기능
		function unLike(){
			var idx =  parseInt("${vo.idx}", 10);		
			$.ajax({
				url : "${cpath}/like/unLike",    
				type: "post",      
				data : { "idx" : idx},  
				success: function(){				
					deleteLike(); //Like객체 삭제하기
					likeCount();  //likeCount불러오기
			        },  
				error: function(){ alert("likeCount-1 실패"); }
			});
		};
		
	
		
		//Like객체삭제하기
		function deleteLike(){
			var idx =  parseInt("${vo.idx}", 10);	
			var memID = "${mvo.memID}";	
			$.ajax({
				url : "${cpath}/like/deleteLike",    
				type: "post",      
				data : {"idx" : idx, "memID" : memID},
				success: function(){
					unlikeView();
			        },  
				error: function(){ alert("Like객체삭제하기"); }
			});
		};
			
		//unlike 후 버튼 텍스트, 스타일을 기본 '좋아요' 상태로 초기화하고
		// 클릭 시 likePlus()을 호출하도록 이벤트를 변경
		function unlikeView(){
			 $("#likeBtn").text("♡").attr("onclick", "likePlus()")
			 .removeClass()
		     .addClass("btn btn-default btn-sm");
		};

		
	</script>
	
</body>
</html>















