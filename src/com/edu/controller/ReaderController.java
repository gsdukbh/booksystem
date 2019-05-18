package com.edu.controller;

import com.edu.service.ReaderInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ReaderController {
    @Autowired
    private ReaderInfoService readerInfoService;
    
}
