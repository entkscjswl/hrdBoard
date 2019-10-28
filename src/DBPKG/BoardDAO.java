package DBPKG;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class BoardDAO {

	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	private BoardDAO() {}
	
	public Connection getConnection() throws SQLException{
		String jdbc_driver="oracle.jdbc.OracleDriver";
		String db_url="jdbc:oracle:thin:@localhost:1521:xe";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection(db_url,"system","1234");
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public void create(BoardDTO vo) throws SQLException{
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into member_tbl_02 values(?,?,?,?,to_date(?,'yyyymmdd'),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(vo.getCustno()));
			pstmt.setString(2, vo.getCustname());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getJoindate());
			pstmt.setString(6, vo.getGrade());
			pstmt.setString(7, vo.getCity());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
	}
	
	public String count() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String custno = null;
		try {
			conn = getConnection();
			sql = "select max(custno)+1 from member_tbl_02";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
				while(rs.next()) {
				custno=rs.getString(1);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
			return custno;
		}
		
	public void update(BoardDTO vo) throws SQLException{
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			String sql = "update member_tbl_02 set custname=?,phone=?,address=?,joindate=to_date(?,'yyyymmdd'),grade=?,city=? where custno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getCustname());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getAddress());
			pstmt.setString(4, vo.getJoindate());
			pstmt.setString(5, vo.getGrade());
			pstmt.setString(6, vo.getCity());
			pstmt.setInt(7, Integer.parseInt(vo.getCustno()));
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}
	
	
	
	
	
	public BoardDTO readOne(String upd) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardDTO vo = new BoardDTO();
		try {
			conn = getConnection();
			sql = "select * from member_tbl_02 where custno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, upd);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setCustno(rs.getString(1));
				vo.setCustname(rs.getString(2));
				vo.setPhone(rs.getString(3));
				vo.setAddress(rs.getString(4));
				vo.setJoindate(rs.getString(5));
				vo.setGrade(rs.getString(6));
				vo.setCity(rs.getString(7));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
		return vo;
	}
	
	public ArrayList<BoardDTO> memberList()  throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<BoardDTO> mvo = new ArrayList<BoardDTO>();
		try {
			conn = getConnection();
			sql = "SELECT * FROM member_tbl_02";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO vo = new BoardDTO();
				vo.setCustno(rs.getString(1));
				vo.setCustname(rs.getString(2));
				vo.setPhone(rs.getString(3));
				vo.setAddress(rs.getString(4));
				vo.setJoindate(rs.getString(5).substring(0,10));
				vo.setGrade(rs.getString(6));
				vo.setCity(rs.getString(7));
				
				mvo.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) rs.close();
			 if(pstmt!=null) pstmt.close();
			 if(conn!=null) conn.close();
		}
		return mvo;
	}
	
	public ArrayList<BoardDTO> saleList()  throws SQLException {
		Connection conn = null;
		//PreparedStatement pstmt = null;
		Statement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<BoardDTO> mvo = new ArrayList<BoardDTO>();
		try {
			conn = getConnection();
			sql = "select a.custno,a.custname,a.grade,sum(b.price) from member_tbl_02 a INNER JOIN money_tbl_02 b ON a.custno=b.custno group by a.custno,a.custname,a.grade";
			pstmt = conn.createStatement();
			rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				
				BoardDTO vo = new BoardDTO();
				vo.setCustno(rs.getString(1));
				vo.setCustname(rs.getString(2));
				vo.setGrade(rs.getString(3));
				vo.setPrice(rs.getString(4));
				mvo.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) rs.close();
			 if(pstmt!=null) pstmt.close();
			 if(conn!=null) conn.close();
		}
		return mvo;
	}
	}















