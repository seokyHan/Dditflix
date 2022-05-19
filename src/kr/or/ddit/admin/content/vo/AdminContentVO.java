package kr.or.ddit.admin.content.vo;

public class AdminContentVO {
	
	private String cont_title;
	private String cont_cast;
	private String cont_genre;
	private String cont_director;
	private String cont_nation;
	private String cont_running_time;
	private String cont_poster; //포스터 저장경로
	private String ep_plot; //줄거리
	private String video_file_save_path; //비디오 저장경로
	private String price_rating_id;
	private String cont_mod;
	
	
	public String getPrice_rating_id() {
		return price_rating_id;
	}
	public void setPrice_rating_id(String price_rating_id) {
		this.price_rating_id = price_rating_id;
	}
	public String getCont_mod() {
		return cont_mod;
	}
	public void setCont_mod(String cont_mod) {
		this.cont_mod = cont_mod;
	}
	public String getCont_title() {
		return cont_title;
	}
	public void setCont_title(String cont_title) {
		this.cont_title = cont_title;
	}
	public String getCont_cast() {
		return cont_cast;
	}
	public void setCont_cast(String cont_cast) {
		this.cont_cast = cont_cast;
	}
	public String getCont_genre() {
		return cont_genre;
	}
	public void setCont_genre(String cont_genre) {
		this.cont_genre = cont_genre;
	}
	public String getCont_director() {
		return cont_director;
	}
	public void setCont_director(String cont_director) {
		this.cont_director = cont_director;
	}
	public String getCont_nation() {
		return cont_nation;
	}
	public void setCont_nation(String cont_nation) {
		this.cont_nation = cont_nation;
	}
	public String getCont_running_time() {
		return cont_running_time;
	}
	public void setCont_running_time(String cont_running_time) {
		this.cont_running_time = cont_running_time;
	}
	public String getCont_poster() {
		return cont_poster;
	}
	public void setCont_poster(String cont_poster) {
		this.cont_poster = cont_poster;
	}
	public String getEp_plot() {
		return ep_plot;
	}
	public void setEp_plot(String ep_plot) {
		this.ep_plot = ep_plot;
	}
	public String getVideo_file_save_path() {
		return video_file_save_path;
	}
	public void setVideo_file_save_path(String video_file_save_path) {
		this.video_file_save_path = video_file_save_path;
	}
	
	

}
