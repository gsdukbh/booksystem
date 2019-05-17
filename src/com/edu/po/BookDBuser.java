package com.edu.po;

/**
 * @author ：lijiawei
 * @date ：Created in 2019/05/2019/5/14 8:50
 * @description：管理员账户
 * @modified By：
 * @version: 1$
 */
public class BookDBuser {
    private String   buser;
    private String   bpwd ;

    @Override
    public String toString() {
        return "BookDBuser{" +
                "buser='" + buser + '\'' +
                ", bpwd='" + bpwd + '\'' +
                '}';
    }

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
}

