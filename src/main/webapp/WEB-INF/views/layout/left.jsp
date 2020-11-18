<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <!-- left  -->
		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="/main" class="brand-link">
				<img src="/member/resources/images/line.png" class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">회원 관리</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="${pageContext.request.contextPath}/profileView?userid=${S_MEMBER.userId}" class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<div class="row">
							<a class="col-md-8" href="/memberView?userid=${S_MEMBER.userId }" class="d-block">${S_MEMBER.userId}(${S_MEMBER.alias })</a>
						</div>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column subMenuList" data-widget="treeview" data-accordion="false">

					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>

			<!-- /.sidebar -->
		</aside>
    