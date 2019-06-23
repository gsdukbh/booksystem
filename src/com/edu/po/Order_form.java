package com.edu.po;

import java.util.Date;

public class Order_form {
    private String orde_form_id;
    private String bookId;
    private String borrowID;

    private Date orde_form_create_time;

    private String orde_form_Pay_time;

    private String orde_form_delivery_address;

    private String orde_form_shipper;

    private String orde_form_courier_company;

    private String orde_form_shipping_address;

    private String orde_form_consignee;

    private String orde_form_shipment_number;

    private Integer orde_form_order_amount;

    @Override
    public String toString() {
        return "Order_form{" +
                "orde_form_id='" + orde_form_id + '\'' +
                ", bookId='" + bookId + '\'' +
                ", borrowID='" + borrowID + '\'' +
                ", orde_form_create_time=" + orde_form_create_time +
                ", orde_form_Pay_time='" + orde_form_Pay_time + '\'' +
                ", orde_form_delivery_address='" + orde_form_delivery_address + '\'' +
                ", orde_form_shipper='" + orde_form_shipper + '\'' +
                ", orde_form_courier_company='" + orde_form_courier_company + '\'' +
                ", orde_form_shipping_address='" + orde_form_shipping_address + '\'' +
                ", orde_form_consignee='" + orde_form_consignee + '\'' +
                ", orde_form_shipment_number='" + orde_form_shipment_number + '\'' +
                ", orde_form_order_amount=" + orde_form_order_amount +
                '}';
    }

    public String getOrde_form_id() {
        return orde_form_id;
    }

    public void setOrde_form_id(String orde_form_id) {
        this.orde_form_id = orde_form_id;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public String getBorrowID() {
        return borrowID;
    }

    public void setBorrowID(String borrowID) {
        this.borrowID = borrowID;
    }

    public Date getOrde_form_create_time() {
        return orde_form_create_time;
    }

    public void setOrde_form_create_time(Date orde_form_create_time) {
        this.orde_form_create_time = orde_form_create_time;
    }

    public String getOrde_form_Pay_time() {
        return orde_form_Pay_time;
    }

    public void setOrde_form_Pay_time(String orde_form_Pay_time) {
        this.orde_form_Pay_time = orde_form_Pay_time;
    }

    public String getOrde_form_delivery_address() {
        return orde_form_delivery_address;
    }

    public void setOrde_form_delivery_address(String orde_form_delivery_address) {
        this.orde_form_delivery_address = orde_form_delivery_address;
    }

    public String getOrde_form_shipper() {
        return orde_form_shipper;
    }

    public void setOrde_form_shipper(String orde_form_shipper) {
        this.orde_form_shipper = orde_form_shipper;
    }

    public String getOrde_form_courier_company() {
        return orde_form_courier_company;
    }

    public void setOrde_form_courier_company(String orde_form_courier_company) {
        this.orde_form_courier_company = orde_form_courier_company;
    }

    public String getOrde_form_shipping_address() {
        return orde_form_shipping_address;
    }

    public void setOrde_form_shipping_address(String orde_form_shipping_address) {
        this.orde_form_shipping_address = orde_form_shipping_address;
    }

    public String getOrde_form_consignee() {
        return orde_form_consignee;
    }

    public void setOrde_form_consignee(String orde_form_consignee) {
        this.orde_form_consignee = orde_form_consignee;
    }

    public String getOrde_form_shipment_number() {
        return orde_form_shipment_number;
    }

    public void setOrde_form_shipment_number(String orde_form_shipment_number) {
        this.orde_form_shipment_number = orde_form_shipment_number;
    }

    public Integer getOrde_form_order_amount() {
        return orde_form_order_amount;
    }

    public void setOrde_form_order_amount(Integer orde_form_order_amount) {
        this.orde_form_order_amount = orde_form_order_amount;
    }
}
