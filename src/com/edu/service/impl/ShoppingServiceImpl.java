package com.edu.service.impl;

import com.edu.dao.ShoppingDao;
import com.edu.po.Shopping;
import com.edu.service.ShoppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class ShoppingServiceImpl implements ShoppingService {
    @Autowired
    private ShoppingDao shoppingDao;
    /**
     * @param borrowID
     * @return
     */
    @Override
    public List<Shopping> findShopping(String borrowID) {

        return this.shoppingDao.findShopping(borrowID);
    }

    /**
     * @param shopping
     * @return
     */
    @Override
    public Integer addShopping(Shopping shopping) {
        return this.shoppingDao.addShopping(shopping);
    }

    /**
     * @param shopping
     * @return
     */
    @Override
    public Integer delShopping(Shopping shopping) {
        return this.shoppingDao.delShopping(shopping);
    }

    /**
     * @param shopping
     * @return
     */
    @Override
    public Integer upShopping(Shopping shopping) {
        return this.upShopping(shopping);
    }
}
