package article.service;

import java.util.Map;

public class RemoveRequest {

	private String userId;
	private int articleNumber; //no
	private String title;
	
	
	
	public String getUserId() {
		return userId;
	}
	public int getArticleNumber() {
		return articleNumber;
	}
	
	
	public RemoveRequest(String userId, int articleNumber) {
		super();
		this.userId = userId;
		this.articleNumber = articleNumber;
	}
	
	public void validate(Map<String, Boolean> errors) {
		if(title == null || title.trim().isEmpty()) {
			errors.put("title", true);
		}
	
    }
}
