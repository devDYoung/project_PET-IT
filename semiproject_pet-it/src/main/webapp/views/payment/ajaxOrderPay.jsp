<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.pet.payment.model.dto.OrderDetail, 
				com.pet.cart.model.dto.Cart, 
				java.util.List, 
				java.util.ArrayList,com.pet.member.dto.Member" 
%>

<% 
		List<OrderDetail> ol = (List<OrderDetail>)request.getAttribute("orderList"); 
		Member loginMember=(Member)session.getAttribute("loginMember");
		int totalPrice=0;
%>

<%-- <!-- header -->
<%@ include file="/views/header.jsp"%> --%>
<!-- bootstrap -->



<div id="content-container">
	<section id="header-section">
		<div id="title-container">
			<div id="title-text">
				<h1><b> 주문 /결제 페이지 </b></h1>
			</div>
		</div>
	</section>
	
	<section id="body-section">
	
	<!-- -----------------주문자정보 입력폼 start--------------- -->
		<form action="#" id="formData">
			
			<div class="accordion" id="accordion-container">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingOne">
			      <button class="accordion-button " type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			        <div class="btn-text"><b>배송지 입력</b></div>
			      </button>
			    </h2>
			    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne">
			      
			      <div class="accordion-body">
		      		<table id="addr-form">
			      		<tr>
				      		<td style="font-size:1.15rem; text-align:center;">받는 사람 <strong>*</strong></td>
				      		<td>
					      		<div class="input-group input-group col-lg-3">
								  <input type="text" id="orderName" class="form-control" placeholder="받는 사람" value="">
								</div>
							</td>
						</tr>
						<tr style="height:10px"></tr>
						<tr rowspan=3>
							<td style="font-size:1.15rem; text-align:center; width:20%">주소 <strong>*</strong></td>
							<td>	
								<div class="input-group input-group col-lg-5">
								  <input id="zipcode" name="orderZipcode" type="text" class="form-control" placeholder="우편 번호" value="">
								  <input id="addrBtn" class="btn btn-outline-success optional" type="button" onclick="addrBtnAction()" value="주소 검색">
								</div>
							
			      				<div class="input-group input-group col-lg-10">
								  <input id="addr" id="orderAddr" type="text" class="form-control" placeholder="기본 주소" value="">
								</div>
			      			
			      				<div class="input-group input-group col-lg-10">
								  <input id="detailAddr" name="orderDefAddr" type="text" class="form-control" placeholder="상세 주소" value="">
								  <input id="extraAddr" type="text" class="form-control optional" placeholder="참조 주소">
								</div>
			      			</td>
						</tr>
						<tr style="height:10px"></tr>
			      		<tr>
			      			<td style="font-size:1.15rem; text-align:center;">휴대 전화 <strong>*</strong></td>
			      			<td>
			      				<div class="input-group input-group col-lg-7">
								  <input type="text" id="orderPhone" class="form-control" placeholder="휴대번화 번호 '-'제외하고 입력" value="">
								</div>
			      			</td>
			      		</tr>
			      		<tr style="height:10px"></tr>
			      		<tr>
			      			<td style="font-size:1.15rem; text-align:center;">이메일 <strong>*</strong></td>
			      			<td>
			      				<div class="input-group col-lg-9">
		   						    <input type="text" class="form-control" id="emailHead" placeholder="이메일" aria-label="Username">
								  	<span class="input-group-text">@</span>
								  	<input type="text" class="form-control" name="emailTail" id="textEmail" placeholder="이메일 선택">
									<select class="form-select" id="selectEmail">
									  	 <option disabled selected>이메일 선택</option>
									 	 <option value="naver.com" id="naver.com">naver.com</option>
										 <option value="hanmail.net" id="hanmail.net">hanmail.net</option>
										 <option value="hotmail.com" id="hotmail.com">hotmail.com</option>
										 <option value="nate.com" id="nate.com">nate.com</option>
										 <option value="gmail.com" id="gmail.com">gmail.com</option>
										 <option value="directly" id="textEmail">직접 입력하기</option>
									</select>	 
								</div>
			      			</td>
			      		</tr>
			      		<tr style="height:10px"></tr>
			      		<tr>
			      			<td style="font-size:1.15rem; text-align:center;">배송요청사항</td>
			      			<td>
			      				<div class="input-group input-group col-lg-10">
			      					<input type="text" class="form-control optional" name="textDelivery" id="textDelivery" placeholder="배송요청사항 선택">
				      				<select class="form-select" id="selectAddr">
									  	 <option disabled selected>배송요청사항 선택</option>
									 	 <option value="문앞에 놔주세요">문앞에 놔주세요</option>
										 <option value="경비실에 보관해주세요">경비실에 보관해주세요</option>
										 <option value="배송 전 연락바랍니다">배송 전 연락바랍니다</option>
										 <option value="directly" id="textDelivery">직접 입력하기</option>
									</select>	 
								</div>
			      			</td>
			      		</tr>
					</table>
					<br>
					<div style="text-align:right; width:90%"><p>*항목은 필수 입력사항입니다.</p></div>        
			      </div>
			    </div>
			  </div>
		  
		<!-- -----------------주문자정보 입력폼 end--------------- -->
		
		<!-- ----------------상품정보 start -------------------- -->	  
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingTwo">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
			        <div class="btn-text"><b>주문 상품</b></div>
			      </button>
			    </h2>
			    <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo">
			      <div class="accordion-body" id="productAll">
			      	
			      <%if(!ol.isEmpty()){ %>
			      		<%for(OrderDetail odl : ol){ totalPrice+=(odl.getDetailPrice()*odl.getDetailCount());%>
			       		
			       		<div class="productDiv" id="productDiv">
					       <div style="width:15%; text-align:center">
					       		<img src="<%=request.getContextPath()%>/upload/<%=odl.getProductImg()%>" width="120px" height="120px">
					       </div>
					       <div style="width:70%">
					       		<ul id="product-info">
						       		<li id='productName' style="font-size:1.1rem; font-weight:bolder"><%=odl.getProductName() %></li>
						       		<%-- <li><p><span>옵션명 : &nbsp</span><span><%=odl.getProductOption() %></span></p></li> --%>
								    <li><p><span>상품 가격 : &nbsp</span><span class="price"><%=odl.getDetailPrice()%></span>원<p></li>
						       		<li><p><span>상품수량 : &nbsp</span><span><%=odl.getDetailCount()%></span><span>개</span></p></li>
						       		<li><p><span>합계 가격 : &nbsp</span><span id="totalPrice"><%=(odl.getDetailPrice()*odl.getDetailCount()) %></span>원</p></li>
					       		</ul>
					       </div>
					       <div style="width:15%; text-align:center">
					       		<a href="#" id="deleteProduct"><img alt="" src="<%=request.getContextPath()%>/img/x-button.png" width="30px" height="30px"></a>
					       </div>
				       </div>
				       <p></p>
	       				<%} %>	
			       <%} %>
			      </div>
			    </div>
			  </div>
		<!-- ----------------상품정보 end -------------------- -->
		
		<!-- ----------------쿠폰/적립금 start -------------------- -->
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingThree">
			      <button class="accordion-button collapsed " type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
			        <div class="btn-text"><b>할인 / 부가결제</b></div>
			      </button>
			    </h2>
			    <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree">
			      <div class="accordion-body">
			      	<div class="couponDiv">
				         <div class="couponTitle"style="width:20%; text-align:center;">
				       		<span style="font-size:1.1rem"><b>쿠폰 할인</b></span>
				      	 </div>
				      	 <div style="width:85%;" class="input-group mb-3">
						 	<select class="form-select form-select" name="couponValue" aria-label=".form-select-sm example">
							  <option selected>쿠폰을 선택하세요</option>
							  <option value="1">One</option>
							  <option value="2">Two</option>
							  <option value="3">Three</option>
							</select>
						 </div>
				    	<div style="width:5%; text-align:left;"></div>
			      	</div>
			      	<div class="discountDiv">
				         <div style="width:20%; text-align:center;">
				       		<span style="font-size:1.1rem;"><b>적립금 적용</b></span>
				      	 </div>
				      	 <div style="width:85%;" class="input-group mb-3">
						 	<input type="text" class="form-control optional" name="pointUse" placeholder="사용금액 입력">
						 	<button class="btn btn-outline-success" id="pointBtn" type="button">적립금 사용</button>
						 </div>
				      	 <div style="width:5%; text-align:left"></div>
			      	</div> 
			      	<div class="discountDiv">
				         <div style="width:20%; text-align:left;">
				      	 </div>
				      	 <div style="width:85%; text-align:right">
						 	<p>적립금은 2000원 이상부터 적용가능<p>
						 </div>
				      	 <div style="width:5%; text-align:left">
				      	 </div> 
			      	</div>
			    </div>
			  </div>
		  <!-- ----------------쿠폰/적립금 end -------------------- -->
			  
		<!-- ----------------total price start -------------------- -->
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingFour">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
			        <div class="btn-text"><b>결제 정보</b></div>
			      </button>
			    </h2>
			    <div id="collapseFour" class="accordion-collapse collapse show" aria-labelledby="headingFour">
			      <div class="accordion-body">
			        <table style="width:95%">
			        	<tr>
				        	<td style="width:5%"></td>
				        	<td style="width:70%"><p><b>총 상품 금액</b></p></td>
				        	<td style="width:15%; text-align:right"><p><span id="allProductPrice"><%=totalPrice%></span>원</p></td>
				        </tr>
				        <tr>
				        	<td style="width:5%"></td>
				        	<td style="width:70%"><p><b>배송비</b></p></td>
				        	<td style="width:15%; text-align:right"><p><span id="delivery-cost">2500</span>원</p></td>
				        </tr>
				      	<tr>
				        	<td style="width:5%"></td>
				        	<td style="width:70%"><p><b>적립금/쿠폰적용</b></p></td>
				        	<td style="width:15%; text-align:right"><p><span id="discountPrice">0</span>원</p></td>
				        </tr>
				        </tr>
			        </table>
			      </div>
			      <div style="background-color:lightgray; height:50px; item-aligns:center; display:flex;">
			      	<div style="margin-left:60px; width:70%">
			      		<span style="line-height:50px; vertical-align:middle; font-size:1.3rem"><b>최종결제금액</b></span>
			      	</div>
			      	<div style="width:20%; text-align:center;">
			      		<input type="hidden" name="finalPrice" value="">
			      		<p style="line-height:50px; vertical-align:middle; font-size:1.3rem; font-weight:bolder"><span id="allPayCost"></span><%=totalPrice+2500%><span>원</span></p>
			      	</div>
			      </div>
			    </div>
			  </div>
		  <!-- ----------------total price end -------------------- -->
		  
		  <!-- ----------------payment choice start -------------------- -->
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingFive">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="true" aria-controls="collapseFive">
			        <div class="btn-text"><b>결제방법 선택</b></div>
			      </button>
			    </h2>
			    <div id="collapseFive" class="accordion-collapse collapse show" aria-labelledby="headingFive">
			      <div class="accordion-body">
				      	<div style="margin-left:50px; margin-right:50px;">
			        		<div class="form-check">
							  <input class="form-check-input" name="payment-btn" type="radio" id="card-payment" value="card" checked>
							  <label class="form-check-label" for="card-payment">
							    <img alt="" src="<%=request.getContextPath()%>/img/card_payment.png">&nbsp&nbsp신용카드 결제
							  </label>
							</div>
							<p></p>
							<div class="form-check">
							  <input class="form-check-input" name="payment-btn" type="radio" id="kakaopay" value="kakaopay">
							  <label class="form-check-label" for="kakaopay">
							    <img alt="" src="<%=request.getContextPath()%>/img/KakaoPay_badge.png" width="60px" height="25px">&nbsp&nbsp카카오페이
							  </label>
							</div>
						</div>
			        </div>  		        
			      </div>
			    </div>
			<!-- ----------------payment choice end -------------------- -->
			
			<!-- ----------------point start -------------------- -->        
				    <!-- <div class="accordion-item">
					    <h2 class="accordion-header" id="headingSix">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
					        <div class="btn-text"><b>적립혜택</b></div>
					      </button>
					    </h2>
					    <div id="collapseSix" class="accordion-collapse collapse show" aria-labelledby="headingSix">
					      <div class="accordion-body">
				      		<div style="background-color:lightgray; height:50px; item-aligns:center; display:flex;">
						      	<div style="margin-left:30px; width:70%">
						      		<span style="line-height:50px; vertical-align:middle; font-size:1.0rem">회원적립혜택</span>
						      	</div>
						      	<div style="margin-right:60px; width:30%; text-align:center;">
						      		<span style="line-height:50px; vertical-align:middle; font-size:1.0rem">0000원 예정</span>
						      	</div>
						      </div>
				          </div>  		        
				      	</div>
			    	</div> -->
				</form>
	    	<!-- ----------------point end -------------------- -->
	    	
			      <br>
			      	<div class="d-grid gap-2">
					  <input id="paymentBtn" class="btn btn-primary btn-lg btn-success" type="button" value="결제하기">
					</div>
			  </div>
			</div>

	</section>

</div>


<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<!-- PortOne SDK -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- Sweet alert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- daum address api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/orderPay/orderPay.css"/>

<!-- ----------결제하기 버튼 클릭 js----------------- -->
<script>

// 결제정보관련 변수 설정
let id="<%=loginMember.getMemberId()%>"
let pg="";
let pay_method = "";
let product_name="";
let amount= "";
let addr="";
let email="";
let buyer_name="";
let tell="";
let postcode ="";
let productImg = "";
let orderNo = createOrderNum();

let order ={};		//주문 객체
let orderDetail = {};  //주문 상세 객체
let orderArr =[]; 	//주문상세 객체 배열
<%for(OrderDetail odl : ol){ %>
	orderDetail ={};
	orderDetail.orderNo = Number(orderNo);
	orderDetail.productNo = "<%=odl.getProductNo()%>";
	orderDetail.productName = "<%=odl.getProductName()%>";
	orderDetail.productOption = "<%=odl.getProductOption()%>";
	orderDetail.detailPrice = <%=odl.getDetailPrice()%>;
	orderDetail.detailCount = <%=odl.getDetailCount()%>;
	orderDetail.productImg = "<%=request.getContextPath()%>/upload/<%=odl.getProductImg()%>";
orderArr.push(orderDetail);
<%}%>
console.log(orderArr)

//결제 버튼 클릭 이벤트
$("#paymentBtn").on("click",function(e){
	//변수값 세팅 (결제api에 들어갈 data값)
	amount = <%=totalPrice%>+2500;
	console.log(amount);
	email = $("#emailHead").val()+"@"+$("#textEmail").val();
	buyer_name = $("#orderName").val();
	tell = $("#orderPhone").val();
	addr = $("#addr").val()+", "+$("#detailAddr").val();
	postcode = $("#zipcode").val();
	
	//주문 객체 생성
	order.orderNo = Number(orderNo);
	order.orderId = id;
	order.orderName = buyer_name;
	order.orderZipcode = postcode;
	order.orderAddr = $("#addr").val();
	order.orderDefAddr= $("#detailAddr").val();
	order.orderPhone = tell;
	order.orderEmail = email;
	order.orderTotalPrice = amount;
	order.deliveryReq = $("#textDelivery").val();
	
	<%if(ol.size()>1){%>
		product_name = "<%=ol.get(0).getProductName()%>"+" 등 "+"<%=ol.size()%>"+"개 상품";
	<%}else{%>
		product_name = "<%=ol.get(0).getProductName()%>"
	<%}%>
	//주문 상세 객체배열 생성
	

	
	//필수입력항목 체크
	var isEmpty = false;
    $("input[type=text]").not(".optional").each(function() {
        if (!$(this).val()) {
            e.preventDefault();
            alert("필수입력 항목을 입력하세요!");
        	var that = this;
            setTimeout(function() {
                $(that).focus();
            }, 1);
            
            isEmpty = true;
            return false; // 루프 중단
        }
    });

    if(isEmpty) {
        return; // 빈 필드가 있다면 여기서 함수 종료
    }

    // 빈 필드가 없다면 결제 방식 선택
    if($("#card-payment").is(":checked")){
        pg = "kcp.AO09C";
        pay_method = "Card";
    } else {
        pg = "kakaopay.TC0ONETIME";
        pay_method = "KakaoPay"
    }
    payment_api();

});

//결제 api function
function payment_api(){
	var IMP = window.IMP;
	IMP.init("imp58177585");
	IMP.request_pay({							//결제창 호출 함수 IMP.request_pat({});
		pg : pg,								//결제사명.PG상점아이디
		pay_method : pay_method,				//지불방법
		merchant_uid: orderNo,  				//주문번호가 들어가야함.
		name : product_name,					//결제창에 노출될 상품명
		amount:	amount,							//결제 금액
		buyer_email : email, 					//주문자 email
		buyer_name : buyer_name, 				//주문자 이름
		buyer_tel : tell,						//주문자 전화번호
		buyer_addr : addr, 						//주문자 주소
		buyer_postcode : postcode,				//주문자 우편번호
	}, function(rsp){							//callback함수
		if(rsp.success){
			
			$.ajax({
				url : "<%=request.getContextPath()%>/payment.do",
				type : "POST",
				dataType : "json",
				data : {
					imp_uid : rsp.imp_uid,
                    merchant_uid : rsp.merchant_uid,
                    name : rsp.name,
                    paid_amount : rsp.paid_amount,
                    apply_num : rsp.apply_num,
                    pay_method : rsp.pay_method,
                    paid_at : rsp.paid_at,
                    order : JSON.stringify(order),				   	//주문 객체 보내기
                    orderDetail : JSON.stringify(orderDetail),		//주문 상세 객체 보내기
                    orderArr : JSON.stringify(orderArr)				//주문 상세 객체배열 보내기
                }
			}).done(function(data){
					Swal.fire({
				  		title: "결제 성공!",
				  		text: "잠시 후 결제완료페이지로 이동합니다",
				  		icon: "success"
					});
					console.log(data);
				    window.location.replace("<%=request.getContextPath()%>/paymentEnd.do");
					
			}).fail(function(data){
					Swal.fire({
				  		title: "결제 실패",
				  		text: "다시 시도하거나 관리자에게 문의하세요😢",
				  		icon: "error"
					});
			});
			
		}else{
			Swal.fire({
		  		title: "결제 실패",
		  		text: "😢"+rsp.error_msg,
		  		icon: "error"
			});
		}
	});
}
</script>
<script>

//회원정보 반영 모달창 jquery
	function runModal() {
		Swal.fire({
		  title: "회원정보 적용",
		  text: "기존에 등록된 회원정보를 그대로 적용할까요?",
		  icon: "question",
		  showCancelButton: true,
		  confirmButtonColor: "#3085d6",
		  cancelButtonColor: "#d33",
		  confirmButtonText: "Yes"
		}).then((result) => {
		  if (result.isConfirmed) {
			    Swal.fire({
			      title: "회원정보 적용!",
			      text: "기존 등록정보로 적용했어요!😊",
			      icon: "success"
			    });
			    
			    // input태그에 session에서 가져온 회원정보 반영
			    $("#orderName").val("<%=loginMember.getMemberName()%>");
			    $("#zipcode").val("<%=loginMember.getMemberZipCode()%>");
			    $("#addr").val("<%=loginMember.getMemberAddr()%>");
			    $("#detailAddr").val("<%=loginMember.getMemberDetailAddr()%>"); 
			    $("#orderPhone").val("<%=loginMember.getMemberPhone()%>"); 
			     
			 	// email parsing입력
			    var email = "<%=loginMember.getMemberEmail()%>";		      
			    var index = email.indexOf("@");
			    
			    if (index !== -1) {
				    var beforeText = email.substring(0, index);
				    var afterText = email.substring(index + 1);
				    
				    $("#emailHead").val(beforeText);
				    $("#textEmail").val(afterText);
			    }
		  	}
		});	
	};
	
	//배송요청 select에 따른 값 변화주기 jquery
    $(function() {
        $('#selectAddr').change(function() {
            if ($('#selectAddr').val() == 'directly') {
                $('#textDelivery').attr("disabled", false);
                $('#textDelivery').val("");
                $('#textDelivery').focus();
            } else {
                $('#textDelivery').val($('#selectAddr').val());
            }
        })
    }); 


//email select에 따른 값 변화주기 jquery
    $(function() {
        $('#selectEmail').change(function() {
            if ($('#selectEmail').val() == 'directly') {
                $('#textEmail').attr("disabled", false);
                $('#textEmail').val("");
                $('#textEmail').focus();
            } else {
                $('#textEmail').val($('#selectEmail').val());
            }
        })
    });

 // 주문번호 생성 함수
    function createOrderNum() {
        const date = new Date();
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, "0");
        const day = String(date.getDate()).padStart(2, "0");
     
        let orderNum = year + month + day;
        for (let i = 0; i < 5; i++) {
            orderNum += Math.floor(Math.random() * 8);
        }
        return parseInt(orderNum);
    }
    	


    //주문상품 삭제버튼 jquery
    	$(function(){
    		$('#deleteProduct').click(function(){
    			$("#productDiv").hide();
    			$("#productName").attr("disabled",true);
    			$("#productCount").attr("disabled",true);
    			$("#productPrice").attr("disabled",true);
    		});	
    		
    	});



    //주문상품이 모두 삭제되면 화면 전환 jquery -> 보류

    /*	$("div#productAll > div#productDiv").each(function(){
    		if($(this).is(':hidden')){
    			var hiddenDivs = $(this).parent().children('div:hidden').length;
    			var totalDivs = $(this).parent().children('div').length;
    			if(hiddenDivs == totalDivs){
    				alert('주문상품이 모두 삭제되어 장바구니로 돌아갑니다');
    				window.location.href="<%=request.getContextPath()%>/cart/cartList.jsp"
    			}
    		}
    	});*/


    //주소입력창 daum지도주소 api 적용 js

        function addrBtnAction() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("extraAddr").value = extraAddr;
                    
                    } else {
                        document.getElementById("extraAddr").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById("zipcode").value = data.zonecode;
                    document.getElementById("addr").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("detailAddr").focus();
                }
            }).open();
        }
</script>
	