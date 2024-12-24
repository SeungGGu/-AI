package com.scv.web.adm.domain;

import java.util.Date;

public class ModifyVO {
    private int modify_replyNo;
    private String modify_replyText;
    private String modify_replyWriter;
    private Date modify_regDate;
    private String modify_replyCtg;

    public int getModify_replyNo() {
        return modify_replyNo;
    }

    public void setModify_replyNo(int modify_replyNo) {
        this.modify_replyNo = modify_replyNo;
    }

    public String getModify_replyText() {
        return modify_replyText;
    }

    public void setModify_replyText(String modify_replyText) {
        this.modify_replyText = modify_replyText;
    }

    public String getModify_replyWriter() {
        return modify_replyWriter;
    }

    public void setModify_replyWriter(String modify_replyWriter) {
        this.modify_replyWriter = modify_replyWriter;
    }

    public Date getModify_regDate() {
        return modify_regDate;
    }

    public void setModify_regDate(Date modify_regDate) {
        this.modify_regDate = modify_regDate;
    }

    public String getModify_replyCtg() {
        return modify_replyCtg;
    }

    public void setModify_replyCtg(String modify_replyCtg) {
        this.modify_replyCtg = modify_replyCtg;
    }

    @Override
    public String toString() {
        return "ModifyVO{" +
                "modify_replyNo=" + modify_replyNo +
                ", modify_replyText='" + modify_replyText + '\'' +
                ", modify_replyWriter='" + modify_replyWriter + '\'' +
                ", modify_regDate=" + modify_regDate +
                ", modify_replyCtg='" + modify_replyCtg + '\'' +
                '}';
    }
}
