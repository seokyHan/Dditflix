package kr.or.ddit.user.downloadPayment.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.user.downloadPayment.service.IUserDownloadPaymentService;
import kr.or.ddit.user.downloadPayment.service.UserDownloadPaymentServiceImpl;
import kr.or.ddit.user.downloadPayment.vo.UserDownloadPaymentVO;


@WebServlet("/user/myPage/downloadCon.do")
public class UserDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IUserDownloadPaymentService service;
       
   
    public UserDownloadServlet() {
    	service = UserDownloadPaymentServiceImpl.getInstance();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// contitle get으로 받기
		String title = request.getParameter("title");
		String userId = request.getParameter("userId");
		String msg = "";
		
		UserDownloadPaymentVO vo = new UserDownloadPaymentVO();
		vo.setContTitle(title);
		vo.setUsersId(userId);
		
		String fileName = service.getViedoPath(vo).substring(7);
		
		
		if(fileName == null) {
			msg = "실패";
		}else {	
			msg = "성공";
			
			// 파일 다운로드 처리를 위한 응답헤더 정보 설정하기
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
			
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream("D:\\A_TeachingMaterial\\4.MiddleProject\\workspace\\Dditflix\\WebContent\\contents\\video\\" + fileName));
			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
			
			int c = 0;
			while((c = bis.read()) != -1) {
				bos.write(c);
			}
			bis.close();
			bos.close();
		}
		
		
		
	}
	
}
