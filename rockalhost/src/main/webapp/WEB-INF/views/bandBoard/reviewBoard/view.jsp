<%@ include file="../../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rock All Host에 오신걸 환영합니다.</title>
<script>

$(function() {
	comment_list();
	
	$("#btnSave").click(function() {
		if($("#comment_passwd").val()=="") {
            alert("비밀번호를 입력하세요");
            comment_passwd.focus();
            return;
         }
		if($("#content").val()=="") {
			alert("내용을 입력하세요");
			content.focus();
			return;
		}
		commentInsert();
	});
	
	$("#btnList").click(function() {
		location.href="${path}/bandBoard/rbList.do?curPage=${curPage}&b_idx=${b_idx}";
	});
	
});

function comment_list() {
	var param = "num=${dto.num}&b_idx=${b_idx}&pf_title=${pf_title}";
	
	$.ajax({
		type: "post",
		url: "${path}/bandBoard/rbCommentList.do",
		data: param,
		success: function(result) {
			$("#commentList").html(result);
		}
	});
}

function commentInsert() {
	var param = "board_num=${dto.num}&passwd="+$("#comment_passwd").val()+"&writer="
	+$("#writer").val()+"&content="+$("#content").val()+"&b_idx=${b_idx}&pf_title=${pf_title}";
	$.ajax({
		type: "post",
		url: "${path}/bandBoard/rbCommentInsert.do",
		data: param,
		success: function(result) {
			$("#comment_passwd").val("");
			$("#content").val("");
			comment_list();
		}
	});
}
</script>
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<c:if test="${comment_message == 'error' }">
	<script>
		alert("댓글 비밀번호가 일치하지 않습니다.");
	</script>
</c:if>

<%@ include file="../../main/nav.jsp" %>
  <div id="title_div_back">
     <div id="div_title" >
     <br>
     <h1>Band Review View</h1>
     </div>
  </div>

<div class="container-fluid">
	<div class="row row-offcanvas row-offcanvas-right">
		<%@ include file="../../band/bandsidevar.jsp" %>        
		<div class="col-xs-10 col-lg-10">
			
			
	<form name="form1" method="post">
	<table class="table table-hover" style="margin-top: 30px; width: 930px;" border="1">
		<tr>
			<td>${dto.writer}</td>
			<td>[ ${pf_title} ] ${dto.subject}</td>
			<td>
				<fmt:formatDate value="${dto.reg_date}" pattern="YYYY-MM-dd"/>
			</td>
			<td>평점</td>
			<td>${dto.score}</td>
			<td>조회수</td>
			<td>${dto.readcount}</td>
		</tr>
		<tr>
			<td colspan="7" style="height: 400px;">${dto.content}</td>
		</tr>
		<tr>
			<td colspan="7" align="center">
				<input type="hidden" name="num" value="${dto.num}">
				<input type="hidden" name="pf_idx" value="${pf_idx}">
				<input type="hidden" name="b_idx" value="${b_idx}">
				<input class="btn btn-default" type="button" id="btnList" value="목록">
			</td>
		</tr>
	</table>
	</form>
	
	<table class="table table-hover" border="1" style="width: 930px;">
		<tr>
			<td>
				<input class="form-control" id="writer" readonly="readonly" value="${sessionScope.nickName}">
				<input class="form-control" id="comment_passwd" type="password" placeholder="비밀번호"> 
			</td>
		</tr>
		<tr>
			<td align="center">
				<textarea style="" rows="5" cols="80" id="content" placeholder="내용을 입력하세요."></textarea>
			</td>
		</tr>
		<tr>
			<td align="center">
				<button class="btn btn-default" id="btnSave" type="button">확인</button>
			</td>
		</tr>
	</table>
	
	<div id="commentList"></div>
	
		</div>
	</div>
</div>


<%@ include file="../../main/footer.jsp" %>
</body>
</html>