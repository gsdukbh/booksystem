package com.edu.dao;

import com.edu.po.Order_form;
import org.apache.ibatis.session.RowBounds;


import java.util.List;

public interface Order_formDao {


    public List<Order_form> findOrder_form(RowBounds rowBounds);

    public Integer addOrder_form(Order_form order_form);

    public List<Order_form> findOrder_formBys(RowBounds rowBounds, Order_form order_form);
    public Integer findOrder_formBysCount(Order_form order_form);

    public Integer findOrder_formconut();

    public Integer editOrder_form(Order_form order_form);

    public Integer delOrder_form(Order_form order_form);

    public Order_form findOrder_formByIds(String id);

}

