package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberVO;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = null;
		
		MemberDAO mDAO = new MemberDAO();
		MemberVO mVO = new MemberVO();
		mVO = mDAO.selectOne(mVO); // mVO에 mid,mpw가 setter에 의해 저장됨
		if(mVO==null){
			forward = new ActionForward();
			forward.setPath("login.do");
			forward.setRedirect(true);
			}
		else{
			mVO.setMid(request.getParameter("mid"));
			mVO.setMpw(request.getParameter("mpw"));
			forward.setPath("main.do");
		}
		return forward;
	}

}
