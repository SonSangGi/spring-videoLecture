<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/style.jsp" %>
<link rel="stylesheet" href='<c:url value="/resources/css/user/my.css"/>'>
</head>
<body>
<%@include file="/WEB-INF/views/include/header.jsp"%>


<div class="container">
     
     <%@include file="/WEB-INF/views/user/my_header.jsp" %>
       <div class="user-info-body" style="margin-top:30px;padding-left:30px;">
            <div class="row info-container">
               <div class="col-xs-6">
                  <h3>내 정보</h3>
                  <div class="user-icon-box text-center">
				<a onclick="iconModify()" style="cursor:pointer;"><img class="sg-profile-img" src="<c:url value='/resources/img/user/icon/'/>${LOGIN_USER.avatar.image eq 'Default' ? 'icon.png' : LOGIN_USER.avatar.image}" style="float:left;width:100px;height:100px;"></a>
				<div style="background-color:white;padding:10px;width:150px;position:absolute;border:1px solid lightgray;bottom:-58px;left:-130px;display:none;background-color:white;" class="alert-profile">
				<a onclick="iconModify()">프로필 변경</a>
				<form action="/user/my/iconmodify.do" id="form-icon-modify" method="post"  enctype="multipart/form-data">
				<input type="file" style="display:none" class="icon-modify" name="file">
				</form>
				<c:if test="${LOGIN_USER.avatar.image != 'Default' }">
				<hr style="margin:3px;width:100%;">
				<a>프로필 삭제</a></c:if>
				</div>
               </div>
                  <dt>아이디</dt>
                  <dd>${LOGIN_USER.id }</dd>
                  <dt>이메일</dt>
                  <dd>${LOGIN_USER.email}</dd>
                  <dt>이름</dt>
                  <dd>${LOGIN_USER.name }</dd>
               </div>
            </div>
            <div class="row">

               <div class="col-xs-12 my-pay-item" style="border-top:1px solid lightgrey;margin-top:20px;">
                  <h3>결제 내역 <small>4개의 결제내역</small></h3><br>
                  <ul>
                     <li>
                        <img src="img/java.jpg" alt="" style="width:100px;height: 100px;border-radius:100px;float:left;border:1px solid lightgray;padding:5px;"/>
                        <div class="pay-info" style="margin-left:150px;">
                           <span style="font-size:17px;">자바를 자바</span><br>
                           <span>결제금액: 15,000원</span><br>
                           <span>결제방식: 카드결제<small>(삼성카드)</small></span>
                        </div>
                     </li>
                     <li>
                        <img src="img/spring.png" alt="" style="width:100px;border-radius:100px;float:left;border:1px solid lightgray;padding:5px;"/>
                        <div class="pay-info" style="margin-left:150px;">
                           <span style="font-size:17px;">스프링으로 부트!</span><br>
                           <span>결제금액: 15,000원</span><br>
                           <span>결제방식: 카드결제<small>(삼성카드)</small></span>
                        </div>
                     </li>
                     <li>
                        <img src="img/spring.png" alt="" style="width:100px;border-radius:100px;float:left;border:1px solid lightgray;padding:5px;"/>
                        <div class="pay-info" style="margin-left:150px;">
                           <span style="font-size:17px;">스프링으로 부트!</span><br>
                           <span>결제금액: 15,000원</span><br>
                           <span>결제방식: 카드결제<small>(삼성카드)</small></span>
                        </div>
                     </li>
                     <li>
                        <img src="img/spring.png" alt="" style="width:100px;border-radius:100px;float:left;border:1px solid lightgray;padding:5px;"/>
                        <div class="pay-info" style="margin-left:150px;">
                           <span style="font-size:17px;">스프링으로 부트!</span><br>
                           <span>결제금액: 15,000원</span><br>
                           <span>결제방식: 카드결제<small>(삼성카드)</small></span>
                        </div>
                     </li>
                  </ul>
               </div>

            </div>
         </div>
      </div>
         
      <script>
      $(".sg-profile-img,.alert-profile").mouseover(function(){
    	  $(".alert-profile").show();
      });

      $(".sg-profile-img,.alert-profile").mouseout(function(){
    	  $(".alert-profile").hide();
      });
      function iconModify(){
    	  $(".icon-modify").click();
      };
      $(".icon-modify").on("change",function(){
    	  var formData = new FormData($("#form-icon-modify")[0]);
    	  $.ajax({
    		  url:"/user/my/iconmodify.do",
    		  type:"post",
    		  data: formData,
    		  processData:false,
    		  contentType:false,
    		  success:function(result){
    			  console.log("업로드 되었습니다.");
    			  $(".sg-profile-img").attr("src","<c:url value='/resources/img/user/icon/'/>"+result);
    		  },
    		  error:function(err){
    			  console.log("에러")
    			  console.log(err);
    		  }
    	  })
      })
      </script>
<%@include file="/WEB-INF/views/include/footer.jsp"%></body>
</html>