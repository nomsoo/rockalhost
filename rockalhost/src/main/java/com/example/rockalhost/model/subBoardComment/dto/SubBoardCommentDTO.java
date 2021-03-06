package com.example.rockalhost.model.subBoardComment.dto;

import java.util.Date;

public class SubBoardCommentDTO {
	
	private int comment_num;
	private int board_num;
	private String writer;
	private String passwd;
	private String content;
	private String show;
	private Date reg_date;
	
	@Override
	public String toString() {
		return "subBoardComment [comment_num=" + comment_num + ", board_num=" + board_num + ", writer=" + writer
				+ ", passwd=" + passwd + ", content=" + content + ", show=" + show + ", reg_date=" + reg_date + "]";
	}
	
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}
