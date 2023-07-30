package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardVO;

public class InsertBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = null;
		
		BoardDAO bDAO = new BoardDAO();
		BoardVO bVO = new BoardVO();
		boolean flag=bDAO.insert(bVO);
		if(flag){
			forward = new ActionForward();
			forward.setPath("main.do");
			forward.setRedirect(false);
			}
		else{
			forward = new ActionForward();
			forward.setPath("insertBoard.do");
			forward.setRedirect(true);
		}
		return forward;
	}

}
