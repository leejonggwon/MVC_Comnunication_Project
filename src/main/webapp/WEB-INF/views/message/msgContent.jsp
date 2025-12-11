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
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	  <div class="panel panel-default">
		<div class="panel-heading">받은 메일</div>
		<div class="panel-body">
		<form id="frm">
			<button data-btn="senMsgForm" class="btn btn-primary btn-sm pull-left" style="margin: 0px 0px 15px 0px;">답장하기</button>					
			<button data-btn="deleteMsg" class="btn btn-danger btn-sm pull-left" style="margin: 0px 0px 15px 5px;"">삭제</button> 
			<button data-btn="msgList" class="btn btn-success btn-sm pull-left" style="margin: 0px 0px  15px 5px;">
				<span class="glyphicon glyphicon-folder-open"></span>&nbsp; 받은 메일함 이동
			</button> 	
			
			<table class="table table-bordered table-hover">									 	
				<tr>
					<td style="text-align: center; vertical-align: middle;">제목</td>
					<td><c:out value="${vo.msgTitle}"/></td>
				</tr>
				<tr>
					<td id="fromID" style="text-align: center; vertical-align: middle;">보낸사람</td>
					<td>${vo.fromID}</td>
				</tr>
				<tr>
					<td id="msgContent" style="text-align: center; vertical-align: middle;">내용</td>
					<td>
						<textarea class="form-control" readonly="readonly" rows="8" cols=""><c:out value="${vo.msgContent}"/></textarea>
						
						<c:if test="${not empty vo.msgImgpath}">
						<br>
							<img src="${cpath}/resources/message/${vo.msgImgpath}" style="max-width:100%; height:auto;">
						</c:if>
					</td>
				</tr>			
				</table>
				
				<input id="toID" type="hidden" name="toID" value="${vo.fromID}">
				<input type="hidden" name="msgIdx" value="${vo.msgIdx}">
				
				<input type="hidden" name="page" value="${cri.page}">
				<input type="hidden" name="perPageNum" value="${cri.perPageNum}">	
				<!-- type과 keyword를 넘기기위한 부분 추가하면 결과값(type, keyword)이 유지된다 -->
			  	<input type="hidden" id="type" name="type" value="${cri.type}">
			  	<input type="hidden" id="keyword" name="keyword" value="${cri.keyword}">
			
		</form>	
	
		</div>
		<div class="panel-footer">MVC Communication - All rights reserved</div>
	  </div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {

		});
		
		$("button").on("click", function() {
			var formData = $("#frm");
			var btn = $(this).data("btn"); //data-btn
			if(btn == "msgList"){
				formData.attr("action", "${cpath}/message/msgList");
				formData.attr("method", "get");
			}else if(btn == "senMsgForm"){
				formData.attr("action", "${cpath}/message/sendMsgForm");
				formData.attr("method", "get");
			}else if(btn =="deleteMsg"){
				formData.attr("action", "${cpath}/message/deleteMsg");
				formData.attr("method", "post");				
				formData.find("#toID").remove();
			}
			formData.submit();
		});

	</script>
	
	
</body>
</html>





