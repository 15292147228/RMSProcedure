package com.hao.vo;

public class InStorageDetail {
    private int id;// int primary key auto_increment,-- 明细ID
    private int supId;// int,-- 供货商药品ID
    private int repQuantity;// int,-- 入库数量
    private float amount;// float,-- 合计金额
    private int reperId;// int, -- 库存ID
    private String remark;// varchar(136),-- 备注
    private int instId;// int-- 入库单ID

    private SDrug sDrug;

    public InStorageDetail() {
    }

    public InStorageDetail(int id, int supId, int repQuantity, float amount, int reperId, String remark, int instId) {
        this.id = id;
        this.supId = supId;
        this.repQuantity = repQuantity;
        this.amount = amount;
        this.reperId = reperId;
        this.remark = remark;
        this.instId = instId;
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

    public int getReperId() {
        return reperId;
    }

    public void setReperId(int reperId) {
        this.reperId = reperId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getInstId() {
        return instId;
    }

    public void setInstId(int instId) {
        this.instId = instId;
    }

    public SDrug getsDrug() {
        return sDrug;
    }

    public void setsDrug(SDrug sDrug) {
        this.sDrug = sDrug;
    }

    @Override
    public String toString() {
        return "InStorageDetail{" +
                "id=" + id +
                ", supId=" + supId +
                ", repQuantity=" + repQuantity +
                ", amount=" + amount +
                ", reperId=" + reperId +
                ", remark='" + remark + '\'' +
                ", instId=" + instId +
                ", sDrug=" + sDrug +
                '}';
    }
}
