package com.jaegyu.shoppingmall.qna;

import java.util.List;

public interface qnaDAO {
	public List<qnaDTO> listqna();
	public qnaDTO getqna(int num);
	public int insertqna(qnaDTO dto);
	public int deleteqna(int num, String passwd);
	public int updateqna(qnaDTO dto);
	public void readCountPlus(int num);
}
