package kr.or.ddit.user.downloadPayment.service;

import java.util.List;

import kr.or.ddit.user.downloadPayment.dao.IUserDownloadPaymentDao;
import kr.or.ddit.user.downloadPayment.dao.UserDownloadPaymentDaoImpl;
import kr.or.ddit.user.downloadPayment.vo.UserDownloadPaymentVO;

public class UserDownloadPaymentServiceImpl implements IUserDownloadPaymentService {
	
	private IUserDownloadPaymentDao dwnldPmDao;
	private static IUserDownloadPaymentService dwnldPmService;
	
	private UserDownloadPaymentServiceImpl() {
		if(dwnldPmDao==null) {
			dwnldPmDao = UserDownloadPaymentDaoImpl.getInstance();
		}
	}
	public static IUserDownloadPaymentService getInstance() {
		if(dwnldPmService==null) {
			dwnldPmService = new UserDownloadPaymentServiceImpl();
		}
		return dwnldPmService;
	}
	@Override
	public String getNewCartNo() {
		return dwnldPmDao.getNewCartNo();
	}
	@Override
	public int insertPaymentCart(List<UserDownloadPaymentVO> cartList) {
		return dwnldPmDao.insertPaymentCart(cartList);
	}
	@Override
	public boolean checkPaid(UserDownloadPaymentVO vo) {
		return dwnldPmDao.checkPaid(vo);
	}
	
	// 결제한 컨텐츠를 리스트로 뽑아오는 메서드
	@Override
	public List<UserDownloadPaymentVO> getUserDownloadPymList(String usersId) {
		return dwnldPmDao.getUserDownloadPymList(usersId);
	}
	@Override
	public String getViedoPath(UserDownloadPaymentVO vo) {
		
		String path = "";
		
		try {
			path = dwnldPmDao.getViedoPath(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return path;
	}
	


	
	
}
