package kr.or.ddit.user.downloadPayment.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.user.downloadPayment.vo.UserDownloadPaymentVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class UserDownloadPaymentDaoImpl implements IUserDownloadPaymentDao {
	
	private SqlMapClient smc;
	private static IUserDownloadPaymentDao instance;

	private UserDownloadPaymentDaoImpl() {
		if(smc==null) {
			smc = SqlMapClientFactory.getInstance();
		}
	}

	public static IUserDownloadPaymentDao getInstance() {
		if(instance==null) {
			instance = new UserDownloadPaymentDaoImpl();
		}
		return instance;
	}

	@Override
	public String getNewCartNo() {
		String result = "";
		try {
			result = (String) smc.queryForObject("userDwnldPym.getNewCartNo");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insertPaymentCart(List<UserDownloadPaymentVO> cartList) {
		int result = 0;
		try {
			for(UserDownloadPaymentVO vo : cartList) {
				smc.update("userDwnldPym.insertDwldPym", vo);
				result++; 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean checkPaid(UserDownloadPaymentVO vo) {
		boolean result = false;
		try {
			UserDownloadPaymentVO checkVo = (UserDownloadPaymentVO) smc.queryForObject("userDwnldPym.checkPaid", vo);
			if(checkVo!=null) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<UserDownloadPaymentVO> getUserDownloadPymList(String usersId) {
		 List<UserDownloadPaymentVO> list = new ArrayList<UserDownloadPaymentVO>();
		 
		 try {
			list = smc.queryForList("userDwnldPym.getDwnPym", usersId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public String getViedoPath(UserDownloadPaymentVO vo) throws Exception {
	
		return (String) smc.queryForObject("userDwnldPym.getVideoPath", vo);
	}



}
