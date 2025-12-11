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
		<div class="panel-heading">BookRegister</div>
		<div class="panel-body">
			<form id="frm">
			
			<table class="table table-hover table-bordered">
			<input type="hidden" id="page" name="page" value="${cri.page}">
			<input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum}">
			
				<tr>
					<td>제목</td>
					<td><input id="bkTitle" type="text" name="bkTitle" class="form-control"></td>
				</tr>
				<tr>
					<td>작가</td>
					<td><input id="bkAuthor" type="text" name="bkAuthor" class="form-control"></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input id="bkCompany" type="text" name="bkCompany" class="form-control"></td>
				</tr>
				<tr>
					<td>ISBN</td>
					<td><input id="bkIsbn" type="text" name="bkIsbn" class="form-control"></td>
				</tr>
				<tr>
					<td>분류</td>
					<td><input id="bkCategory" type="text" name="bkCategory" class="form-control"></td>
				</tr>
				<tr>
					<td>청구기호</td>
					<td><input id="bkCallNumber" type="text" name="bkCallNumber" class="form-control"></td>
				</tr>
				<tr>
					<td>도서수</td>
					<td><input id="bkCount" type="text" name="bkCount" class="form-control"></td>
				</tr>
				
				<tr>
					<td colspan="2" style="text-align:center">
						<button data-btn="bookRegister" type="button" class="btn btn-primary btn-sm">등록</button>
						<button type="reset" class="btn btn-default btn-sm">취소</button>	
						<button data-btn="bookList" type="button" class="btn btn-sm btn-warning">목록</button>
				   </td>
			   </tr>	
			 </table>
			 </form>
			
			
			</div> 
			<div class="panel-footer">MVC Communication - All rights reserved</div>
		  </div>
		</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("button").on("click", function(e) {
				var formData = $("#frm");
				var btn = $(this).data("btn");
				
				if(btn == "bookList"){
					formData.attr("action", "${cpath}/book/bookList");
					formData.attr("method", "get");
					
					formData.find("#bkTitle").remove();
					formData.find("#bkAuthor").remove();
					formData.find("#bkCompany").remove();
					formData.find("#bkIsbn").remove();	
					formData.find("#bkCategory").remove();
					formData.find("#bkCallNumber").remove();
					formData.find("#bkCount").remove();	
								
					
				}else if(btn == "bookRegister"){			
					formData.attr("action", "${cpath}/book/bookRegister");
					formData.attr("method", "post");					
					
					formData.find("#page").remove();
					formData.find("#perPageNum").remove();
					}
				formData.submit();
			});
		});
	</script>
</body>
</html>





