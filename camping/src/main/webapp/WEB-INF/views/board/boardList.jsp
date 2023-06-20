<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 70%;
	border-collapse: collapse;
	border: 1px solid black;
	text-align: center;
}

td, th {
	border: 1px solid black;
	padding: 5px 0;
}
body{
    margin : 10px;
    padding: 10px;
    text-align: center;
}
.dropdown{
    position: relative;
    display: inline-block;
}
.button{
    padding: 10px 40px;
    font-size:15px;
    background-color: blue;
    color: wheat;
}
#drop-content{
    position: absolute;
    z-index: 1;
}
#drop-content a{
    display:block;
    font-size: 15px;
    background-color: #dfdfdf;
    color: black;
    text-decoration: none;
    padding: 10px 36px;
    margin: 2px 0px 0px 0px;
    
   
   * {
	box-sizing: border-box;
}

body {
	margin: 0;
}
header {
	display: flex;
  } 

.img_logo {
	margin-right: 15px;
	max-width: 150px;    
	margin-top: 20px;
}

.search_box {
	width: 520px;
	height: 50px;
	border: 2px solid #03cf5d;
	display: flex;
	margin-top: 20px;
}

.search_box input {
	width: 90%;
	height: 46px;
	padding-left: 12px;
	padding-right: 12px;
	border: none;
	outline: none;
	font-size: 18px;
	
}

.search_box button {
	width: 10%;
	height: 46px;
	margin: 0;
	padding: 0;
	border: none;
	background: #03cf5d;
}

.search_box i {
	color: white;
	font-size: 22px;
	text-align: center;
}

#keyboard {
	color: lightgray;
	font-size: 20px;
	text-align: center;
	width: 10%;
	padding-top:12px;
} 
}


</style>
</head>
<body>
	<div align="center">
		
		<div>
			<h1>공지사항</h1>
		</div>
		
		<div>
			<div class="container d-flex align-items-center justify-content-center">
			<nav id="navbar" class="navbar">
				<ul>
					<li><a class="nav-link scrollto" href='boardList.do'>공지사항</a></li>
					<li><a class="nav-link scrollto" href='boardReviewList.do'>구매후기</a></li>
					<li><a class="nav-link scrollto" href='boardQnaList.do'>문의하기</a></li>
				</ul>
			</nav>
		</div>
			
			
		</div>
		<table>
			<thead>
				<tr>
					<th>게시물 번호</th>
					<th>카테고리</th>
					<th>작성자</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boards}" var="b">
					<tr onclick=boardChoice(${b.boardId});>
						<td>${b.boardId}</td>
						<td>${b.boardKate}</td>
						<td>${b.memberId}</td>
						<td>${b.boardTitle}</td>
						<td>${b.boardSubject}</td>
						<td>${b.boardWdate}</td>
						<td>${b.boardHit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br>
	 <div align="center">
		<form method="post" name="serarch" action="boardSearch.do">
					<select name="kate" id="kate">
							<option value="title">제목</option>
							<option value="subject">내용</option>
							<option value="writer">작성자</option>
					</select>
					<input type="text" placeholder="검색어 입력" name="search" id="search">
					<button type="submit">검색</button>
		</form>
	</div> 
	<div align="center">
		<c:if test="${not empty id }">
			<button type="button" onclick="location.href='boardInsertForm.do'">글작성</button>
		</c:if> 
	</div>
	<div>
		<form id="frm" action="boardSelect.do" method="post">
			<input type="hidden" id="boardId" name="boardId">
		</form>
	</div>
	<script type="text/javascript">
	
		
		function boardChoice(id) {
			let url = "ajaxBoardHit.do?boardId="+id;
			fetch(url)
			.then(response => response.text())
			.then(text => htmlProcess(text));
			
			frm.boardId.value = id;
			frm.submit();
		}
		
		function htmlProcess(hit) {
			let frm = document.getElementById("frm");
			if(hit=='complete'){
				frm.boardId.value = id;
				frm.submit();
			}else if(hit =='fail'){
				window.reload();
			}
		}
	</script>
</body>
</html>