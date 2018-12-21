

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--네비게이션 바~~-->
<style>
</style>
<div class="wrapper">
	<div class="sg-header">
		<div class="col-sm-offset-2 col-sm-8 sg-menu-left" style="display: block">
			<a href="/home.do" style="float: left"><img alt="CODEPEOPLE LOGO" src="<c:url value='/resources/img/'/>cope_logo.png" style="width: 150px;"></a>
			<div class="sg-menu" style="margin-left: 30%;">
				<ul>
					<li><a href="#">강의</a>
						<ul>
							<li><a>Java</a></li>
							<li><a>javaScript</a></li>
							<li><a>Spring</a></li>
							<li><a>로드 맵</a></li>
						</ul></li>
					<li><a href="#">외부강의</a>
						<ul>
							<li><a>Java</a></li>
							<li><a>javaScript</a></li>
							<li><a>Spring</a></li>
							<li><a>로드 맵</a></li>
						</ul></li>
					<li><a href="#">게시판</a>
						<ul>
							<li><a>공지사항</a></li>
							<li><a>관리자문의</a></li>
						</ul></li>
					<li><a>질의응답</a></li>
					<li>
						<form style="padding-left: 50px;" action="http:naver.com"
							id="sg-form-search">
							<input type="text" name="" value="" placeholder="검색"
								style="text-align: center; border-radius: 10px; border: none; height: 30px;"
								name="keyword">
							<button class="fas fa-search"
								style="border: none; background: none; color: white; font-size: 20px;"></button>
						</form>
					</li>
				</ul>
			</div>
		</div>
		<div class="col-xs-2 sg-menu-right">
			<c:choose>
				<c:when test="${LOGIN_USER eq null}">
					<nav class="sg-menu-login" style="font-size: 15px; color: white; font-weight: bold; margin-top: 20px;">
						<a href="#" class="sg-text-white login-in">로그인</a> || <a href="/user/signup.do" class="sg-text-white">회원가입</a>
					</nav>
				</c:when>
				<c:otherwise>
					<a class="glyphicon glyphicon-user" style="font-size: 25px;"></a>
					<div class="sg-menu-info">
						<div class="sg-info-menu-box">
							<div class="sg-info-header">
								<div class="sg-user-img">
									<img
										src="https://d81pi4yofp37g.cloudfront.net/wp-content/uploads/300.png"
										alt=""
										style="width: 70px; height: 70px; border-radius: 100px; margin: 10px; float: left;">
								</div>
								<div class="sg-user-info">
									<p>손상기</p>
									<p>100</p>
									<p>
										<a href="/user/logout.do">로그아웃</a>
									</p>
								</div>
							</div>
							<div class="sg-info-body">
								<ul>
									<li><a>메뉴1</a></li>
									<li><a>메뉴1</a></li>
									<li><a>메뉴1</a></li>
									<li><a>메뉴1</a></li>
									<li><a>메뉴1</a></li>
								</ul>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
	<!--네비게이션바 끝~~-->
	<!--유저 헤더 시작~~-->
	<div class="sg-user-header"
		style="background: url(<c:url value='/resources/img/'/>Productsp-Page-Header-1500x300.jpg) 0% 30% / cover !important;position:relative">
		<div class="container text-center sg-user-show">
			<div class="">
				<c:choose>
					<c:when test="${LOGIN_USER == null }">
						<div class="text-center">
							<img class="sg-profile-img" src="<c:url value='/resources/img/'/>icon.png" width="165px" height="165px">
						</div>
						<div class="col-xs-12 text-center" style="margin-top: 20px;">
							<a style="font-size: 25px; font-weight: bold" href="#">손님</a>
							 <span style="position: absolute; margin-top: 10px;"></span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="text-center">
							<img class="sg-profile-img" src="<c:url value='/resources/img/'/>icon.png" width="165px" height="165px">
						</div>
						<div class="col-xs-12 text-center" style="margin-top: 20px;">
							<a style="font-size: 25px; font-weight: bold" href="#">${LOGIN_USER.name }</a>
							 <span style="position: absolute; margin-top: 10px;">(${LOGIN_USER.id })</span>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="text-center btn-close-header"
			style="opacity: 0.3; background-color: grey; cursor: pointer;">
			<i class="fas fa-caret-up sg-size-lg sg-text-white"></i>
		</div>
	</div>


	<div class="sg-modal-fade">
		<div class="sg-modal-box">
			<div class="sg-modal-login">
				<div class="col-md-8">
					<h1 class="text-center sg-text-alert">어서오세요!</h1>
					<form id="form-login" action="/user/login.do" method="post">
						<label for="id">아이디</label> <input type="text" name="id"
							autocomplete="off" id="input-login-id"> <label
							for="password">비밀번호</label> <input type="password"
							name="password" id="input-login-pwd">
						<button class="sg-btn sg-btn-primary"
							style="display: block; width: 100%; margin-top: 30px;">로그인</button>
					</form>
					<a href="#">아이디/비밀번호 찾기</a> <a href="/user/signup.do">회원가입</a>
				</div>
				<div class="col-md-4" style="padding-top: 60px; height: 100%;">
					<button type="button" name="button" class="btn btn-lg"
						style="display: block; width: 100%; margin-top: 30px;">샘플</button>
					<button type="button" name="button" class="btn btn-lg"
						style="display: block; width: 100%; margin-top: 30px;">샘플</button>
					<button type="button" name="button" class="btn btn-lg"
						style="display: block; width: 100%; margin-top: 30px;">샘플</button>
				</div>
			</div>
		</div>
	</div>

	<script>

		var reqListener = '${param.fail}' || "";
		if(reqListener != ""){
			 $(".sg-modal-box").animate({left:"24%"},70);
			 $(".sg-modal-box").animate({left:"26%"},70);
			 $(".sg-modal-box").animate({left:"24%"},70);
			 $(".sg-modal-box").animate({left:"26%"},70);
			 $(".sg-modal-box").animate({left:"25%"},70);
		
		if (reqListener == "login") {
			$(".sg-modal-fade").show();
			$(".sg-text-alert").text("아이디 혹은 비밀번호가 일치하지 않습니다.");
		} else if (reqListener == "auth") {
			$(".sg-modal-fade").show();
			$(".sg-text-alert").text("이메일 인증을 받으신 후 로그인 해주세요!");
		}
		}
		
		$(".sg-modal-box").on("mouseenter", function() {
			$(this).addClass("in");
		})
		$(".sg-modal-box").on("mouseleave", function() {
			$(this).removeClass("in");
		})
		$(".sg-modal-fade").on("click", function() {
			if (!$(".sg-modal-box").hasClass("in")) {
				$(this).fadeOut();
			}
		})
		$(".login-in").click(function() {
			$(".sg-modal-fade").fadeIn();
		});

		$("#form-login").submit(function(event) {
			event.preventdefault();
			var userId = $("#input-login-id");
			var userPwd = $("#input-login-pwd");

			if ("" == userId.val()) {
				$(".sg-text-alert").text("아이디를 입력하세요!");
				return;
			}

			if ("" == userPwd.val()) {
				$(".sg-text-alert").text("비밀번호를 입력하세요!");
				return;
			}
			$.ajax({
				type : "post",
				url : "/user/login.do",
				dataType : "json",
				data : {
					id : userId.val(),
					password : userPwd.val()
				},
				success : function(result) {
					console.log(result);
					$(".sg-text-alert").text(result);
				}
			})
		})
	</script>
	<!--유저 헤더 끝~~-->