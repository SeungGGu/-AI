package com.scv.web.adm.domain;

public class AdmVO {

    private String me_id;
    private String me_pwd;

    public String getMe_id() {
        return me_id;
    }

    public void setMe_id(String me_id) {
        this.me_id = me_id;
    }

    public String getMe_pwd() {
        return me_pwd;
    }

    public void setMe_pwd(String me_pwd) {
        this.me_pwd = me_pwd;
    }

    @Override
    public String toString() {
        return "AdmVO{" +
                "me_id='" + me_id + '\'' +
                ", me_pwd='" + me_pwd + '\'' +
                '}';
    }
}
