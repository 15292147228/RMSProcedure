package com.hao.vo;

public class PurchaseDetail {
    private int id;// int primary key auto_increment,-- 明细ID
    private int supId;// int,-- 供货商药品ID
    private int repQuantity;// int,-- 采购数量
    private float amount;// float,-- 合计金额
    private String remark;// varchar(136),-- 备注
    private int purId;// int-- 采购ID

    private SDrug sDrug;

    public PurchaseDetail() {
    }

    public PurchaseDetail(int id, int supId, int repQuantity, float amount, String remark, int purId, SDrug sDrug) {
        this.id = id;
        this.supId = supId;
        this.repQuantity = repQuantity;
        this.amount = amount;
        this.remark = remark;
        this.purId = purId;
        this.sDrug = sDrug;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSupId() {
        return supId;
    }

    public void setSupId(int supId) {
        this.supId = supId;
    }

    public int getRepQuantity() {
        return repQuantity;
    }

    public void setRepQuantity(int repQuantity) {
        this.repQuantity = repQuantity;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getPurId() {
        return purId;
    }

    public void setPurId(int purId) {
        this.purId = purId;
    }

    public SDrug getsDrug() {
        return sDrug;
    }

    public void setsDrug(SDrug sDrug) {
        this.sDrug = sDrug;
    }

    @Override
    public String toString() {
        return "PurchaseDetail{" +
                "id=" + id +
                ", supId=" + supId +
                ", repQuantity=" + repQuantity +
                ", amount=" + amount +
                ", remark='" + remark + '\'' +
                ", purId=" + purId +
                ", sDrug=" + sDrug +
                '}';
    }
}
