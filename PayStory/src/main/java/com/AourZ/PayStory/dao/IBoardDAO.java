package com.AourZ.PayStory.dao;

import java.util.ArrayList;

import com.AourZ.PayStory.model.BoardVO;
import com.AourZ.PayStory.service.IBoardService;

public interface IBoardDAO extends IBoardService {
	public ArrayList<BoardVO> getList();
	public ArrayList<BoardVO> getCategory(String ctgNo);
	public BoardVO boardView(int boardNo);
	public int createBoard(BoardVO vo);
}
