package com.jaegyu.shoppingmall.qna;

import java.util.List;

public class qnaDAOImpl implements qnaDAO {

	@Override
	public List<qnaDTO> listqna() {
		// TODO Auto-generated method stub
		return qnaMapper.listqna();
	}

	@Override
	public qnaDTO getqna(int num) {
		// TODO Auto-generated method stub
		return qnaMapper.getqna(num);
	}

	@Override
	public int insertqna(qnaDTO dto) {
		// TODO Auto-generated method stub
		return qnaMapper.insertqna(dto);
	}

	@Override
	public int deleteqna(int num, String passwd) {
		return qnaMapper.deleteqna(num);
		// TODO Auto-generated method stub
		
	}

	@Override
	public int updateqna(qnaDTO dto) {
		return qnaMapper.updateqna(dto);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void readCountPlus(int num) {
		qnaMapper.readCountPlus(num);
	}

}
