package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberVO;

public class DeleteMemberAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = null;
		
		MemberDAO mDAO = new MemberDAO();
		MemberVO mVO = new MemberVO();
		boolean flag=mDAO.delete(mVO);
		if(flag){
			forward = new ActionForward();
			forward.setPath("logout.do");
			forward.setRedirect(true);
			}
		else{
			forward = new ActionForward();
			forward.setPath("mypage.jsp");
			forward.setRedirect(true);
		}
		return forward;
	}

}
