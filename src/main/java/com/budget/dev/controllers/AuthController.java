package com.budget.dev.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/auths")
@RequiredArgsConstructor
public class AuthController {


    @GetMapping("/home")
    public String getSaisie(Model model) {
        model.addAttribute("content", "pages/auths/home");
        return "admin-layout";
    }

    
}
