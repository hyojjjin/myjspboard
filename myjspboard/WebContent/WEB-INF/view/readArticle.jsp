<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-3"></div>
		<div class="col-6">
			<h1>게시글 보기</h1> 

			<form>
				<div class="form-group row">
					<label for="number" class="col-sm-2 col-form-label">글 번호 </label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext"
							id="number" value="${articleData.article.number }">
					</div>
				</div>
				
				
				<div class="form-group row">
					<label for="title" class="col-sm-2 col-form-label">제목 </label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext"
							id="title" value="${articleData.article.title }">
					</div>
				</div>
				
			    <div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">작성자 </label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext"
							id="name" value="${articleData.article.writer.name }">
					</div>
				</div>
				

				
				<div class="form-group row">
					<label for="content" class="col-sm-2 col-form-label">내용</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext"
						id="content" value="${articleData.content.content }">
					</div>
				</div>
			</form>
	<a class="btn btn-primary" href="${root }/list.do?pageNo=${pageNo}" role="button">목록</a>
			
<c:if test="${authUser.id == articleData.article.writer.id}">
	<a class="btn btn-primary" href="${root }/modify.do?no=${articleData.article.number }" role="button">수정</a>
	<a class="btn btn-primary" href="${root }/delete.do?no=${articleData.article.number }" role="button">삭제</a>
</c:if>






  <div class="container">
    <table border="1" width="100%">
      <tr>
        <td>번호</td>
        <td>${articleData.article.number }</td>
      </tr>
      <tr>
        <td>작성자</td>
        <td>${articleData.article.writer.name }</td>
      </tr>
      <tr>
        <td>제목</td>
        <td><c:out value="${articleData.article.title }"></c:out></td>
      </tr>
      <tr>
        <td>내용</td>
        <td><u:pre value="${articleData.content.content }" /></td>
      </tr>
      <tr>
        <td colspan="2"><c:set var="pageNo"
            value="${empty param.pageNo ? '1' : param.pageNo }" /> <a
          href="list.do?pageNo=${pageNo}">[목록]</a>
          <c:if
            test="${authUser.id == articleData.article.writer.id}">
            <a href="modify.do?no=${articleData.article.number }">[게시글수정]</a>
            <a href="delete.do?no=${articleData.article.number }">[게시글삭제]</a>
          </c:if></td>
      </tr>
      <tr>
        <td></td>
        <td></td>
      </tr>
    </table>
    
    <%-- 
    로그인 한 경우만
    댓글 폼 출력
    
    --%>
    <u:replyForm articleNo="${articleData.article.number }"/>
    
      
    <u:listReply /> 
  </div>

</body>
</html>

