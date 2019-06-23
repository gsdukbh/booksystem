package com.edu.service.impl;

import com.edu.dao.Order_formDao;
import com.edu.po.Order_form;
import com.edu.service.Order_formService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import utils.Page;

import java.beans.Transient;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class Order_formServiceImpl implements Order_formService {
    @Autowired
    private Order_formDao order_formDao;
    @Override
    public Page<Order_form> findOrder_form(Integer page, Integer rows) {
        RowBounds rowBounds=new RowBounds((page-1)*rows,rows);
        List<Order_form> order_formList=this.order_formDao.findOrder_form(rowBounds);
        int count=this.order_formDao.findOrder_formconut();
        Page<Order_form> order_formPage=new Page<>();
        order_formPage.setRows(order_formList);
        order_formPage.setPage(page);
        order_formPage.setTotal(count);
        order_formPage.setSize(rows);
        return order_formPage;
    }

    @Override
    public Integer addOrder_form(Order_form order_form) {
        return this.order_formDao.addOrder_form(order_form);
    }

    @Override
    public Page<Order_form> findOrder_formBys(Integer page, Integer rows, Order_form order_form) {
        RowBounds rowBounds=new RowBounds((page-1)*rows,rows);
        List<Order_form> order_formList=this.order_formDao.findOrder_formBys(rowBounds,order_form);
        int count=this.order_formDao.findOrder_formBysCount(order_form);
        Page<Order_form> order_formPage=new Page<>();
        order_formPage.setRows(order_formList);
        order_formPage.setPage(page);
        order_formPage.setTotal(count);
        order_formPage.setSize(rows);
        return order_formPage;
    }

    @Override
    public Integer findOrder_formconut() {
        return this.order_formDao.findOrder_formconut();
    }

    @Override
    public Integer editOrder_form(Order_form order_form) {
        return this.order_formDao.editOrder_form(order_form);
    }

    @Override
    public Integer delOrder_form(Order_form order_form) {
        return this.order_formDao.editOrder_form(order_form);
    }

    @Override
    public Integer findOrder_formBysCount(Order_form order_form) {
        return this.order_formDao.findOrder_formBysCount(order_form);
    }

    @Override
    public List<Order_form> findOrder_formByIds(String[] ids) {
        List<Order_form> order_formList=new ArrayList<>();
        for (String id:ids){
            order_formList.add(this.order_formDao.findOrder_formByIds(id));
        }
        return order_formList;
    }

    @Override
    public Order_form findOrder_formById(String id) {

        return this.order_formDao.findOrder_formByIds(id);
    }
}
