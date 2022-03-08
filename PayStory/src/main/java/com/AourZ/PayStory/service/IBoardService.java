package com.AourZ.PayStory.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.AourZ.PayStory.model.board.BoardVO;

@Service
public interface IBoardService {
	public ArrayList<BoardVO> getList();
	public ArrayList<BoardVO> getCategoryList(String ctgNo);
	public String selectBoardCategoryName(String categoryNo);
	public String selectMemberName(String memberNo);
	public BoardVO boardView(int boardNo);
	public int createBoard(BoardVO vo);
	public int updateBoard(BoardVO vo);
	public void deleteBoard(int boardNo);
	public List<BoardVO> noticeBoardList();
	public int updateViews(HashMap<String, Object> map);
}
