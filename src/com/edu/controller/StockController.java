package com.edu.controller;

import com.edu.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class StockController {
    @Autowired
    private StockService stockService;


    public String reduceS(){


        return "s";
    }

}
