<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script src="${pageContext.request.contextPath}/member/resources/js/js.cookie-2.2.1.min.js"></script>
<script>
	$(function(){

		pageNum = parseInt(Cookies.get('pageSize'));
		$('#pageSize').val(pageNum);

		type = Cookies.get('searchType');
		$('#searchType').val(type);

		$('#registBtn').on('click', function(){

				document.location = "${pageContext.request.contextPath}/memberRegistView";

		})

		$('tr.memInfo').on('click', function(){
			var userid = $(this).data('userid');
			document.location = "${pageContext.request.contextPath}/memberView?userid="+userid;

		})

		$('#pageSize').on('change', function(){

			var pageSize = $('option:selected', this).val();

			if(pageSize == ""){
				pageSize = "${page.pageSize}";
			}
		
			console.log(pageSize);

			Cookies.set("pageSize", pageSize);
			
			document.location = "${pageContext.request.contextPath}/memberList?pageSize="+pageSize;

		})
		
		$('#searchType').on('change', function(){

			var searchType = $('option:selected', this).val();
			console.log(searchType);

			Cookies.set("searchType", searchType);

		})
		
		$('#searchBtn').on('click', function(){
			$('form').submit();

		})
		

	})
		
		

</script>



<!-- <title>회원 리스트</title> -->

		<div id="if_list_div" style="position: relative; padding: 0; overflow: hidden; height: 750px;">
			<div class="content-wrapper" style="min-height: 584px;">
				<!-- Content Header (Page header) -->
				<section class="content-header">
					<div class="container-fluid">
						<div class="row md-2">
							<div class="col-sm-6">
								<h1>회원리스트</h1>
							</div>
							<div class="col-sm-6">
								<ol class="breadcrumb float-sm-right">
									<li class="breadcrumb-item">회원리스트</li>
									<li class="breadcrumb-item">목록</li>
								</ol>
							</div>
						</div>
					</div>
				</section>
				<!-- Main content -->
				<section class="content">
					<div class="card">
						<div class="card-header with-border">
							<button type="button" id="registBtn" class="btn btn-primary" >회원등록</button>
							<div id="keyword" class="card-tools" style="width: 550px;">
							 <form action="${pageContext.request.contextPath }/memberList" method="post">
								<div class="input-group row">
										<!-- sort num -->
										<select class="form-control col-md-3" name="pageSize" id="pageSize">
											<option class="pageOpt" value="">정렬개수</option>
											<option class="pageOpt" value="3">3개씩</option>
											<option class="pageOpt" value="5">5개씩</option>
											<option class="pageOpt" value="7">7개씩</option>
										</select>
										<!-- search bar -->
										<select class="form-control col-md-3" name="searchType" id="searchType">
											<option value="">검색구분</option>
											<option value="userId">아이디</option>
											<option value="userNm">이름</option>
											<option value="alias">별명</option>
										</select> <input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value=""> <span class="input-group-append">
											<button class="btn btn-primary" type="button" id="searchBtn" data-card-widget="search" onclick="searchList_go(1);">
												<i class="fa fa-fw fa-search"></i>
											</button>
										</span>
										<!-- end : search bar -->
								</div>
						 	</form>
							</div>
						</div>
						<div class="card-body" style="text-align: center;">
							<div class="row">
								<div class="col-sm-12">
									<table class="table table-bordered">
										<tbody>
											<tr>
												<th>아이디</th>
												<th>패스워드</th>
												<th>별명</th>
												<th>도로주소</th>
												<th>등록날짜</th>
												<!-- yyyy-MM-dd  -->
											</tr>
											
											<c:forEach items="${map.memberList}" var="member">
												<tr class="memInfo" data-userid="${member.userId}">
													<td>${member.userId}</td>
													<td>${member.pass }</td>
													<td>${member.alias}</td>
													<td>${member.addr1}</td>
													<td>
														<fmt:formatDate value="${member.reg_dt}" pattern="yyyy-MM-dd"/>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- col-sm-12 -->
							</div>
							<!-- row -->
						</div>
						<!-- card-body -->
						<div class="card-footer">
							<nav aria-label="member list Navigation">
								<ul class="pagination justify-content-center m-0">
									<c:choose>
										<c:when test="${page.page > 1}">
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/memberList?page=1"><i class="fas fa-angle-double-left"></i></a></li>
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/memberList?page=${page.page-1}"><i class="fas fa-angle-left"></i></a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" ><i class="fas fa-angle-double-left"></i></a></li>
											<li class="page-item"><a class="page-link" ><i class="fas fa-angle-left"></i></a></li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach begin="1" end="${map.totalPage }" step="1" var="i">
										<c:choose>
											<c:when test="${i == page.page}">
												<li class="page-item active"><a class="page-link" href="">${i}</a></li>																															
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link" href="/memberList?page=${i}">${i}</a></li>																															
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<c:choose>
										<c:when test="${page.page < map.totalPage}">
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/memberList?page=${page.page+1}"><i class="fas fa-angle-right"></i></a></li>
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/memberList?page=${map.totalPage }"><i class="fas fa-angle-double-right"></i></a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"><i class="fas fa-angle-right"></i></a></li>
											<li class="page-item"><a class="page-link"><i class="fas fa-angle-double-right"></i></a></li>
										</c:otherwise>
									</c:choose>
								</ul>
								
								
								
								<%-- <c:choose>
									<c:when test="${page.page > 1 }">
										<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/memberList?page=${page.page-1}"><i class="fas fa-angle-left"></i></a></li>					
									</c:when>
									<c:otherwise>
										<li><span>&lt;</span></li>
									</c:otherwise>
								</c:choose>
								<c:forEach var="i" begin="${totalPage > 10 ? pageVo.page : 1}" end="${totalPage > 10 ? pageVo.page + 9 : totalPage }" >
									<c:choose>
										<c:when test="${i == pageVo.page}">
											<li class="active"><span>${i}</span></li>					
										</c:when>
										<c:otherwise>
											<li><a href="${pageContext.request.contextPath }/postList?page=${i}&pagesize=${pageVo.pageSize}&boardid=${boardid}&boardnm=${boardnm}">${i }</a></li>					
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${pageVo.page < totalPage }">
										<li><a href="${pageContext.request.contextPath}/postList?page=${pageVo.page+1}&boardid=${boardid}">&gt;</a></li>					
									</c:when>
									<c:otherwise>
										<li><span>&gt;</span></li>
									</c:otherwise>
								</c:choose>
								<li><a href="${pageContext.request.contextPath}/postList?page=${totalPage}&boardid=${boardid}">&gt;&gt;</a></li> --%>
							
							</nav>

						</div>
						<!-- card-footer -->
					</div>
					<!-- card  -->
				</section>
			</div>
		</div>