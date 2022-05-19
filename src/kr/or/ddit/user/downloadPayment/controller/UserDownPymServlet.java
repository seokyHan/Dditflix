package kr.or.ddit.user.downloadPayment.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.user.downloadPayment.service.IUserDownloadPaymentService;
import kr.or.ddit.user.downloadPayment.service.UserDownloadPaymentServiceImpl;
import kr.or.ddit.user.downloadPayment.vo.UserDownloadPaymentVO;
import kr.or.ddit.user.login.vo.LoginVO;

@WebServlet("/user/myPage/DownPym.do")
public class UserDownPymServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		// 1. 파라미터정보 가져오기
		LoginVO usersid = (LoginVO) session.getAttribute("loginChk");
		
		String usersId = usersid.getUsers_id();
		
		IUserDownloadPaymentService service = UserDownloadPaymentServiceImpl.getInstance();
		
		List<UserDownloadPaymentVO> list = service.getUserDownloadPymList(usersId);
		
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/user/myPage/downloadPayment.jsp");
		dispatcher.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
