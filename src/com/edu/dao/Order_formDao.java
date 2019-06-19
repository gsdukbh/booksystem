package com.edu.dao;

import com.edu.po.Order_form;

import java.util.List;

public interface Order_formDao {


    public List<Order_form> findOrder_form();

    public Integer addOrder_form();
}

