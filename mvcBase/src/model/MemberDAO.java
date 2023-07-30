package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	final String sql_insert="INSERT INTO MEMBER (MID,MPW) VALUES(?,?)";
	final String sql_update_MPW="UPDATE MEMBER SET MPW=? WHERE MID=?";
	final String sql_update_TOTAL="UPDATE MEMBER SET TOTAL=TOTAL+? WHERE MID=?";
	final String sql_delete="DELETE FROM MEMBER WHERE MID=?";
	final String sql_selectOne="SELECT MID,MPW,TOTAL FROM MEMBER WHERE MID=? AND MPW=?";
	
	// 회원가입
	public boolean insert(MemberVO mVO) {

		conn=JDBCUtil.connect();
		try {
			// stmt랑 문법이 다름
			pstmt=conn.prepareStatement(sql_insert);
			pstmt.setString(1, mVO.getMid()); // 첫 번쨰 물음표의 자리 [1]부터 시작
			pstmt.setString(2, mVO.getMpw());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}
	// 상품구매
	// 비번변경
	public boolean update(MemberVO mVO) {
		conn=JDBCUtil.connect();
		try {
			if(mVO.getAction().equals("비번변경")) {
				pstmt=conn.prepareStatement(sql_update_MPW);
				pstmt.setString(1, mVO.getTmpMpw());
				pstmt.setString(2, mVO.getMid());
			}
			else if(mVO.getAction().equals("토탈변경")) {
				pstmt=conn.prepareStatement(sql_update_TOTAL);
				pstmt.setInt(1, mVO.getTotal());
				pstmt.setString(2, mVO.getMid());
			}
			int result=pstmt.executeUpdate();
			
			if(result<=0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}
	// 회원탈퇴
	public boolean delete(MemberVO mVO) {

		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_delete);
			pstmt.setString(1, mVO.getMid());
			int result=pstmt.executeUpdate();
			if(result<=0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}

	private ArrayList<MemberVO> selectAll(MemberVO mVO){
		return null;
	}
	// 로그인
	public MemberVO selectOne(MemberVO mVO){

		MemberVO mdata=null;
		
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectOne);
			pstmt.setString(1, mVO.getMid());
			pstmt.setString(2, mVO.getMpw());
			rs=pstmt.executeQuery();

			if(rs.next()) {
				mdata=new MemberVO(rs.getString(1),rs.getString(2),rs.getInt(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
		}
		JDBCUtil.disconnect(rs, pstmt, conn);
		
		return mdata;
	}
}
