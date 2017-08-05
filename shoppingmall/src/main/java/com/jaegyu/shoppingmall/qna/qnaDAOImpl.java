package com.jaegyu.shoppingmall.qna;

import java.util.List;

public class qnaDAOImpl implements qnaDAO {

	@Override
	public List<qnaDTO> listqna() {
		 
		return qnaMapper.listqna();
	}

	@Override
	public qnaDTO getqna(int num) {
		 
		return qnaMapper.getqna(num);
	}

	@Override
	public int insertqna(qnaDTO dto) {
		String sql=null;
		if(dto.getNum()==0){	
			sql="update board set re_step=re_step+1";
		} else{	
			sql="update board set re_step=re_step+1 where re_step>"+dto.getRe_step();
			dto.setRe_step(dto.getRe_step()+1);
			dto.setRe_level(dto.getRe_level()+1);
		}
		qnaMapper.restepCount(sql);
		return qnaMapper.insertqna(dto);
	}

	@Override
	public int deleteqna(int num, String passwd) {
		return qnaMapper.deleteqna(num);

	}

	@Override
	public int updateqna(qnaDTO dto) {
		return qnaMapper.updateqna(dto);
		 
		
	}

	@Override
	public void readCountPlus(int num) {
		qnaMapper.readCountPlus(num);
	}

}
