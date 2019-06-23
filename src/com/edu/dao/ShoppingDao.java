package com.edu.dao;

import com.edu.po.Shopping;

import java.util.List;

public interface ShoppingDao {
    /**
     * 查询
     * @param borrowID
     * @return
     */
    public List<Shopping> findShopping(String borrowID);

    /**
     * 增加
     * @param shopping
     * @return
     */
    public Integer addShopping(Shopping shopping);

    /**
     * 删除
     * @param shopping
     * @return
     */
    public Integer delShopping(Shopping shopping);

    /**
     *更新
     * @param shopping
     * @return
     */
    public Integer upShopping(Shopping shopping);
}
