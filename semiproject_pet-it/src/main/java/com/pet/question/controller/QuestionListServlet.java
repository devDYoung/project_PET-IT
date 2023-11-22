package com.pet.question.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.member.dto.Member;
import com.pet.question.model.dto.Question;
import com.pet.question.service.QuestionService;

/**
 * Servlet implementation class questionListServlet
 */
@WebServlet("/questionList.do")
public class QuestionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 //DB에서 전체 게시글 가져오기 
		int cPage,numPerpage=10;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch (NumberFormatException e) {
			cPage=1;
		}
		Member loginMember=(Member)request.getSession().getAttribute("loginMember");
		List<Question> question = null;
		if(loginMember !=null) {
			if(loginMember.getMemberId().equals("petitad")) {
				question = new QuestionService().selectQuestion(cPage, numPerpage);
			}else {
			question = new QuestionService().selectQuestion(cPage, numPerpage, loginMember.getMemberId());
			}
			int totalData=new QuestionService().selectQuestionCount();
			int totalPage=(int)Math.ceil((double)totalData/numPerpage);
			int pageBarSize=5;
			int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1; 
			int pageEnd=pageNo+pageBarSize-1; 
			
			
			StringBuffer pageBar=new StringBuffer(); 
			
			if(pageNo==1) {
				pageBar.append("<span>[이전]</span>"); 
				
			}else {
				pageBar.append("<a href='"+request.getRequestURI()+"?cPage="+(pageNo-1)+"'>");
				pageBar.append("[이전]</a>"); 
			}
			
			while(!(pageNo>pageEnd||pageNo>totalPage)) {
				if(cPage==pageNo) {
					pageBar.append("<span>"+pageNo+"</span>"); 
				}else {
					pageBar.append("<a href='"+request.getRequestURI()+"?cPage="+pageNo+"'>");
					pageBar.append(pageNo);
					pageBar.append("</a>"); 
				}
				pageNo++;
			}
			
			if(pageNo>totalPage) {
				pageBar.append("<span>[다음]</span>"); 
			}else {
				pageBar.append("<a href='"+request.getRequestURI()+"?cPage="+pageNo+"'>");
				pageBar.append("[다음]");
				pageBar.append("</a>"); 
			}
			
			request.setAttribute("question", question); 
			request.setAttribute("pageBar", pageBar); 
			request.getRequestDispatcher("/views/question/questionList.jsp").forward(request, response); 
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
