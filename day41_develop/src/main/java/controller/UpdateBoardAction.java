package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardVO;

public class UpdateBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		BoardDAO bDAO = new BoardDAO();
		BoardVO bVO = new BoardVO();
		boolean flag=bDAO.update(bVO);
		if(flag){
			out.println("<script>alert('게시글 변경 성공!');location.href='controller.jsp?action=board&num="+bVO.getNum()+"';</script>");
		}
		else{
			out.println("<script>alert('게시글 변경 실패...');history.go(-1);</script>");
		}
		return forward;
	}

}
