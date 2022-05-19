package kr.or.ddit.user.myPage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.user.login.vo.LoginVO;
import kr.or.ddit.user.myPage.service.IUserMyPageService;
import kr.or.ddit.user.myPage.service.IUserWithDrawalService;
import kr.or.ddit.user.myPage.service.UserMyPageServiceImpl;
import kr.or.ddit.user.myPage.service.UserWithDrawalServiceImpl;

@WebServlet("/user/myPage/withdrawal.do")
public class UserWithDrawalServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		// 1. 파라미터정보 가져오기
		LoginVO usersid = (LoginVO) session.getAttribute("loginChk");
		
		// 2. 서비스 객체 가져오기
		IUserMyPageService myPageService = UserMyPageServiceImpl.getInstance();
		
		// 3. 회원 정보 조회
		LoginVO lv = myPageService.getUser(usersid.getUsers_id());
	
		
		request.setAttribute("lv", lv);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/user/myPage/withdrawal.jsp");
		dispatcher.forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		LoginVO usersVo = (LoginVO) session.getAttribute("loginChk");
		String users_id = usersVo.getUsers_id();
		
		// 요청 파라미터 가져오기
		String users_pw = request.getParameter("users_pw");
		
		IUserWithDrawalService service = UserWithDrawalServiceImpl.getInstance();
		
		LoginVO lv = new LoginVO();
		lv.setUsers_id(users_id);
		lv.setUsers_pw(users_pw);
		
		int cnt = service.deleteUser(lv);
				
		String msg = "";
		if(cnt >0) {
			msg="탈퇴성공";
			String redirectUrl = request.getContextPath() + "/user/login/login.do?msg=" + URLEncoder.encode(msg, "UTF-8");
			response.sendRedirect(redirectUrl);   // 목록 조회 화면으로 리다이렉트
			
		}else {
			msg="실패";
			String redirectUrl = request.getContextPath() + "/user/myPage/withdrawal.do?msg=" + URLEncoder.encode(msg, "UTF-8");
			response.sendRedirect(redirectUrl);   // 목록 조회 화면으로 리다이렉트
		}
		
		
	}

}
