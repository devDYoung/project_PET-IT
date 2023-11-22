<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/views/header.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

	* {
	font-family: 'Noto Sans KR', sans-serif;
	}
	body {
    box-sizing: border-box;
    line-height:40px;
    	}
    .quote_btn-container{
		width:534.475px;
		height:80px;
	}
	.navbar {
		height:130px;
	}
    .footer_section{
    	height:130px;
    }	
    
    .findId{
    text-align:center;
  	width: 700px;
    border: 1px solid #000;
    margin: auto; /*중앙 정렬*/
    /* padding: 0 20px; */
/*     margin-bottom: 20px; */
    height:500px;
    }
/*     .findId .title{
    	border:1px solid;
    } */
    .title{
    	display:flex;
    	justify-content:space-evenly;
		list-style-position: outside;
		margin-bottom:50px;
		padding:0;
    }
    .title>li{
    	display:flex;
    	justify-content:center;
    	list-style-type:none;

    }
    .title>li,.title>li>a{
    	width:100%;
    	height:70px;
    	display: flex;
        align-items: center; /* 세로 중앙 정렬 추가 */
        justify-content: center;	
   }
   
   .title>li:first-child>a{
   		border-right:1px solid lightgray;
   }
   
   .findId{
   		border-color:lightgray;
   }
   
   .field input{
   		height: 30px;
   }
   
   .g-recaptcha{
   		display:flex;
   		justify-content:center;
   }
   .title{
   		border-bottom: 1px solid lightgray;
   }
   
   .field_name #memberName{
   		border-width: 1px 1px 0px 1px;
   }
   
   .field_email #memberEmail{
   		border-width: 1px 1px 1px 1px;
   }
   
   .field_info input{
   		width:460px;
   		height:60px;
   }
   
   .google_recaptcha {
   		width:460px;
   }
   
   .google_recaptcha>*{
   		width:100%;
/*    		display:flex; */
   }
   .id_btn{
   		width:460px;
   		height:60px;
   }
   
</style>

<div class="findId">
	<ul class="title">
		<li>
			<a href="<%=request.getContextPath()%>/find/id.do">아이디 찾기</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/find/pw.do">비밀번호 찾기</a	>
		</li>
	</ul>
	<form action="<%=request.getContextPath()%>/mail.do" method="get" onsubmit="">								
			<div class="field_info">
				<div class="field_name">	
					<span>
						<input type="text" placeholder="이름을 입력해주세요" name="memberName" id="memberName">
					</span>
				</div>
				<div class="field_email">
					<span>
						<input type="email" placeholder="이메일을 입력해주세요" name="memberEmail" id="memberEmail" >
					</span>
				</div>
			</div>
			<br><br>
			<div class="field">
				<p style="font-size: 14px">정보보호를위해 '로봇이 아닙니다.'를 눌러 진행해주세요</p>
			</div>  
			<div class="google_recaptcha">
				<div class="g-recaptcha" data-sitekey="6LfacRIpAAAAAMukAVLPDf5l4oaO-YWzOatMIywW"></div>
				<script src='https://www.google.com/recaptcha/api.js'></script>
			</div>
			<div>
  		  	<input type="submit" class="id_btn btn btn-outline-primary" id="mail" style="height:40px;" value="인증번호 받기">
			</div>
		</form>
</div>
<script>

<%-- $(document).ready(function() {
    $(".id_btn").click(function() {
    	var contextPath = "<%=request.getContextPath()%>";
    	
    	
    	$.ajax({
            url : "<%=request.getContextPath()%>/mail.do",
            type: "post",
            data: { emailCode: '<%= request.getSession().getAttribute("emailCode") %>'},
            success: function(data) {
                const html = '<div class="send_mail">' +
                    '<form action="<%=request.getContextPath()%>/mail.do" method="get">' +
                    '<span>이메일로 발송된 회원님의 인증번호를 입력해주세요.</span>' +
                    '<br>' +
                    '<input type="text" placeholder="인증번호" style="width:460px; height:50px; text-align:center;" name="memberEmail_code" id="memberEmail_code">' +
                    '<div class="idFindView"></div>' +
                    '<br><br>' +
                    '<button type="button" id="memberEmail_check" class="btn btn-outline-primary" style="width:460px; height:40px;">인증번호 확인</button>' +
                    '</form>' +
                    '</div>'
                $(".field_info").html(html);

                $("#memberEmail_check").click(function() {
                    const memberEmailCode = $('#memberEmail_code').val();
                    var emailCode = data.emailCode;
                    var memberId =	data.memberId;
                    console.log('발송코드:' + emailCode);
                    console.log('유저아이디:' + memberId);

                    if (memberEmailCode === emailCode) {
                        $(".send_mail").html('회원님의 아이디는<br>' + memberId + '입니다');
                    } else {
                        $(".send_mail").html('인증번호가 일치하지 않습니다');
                    }
                    $(".field_info").hide();
                    $(".idFind_view").show();
                })
            },
            error: function() {
                alert("에러가 발생했습니다");
            }
        })
      });
    }); --%>
</script>














<%@ include file ="/views/footer.jsp" %>