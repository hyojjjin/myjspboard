package article.service;

import java.sql.Connection;

import article.dao.ArticleContentDao;
import article.dao.ArticleDao;
import article.model.Article;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class RemoveArticleService {
	private ArticleDao articleDao = new ArticleDao();
	private ArticleContentDao contentDao = new ArticleContentDao();
	
	
	
	public void remove(RemoveRequest remReq) {
	
		Connection conn = null;
		
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);

			Article article = articleDao.selectById(conn, remReq.getArticleNumber());
	//이 줄이 뭐하는 거징
			
		if(article == null) {
			throw new ArticleNotFoundException();
		}
		
		if(!canRemove(remReq.getUserId(), article)) {
			throw new PermissionDeniedException();
		}
		
		articleDao.delete(conn, remReq.getArticleNumber());
		contentDao.delete(conn, remReq.getArticleNumber());
		//어디서 가져오지?
		conn.commit();
	} catch (Exception e) {
		JdbcUtil.rollback(conn);
		throw new RuntimeException(e);
	} finally {
		JdbcUtil.close(conn);
	}
}
		
		
		private boolean canRemove(String UserId, Article article) {
			return article.getWriter().getId().equals(UserId);
		}
}
