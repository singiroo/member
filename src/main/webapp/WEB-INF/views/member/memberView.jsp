<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <title>회원 상세</title> -->




		<!-- 컨텐츠  -->
		
		<div id="if_list_div" style="position: relative; padding: 0; overflow: hidden;">
			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">

				<!-- Main content -->
				<section class="content register-page" style="height:100%;">
					<div class="container-fluid">
						<div class="login-logo">
							<b>${member.userId} 상세화면</b>
						</div>
						<!-- form start -->
						<div class="card">
							<div class="register-card-body">
								<form role="form" class="form-horizontal" action="${pageContext.request.contextPath}/memberRegist" method="POST" enctype="multipart/form-data" >
									<div class="input-group mb-3">
										<div class="mailbox-attachments clearfix" style="text-align: center; width:100%;">
											<div class="mailbox-attachment-icon has-img" id="pictureView" style="border: 1px solid green; height: 200px; width: 140px; margin: 0 auto;">
												<img id="pictureViewImg" src="${pageContext.request.contextPath}/profileView?userid=${member.userId}" style="width:100%; height:100%;"/>
											</div>
											<div class="mailbox-attachment-info">
												<div class="input-group input-group-sm">
												</div>
											</div>
										</div>
										<br />
									</div>
									
									<div class="form-group row">
										<label for="id" class="col-sm-3" style="font-size: 0.9em;">
											아이디
										</label>
										<div class="col-sm-9 input-group-sm">
											<p>${member.userId}</p> 
										</div>
									</div>
									
									<!-- <div class="form-group row">
										<label class="col-sm-3" style="font-size: 0.9em;">
											아이디
										</label>
										<div class="col-sm-9 input-group input-group-sm">
											<span class="input-group-append-sm">brown</span>
										</div>
									</div> -->
									
									<div class="form-group row">
										<label for="pwd" class="col-sm-3" style="font-size: 0.9em;">
											패스워드</label>
										<div class="col-sm-9 input-group-sm">
											<p>${member.pass }</p>
										</div>
									</div>
									
									<div class="form-group row">
										<label for="name" class="col-sm-3" style="font-size: 0.9em;">
											이 름
										</label>
										<div class="col-sm-9 input-group-sm">
											<p>${member.userNm }</p>
										</div>

									</div>
									<div class="form-group row">
										<label for="alias" class="col-sm-3" style="font-size: 0.9em;">별명</label>
										<div class="col-sm-9 input-group-sm">
											<p>${member.alias }</p>
										</div>
									</div>
									<div class="form-group row">
										<label for="addr1" class="col-sm-3 control-label">주소</label>
										<div class="col-sm-3 input-group-sm">
											<p>${member.addr1 }</p>
										</div>
										<div class="col-sm-3 input-group-sm">
											<p>${member.addr2 }</p>
										</div>
										
										<div class="col-sm-2 input-group-sm">
											<p>${member.zipcode }</p>
										</div>
										<div class="col-sm-1 input-group-sm">
											<span class="input-group-append-sm">
											</span>
										</div>
									</div>
									
									<div class="card-footer">
										<div class="row">
											<div class="col-sm-6">
												<button type="button" id="updateBtn" class="btn btn-info">수정</button>
											</div>

											<div class="col-sm-6">
												<button type="button" id="listBtn" onclick="CloseWindow();" class="btn btn-default float-right">&nbsp;&nbsp;&nbsp;목 &nbsp;&nbsp;록&nbsp;&nbsp;&nbsp;</button>
											</div>

										</div>
									</div>
								</form>
							</div>
							<!-- register-card-body -->
						</div>
					</div>
				</section>
				<!-- /.content -->
			</div>
			<!-- /.content-wrapper -->
		</div>
	<script>
		$(document).ready(function(){

			$('#listBtn').on('click', function(){
				document.location = "${pageContext.request.contextPath}/memberList";
			})

			$('#updateBtn').on('click', function(){
				document.location = "${pageContext.request.contextPath}/memberUpdateView?userid=${member.userId}";
			})
				

			
		});
		
		
		
		
			 
		
	</script>




