package com.jaegyu.shoppingmall.qna;

import java.util.List;

public interface qnaDAO {
	public List<qnaDTO> listqna(int startNum,int endNum);
	public qnaDTO getqna(int num);
	public int insertqna(qnaDTO dto);
	public int deleteqna(int num, String passwd);
	public int updateqna(qnaDTO dto);
	public void readCountPlus(int num);
	public int getTotalQna();
}
