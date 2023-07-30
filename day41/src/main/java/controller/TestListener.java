package controller;

import java.util.ArrayList;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import model.BoardDAO;
import model.BoardVO;
import model.Crawling;

/**
 * Application Lifecycle Listener implementation class Listener
 *
 */
@WebListener
public class TestListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public TestListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
         // 이 부분에 크롤링 + DB에 넣어줌
    	/*
    	ArrayList<MemberVO> datas = new ArrayList<MemberVO>();
    	for(int i=0; i<5; i++) { // 홍길동 5명
    		MemberVO data = new MemberVO();
    		data.setName("홍길동0"+(i+1));
    		data.setAge(i+1);
    		datas.add(data);
    	}
    	datas.add(new MemberVO()); // 무명 2명
    	datas.add(new MemberVO());
    	
    	MemberVO mVO = new MemberVO(); // 티모 1명
    	mVO.setName("티모");
    	mVO.setAge(13);
    	
    	//application.setAttribute("datas",datas);
    	ServletContext sc = sce.getServletContext();
    	sc.setAttribute("datas", datas);
    	sc.setAttribute("data", mVO);
    	
    	System.out.println("로그 : 리스너 수행완료");
    	*/
    	
    	ArrayList<BoardVO> datas = new ArrayList<BoardVO>();
    	BoardDAO bDAO = new BoardDAO();
    	datas = Crawling.sample();
    	
    	for(BoardVO v:datas) {
    		bDAO.insert(v);
    	}
    }
	
}
