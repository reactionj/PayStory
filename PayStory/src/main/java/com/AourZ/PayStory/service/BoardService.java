package com.AourZ.PayStory.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.AourZ.PayStory.dao.IBoardDAO;
import com.AourZ.PayStory.model.board.BoardVO;


@Service("BoardService")
public class BoardService implements IBoardService{
	
	@Autowired
	private IBoardDAO dao;

	@Override
	public ArrayList<BoardVO> getList() {
		 return dao.getList();
	}
	
	@Override
	public ArrayList<BoardVO> getCategoryList(String ctgNo) {
		return dao.getCategoryList(ctgNo);
	}
	
	@Override
	public String selectBoardCategoryName(String categoryNo) {
		return dao.selectBoardCategoryName(categoryNo);
	}
	
	@Override
	public String selectMemberName(String memberNo) {
		return dao.selectMemberName(memberNo);
	}

	@Override
	public BoardVO boardView(int boardNo) {
		return dao.boardView(boardNo);
	}

	@Override
	public int createBoard(BoardVO vo) {
		return dao.createBoard(vo);
	}
	
	@Override
	public int updateBoard(BoardVO vo) {
		return dao.updateBoard(vo);
	}

	@Override
	public void deleteBoard(int boardNo) {
		dao.deleteBoard(boardNo);
	}

	@Override
	public List<BoardVO> noticeBoardList() {
		return dao.noticeBoardList();
	}

	@Override
	public int updateViews(HashMap<String, Object> map) {
		return dao.updateViews(map);
	}
}
