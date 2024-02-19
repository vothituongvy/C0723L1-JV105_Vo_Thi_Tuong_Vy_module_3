package com.example.phone1.model;

public class Phone {
    private int id;
    private String name;
    private double price;
    private int id_category;

    public Phone() {
    }

    public Phone(int id, String name, double price, int id_category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.id_category = id_category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getId_category() {
        return id_category;
    }

    public void setId_category(int id_category) {
        this.id_category = id_category;
    }
}
