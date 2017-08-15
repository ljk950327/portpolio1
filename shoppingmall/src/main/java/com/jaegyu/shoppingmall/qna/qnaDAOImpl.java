package com.jaegyu.shoppingmall.qna;

import java.util.List;

public class qnaDAOImpl implements qnaDAO {

	@Override
	public List<qnaDTO> listqna(int startNum,int endNum) {
		String sql="select * from (select rownum rn, tt.* from (select * from qna order by re_step asc) tt) where rn >="+startNum+" and rn <="+endNum;
		return qnaMapper.listqna(sql);
	}

	@Override
	public qnaDTO getqna(int num) {
		 
		return qnaMapper.getqna(num);
	}

	@Override
	public int insertqna(qnaDTO dto) {
		String sql=null;
		if(dto.getNum()==0){	//글쓰기
			sql="update qna set re_step=re_step+1";
		} else{					//답글쓰기
			sql="update qna set re_step=re_step+1 where re_step>"+dto.getRe_step();
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
	@Override
	public int getTotalQna(){
		return qnaMapper.getTotalQna();
	}
}
