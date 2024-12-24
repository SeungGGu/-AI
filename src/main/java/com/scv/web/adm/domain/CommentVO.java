package com.scv.web.adm.domain;

import java.util.Date;

public class CommentVO {
    private int replyNo;
    private String replyText;
    private String replyWriter;
    private Date regDate;

    private String replyCtg;

    // Getters and Setters
    public int getReplyNo() {
        return this.replyNo;
    }

    public void setReplyNo(int replyNo) {
        this.replyNo = replyNo;
    }

    public String getReplyText() {
        return this.replyText;
    }

    public void setReplyText(String replyText) {
        this.replyText = replyText;
    }

    public String getReplyWriter() {
        return this.replyWriter;
    }

    public void setReplyWriter(String replyWriter) {
        this.replyWriter = replyWriter;
    }

    public Date getRegDate() {
        return this.regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public String getReplyCtg() {
        return this.replyCtg;
    }

    public void setReplyCtg(String replyCtg) {
        this.replyCtg = replyCtg;
    }

    // toString method for debugging
    @Override
    public String toString() {
        return "CommentVO [replyNo=" + replyNo + ", replyText=" + replyText + ", replyWriter=" + replyWriter
                + ", regDate=" + regDate + ", replyCtg=" + replyCtg + "]";
    }
}
