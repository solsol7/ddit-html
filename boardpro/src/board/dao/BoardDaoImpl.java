package board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import board.vo.BoardVO;
import board.vo.ReplyVO;
import mybatis.config.MybatisUtil;

public class BoardDaoImpl implements IBoardDao {

   SqlSession  sql ;

   //자신의 객체 
   private static IBoardDao dao;
   
   //자신의 객체를 생성하고 리턴하는 메소드
   public static  IBoardDao  getDao() {
      if(dao == null)  dao = new BoardDaoImpl();
      
      return dao;
   }
   
   @Override
   public int insertBoard(BoardVO vo) {
      int res = 0;
      try {
          sql = MybatisUtil.getSqlSession();
          res = sql.insert("board.insertBoard",vo);
       }catch(Exception e){
    	   e.printStackTrace();
       } finally {
          sql.commit();
          sql.close();
       }
      return res;
   }

   @Override
   public int deleteBoard(int num) {
	   int res = 0;
	      try {
	          sql = MybatisUtil.getSqlSession();
	          res = sql.insert("board.deleteBoard",num);
	       }catch(Exception e){
	    	   e.printStackTrace();
	       } finally {
	          sql.commit();
	          sql.close();
	       }
      return res;
   }

   @Override
   public int updateBoard(BoardVO vo) {
      int res = 0;
      
      return res;
   }

   @Override
   public int updateHit(int num) {
      int res = 0;
      
      return res;
   }

   @Override
   public List<BoardVO> selectByPage(Map<String, Object> map) {
      List<BoardVO>  list = null;
      try {
         sql = MybatisUtil.getSqlSession();
         list = sql.selectList("board.selectByPage", map);
      }catch(Exception e){
    	  e.printStackTrace();
      } finally {
         sql.commit();
         sql.close();
      }
      return list;
   }

   @Override
   public int insertReply(ReplyVO vo) {
      int res = 0;
      
      return res;
   }

   @Override
   public int deleteReply(int renum) {
      int res = 0;
      
      return res;
   }

   @Override
   public int updateReply(ReplyVO vo) {
      int res = 0;
      
      return res;
   }

   @Override
   public int totalCount(Map<String, Object> map) {
      int res = 0;
      
      try {
    	  sql = MybatisUtil.getSqlSession();
    	  res = sql.selectOne("board.totalCount",map);
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		sql.commit();
		sql.close();
	}
      
      return res;
   }

   @Override
   public List<ReplyVO> selectReply(int bonum) {
      List<ReplyVO>   list = null;
      
      return list;
   }
}