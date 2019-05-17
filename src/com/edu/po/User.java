package com.edu.po;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/17 18:59
 * @description：管理员
 * @version: 1
 */
public class User {
    private String   buser;
    private String   bpwd ;
    private String  bphone;

    public String getBuser() {
        return buser;
    }

    public void setBuser(String buser) {
        this.buser = buser;
    }

    public String getBpwd() {
        return bpwd;
    }

    public void setBpwd(String bpwd) {
        this.bpwd = bpwd;
    }

    public String getBphone() {
        return bphone;
    }

    public void setBphone(String bphone) {
        this.bphone = bphone;
    }

    @Override
    public String toString() {
        return "User{" +
                "buser='" + buser + '\'' +
                ", bpwd='" + bpwd + '\'' +
                ", bphone='" + bphone + '\'' +
                '}';
    }
}

