package com.edu.service;

import com.edu.po.Shopping;

import java.util.List;

public interface ShoppingService {
    /**
     *
     * @param borrowID
     * @return
     */
    public List<Shopping> findShopping(String borrowID);

    /**
     *
     * @param shopping
     * @return
     */
    public Integer addShopping(Shopping shopping);

    /**
     *
     * @param shopping
     * @return
     */
    public Integer delShopping(Shopping shopping);

    /**
     *
     * @param shopping
     * @return
     */
    public Integer upShopping(Shopping shopping);
}
