package com.example.hien_thi_danh_danh_sach_khach_hang;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(value="/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customers=new ArrayList<>();
    static {
        customers.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội"));
        customers.add(new Customer("Nguyễn Văn Nam","1983-08-21","Bắc Giang"));
        customers.add(new Customer("Nguyễn Thái Hòa","1983-08-22","Nam Định"));
        customers.add(new Customer("Trần Đăng Khoa","1983-08-17","Hà Tây"));
        customers.add(new Customer("Nguyễn Đình Thi","1983-08-19","Hà Nội"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("list.jsp");
        req.setAttribute("customerList",customers);
        requestDispatcher.forward(req,resp);
    }
}
