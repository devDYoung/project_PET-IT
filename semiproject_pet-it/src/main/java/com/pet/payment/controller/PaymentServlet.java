package com.pet.payment.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.payment.model.dto.Order;
import com.pet.payment.model.dto.Payment;
import com.pet.payment.service.PaymentService;

/**
 * Servlet implementation class PaymentDemo
 */
@WebServlet("/payment.do")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String imp_uid = request.getParameter("imp_uid");
	    int merchant_uid = Integer.parseInt(request.getParameter("merchant_uid"));
	    int paid_amount = Integer.parseInt(request.getParameter("paid_amount"));
	    int apply_num = Integer.parseInt(request.getParameter("apply_num"));
	    String pay_method = request.getParameter("pay_method");
	    
	    String orderName = request.getParameter("orderName");
	    String orderZipcode = request.getParameter("orderZipCode");
	    String orderAddr = request.getParameter("orderAddr");
	    String orderDefAddr = request.getParameter("orderDefAddr");
	    String orderPhone = request.getParameter("orderPhone");
	    String orderEmail = request.getParameter("emailHead")+"@"+request.getParameter("emailTail");
	    int orderTotalPrice = Integer.parseInt(request.getParameter("productTotalPrice"));
	    String textDelivery = request.getParameter("textDelivery");
	    
	    Payment p = Payment.builder()
	    		.imp_uid(imp_uid)
	    		.merchant_uid(merchant_uid)
	    		.paid_amount(paid_amount)
	    		.apply_num(apply_num)
	    		.pay_method(pay_method)
	    		.build();
	    
	    Order o = Order.builder()
	    		.orderName(orderName)
	    		.orderZipcode(orderZipcode)
	    		.orderAddr(orderAddr)
	    		.orderDefAddr(orderDefAddr)
	    		.orderPhone(orderPhone)
	    		.orderEmail(orderEmail)
	    		.orderTotalPrice(orderTotalPrice)
	    		.textDelivery(textDelivery)
	    		.build();
	    
	    int result = new PaymentService().insertPaymentResult(p,o);
	    
	    if(result>0) System.out.println("DB저장 성공");
	    else System.out.println("DB저장 실패");
	    
	    
	    System.out.println(p);
	    System.out.println(o);
	    
	    request.setAttribute("payment", p);
	    request.setAttribute("order", o);
	    request.getRequestDispatcher("/views/payment/orderPayComplete.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
