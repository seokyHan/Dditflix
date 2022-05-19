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

@WebServlet("/user/cart/userDwnldPymInsert.do")
public class UserDwnldPymInsertServlet extends HttpServlet {
	private IUserDownloadPaymentService userDwnldPymService;
	
	public UserDwnldPymInsertServlet() {
		if(userDwnldPymService==null) {
			userDwnldPymService = UserDownloadPaymentServiceImpl.getInstance();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		//세션에 저장된 카트 리스트를 불러온다.
		List<UserDownloadPaymentVO> cartList = (List<UserDownloadPaymentVO>) session.getAttribute("cartList");
		
		int result = userDwnldPymService.insertPaymentCart(cartList);
		
		//성공이면 카트 초기화
		if(result > 0) {			
			String cartNo = userDwnldPymService.getNewCartNo();
			session.setAttribute("cartList", new ArrayList<UserDownloadPaymentVO>());
			session.setAttribute("cartNo", cartNo);
		}
		resp.getWriter().print(result);
		
	}
}
