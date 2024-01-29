package com.example.discount_calculator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.NumberFormat;

@WebServlet(name="discountServlet",value={"/display_discount"})
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    RequestDispatcher requestDispatcher=req.getRequestDispatcher("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productDescription=req.getParameter("productDescription");
        double listPrice= Double.parseDouble(req.getParameter("listPrice"));
        double discountPercent=Double.parseDouble(req.getParameter("discountPercent"));
        double discountAmount=listPrice*discountPercent*0.01;
        double discountPrice=listPrice-discountAmount;
        NumberFormat formatter = NumberFormat.getCurrencyInstance();
        String formattedListPrice = formatter.format(listPrice);
        String formattedDiscountAmount = formatter.format(discountAmount);
        String formattedDiscountPrice = formatter.format(discountPrice);
        req.setAttribute("productDescription",productDescription);
        req.setAttribute("listPrice", formattedListPrice);
        req.setAttribute("discountPercent", discountPercent);
        req.setAttribute("discountAmount", formattedDiscountAmount);
        req.setAttribute("discountPrice", formattedDiscountPrice);
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("result.jsp");
        requestDispatcher.forward(req,resp);
    }
}
