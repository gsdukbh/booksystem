package com.edu.service;


import com.edu.po.Order_form;
import utils.Page;

import java.util.List;

/**
 * @author li
 */
public interface Order_formService {
    public Page<Order_form> findOrder_form(Integer page, Integer rows);
    public Integer addOrder_form(Order_form order_form);
    public Page<Order_form> findOrder_formBys(Integer page, Integer rows,Order_form order_form);
    public Integer findOrder_formconut();
    public Integer editOrder_form(Order_form order_form);
    public Integer delOrder_form(Order_form order_form);
    public Integer findOrder_formBysCount(Order_form order_form);
    public List<Order_form> findOrder_formByIds(String[] id);

    public Order_form findOrder_formById(String id);

}
