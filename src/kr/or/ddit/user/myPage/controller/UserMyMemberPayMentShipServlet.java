package kr.or.ddit.user.myPage.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.user.login.vo.LoginVO;
import kr.or.ddit.user.myPage.dao.UserMyMemberShipDaoImpl;
import kr.or.ddit.user.myPage.service.IUserMyMemberShipService;
import kr.or.ddit.user.myPage.service.UserMyMemberShipServiceImpl;
import kr.or.ddit.user.myPage.vo.MemberShipVO;
import kr.or.ddit.user.viewHistory.vo.ViewHistoryVO;

@WebServlet("/user/myPage/myMemberShip1.do")
public class UserMyMemberPayMentShipServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// ajax로 부터 받아온 parameter 저장
		String users_id = request.getParameter("users_id");
		String mmbrs_rating = request.getParameter("mmbrs_rating");
		String mmbrs_price = request.getParameter("mmbrs_price");

		// service객체 생성
		IUserMyMemberShipService service = UserMyMemberShipServiceImpl.getInstance();

		// VO에 값 넣어주
		MemberShipVO mv = new MemberShipVO();
		mv.setUsers_id(users_id);
		mv.setMmbrs_rating(mmbrs_rating);
		mv.setMmbrs_price(mmbrs_price);
		
		String id = service.getMemberId(mmbrs_rating);
		mv.setMmbrs_id(id);
		
				
		int cnt = service.insertMemberPayMent(mv);
		System.out.println("asd");

		String msg = "";
		if (cnt > 0) {
			msg = "성공";
			
		} else {
			msg = "실패";
			String redirectUrl = request.getContextPath() + "/user/myPage/myMemberShip.do?msg=" + URLEncoder.encode(msg, "UTF-8");
			response.sendRedirect(redirectUrl);   // 목록 조회 화면으로 리다이렉트
		}

		cnt = service.updateUserMemberShip(mv);
		msg = "";
		if (cnt > 0) {
			msg = "성공";
			String redirectUrl = request.getContextPath() + "/user/myPage/myMemberShip.do?msg=" + URLEncoder.encode(msg, "UTF-8");
			response.sendRedirect(redirectUrl);   // 목록 조회 화면으로 리다이렉트
		} else {
			msg = "실패";
			String redirectUrl = request.getContextPath() + "/user/myPage/myMemberShip.do?msg=" + URLEncoder.encode(msg, "UTF-8");
			response.sendRedirect(redirectUrl);   // 목록 조회 화면으로 리다이렉트
		}


	}

	
}
