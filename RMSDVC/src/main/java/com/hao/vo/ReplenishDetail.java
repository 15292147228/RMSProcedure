package com.hao.vo;

public class ReplenishDetail {
    private int id;// int primary key auto_increment,-- 明细ID
    private int supId;// int,-- 供货商药品ID
    private int repQuantity;// int,-- 进货数量
    private float amount;// float,-- 合计金额
    private String remark;// varchar(136),-- 备注
    private int repId;// int-- 进货申请ID

    private SDrug sDrug;

    public ReplenishDetail(int id, int supId, int repQuantity, float amount, String remark, int repId) {
        this.id = id;
        this.supId = supId;
        this.repQuantity = repQuantity;
        this.amount = amount;
        this.remark = remark;
        this.repId = repId;
    }

    public ReplenishDetail() {
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

    public int getRepId() {
        return repId;
    }

    public void setRepId(int repId) {
        this.repId = repId;
    }

    public SDrug getsDrug() {
        return sDrug;
    }

    public void setsDrug(SDrug sDrug) {
        this.sDrug = sDrug;
    }

    @Override
    public String toString() {
        return "ReplenishDetail{" +
                "id=" + id +
                ", supId=" + supId +
                ", repQuantity=" + repQuantity +
                ", amount=" + amount +
                ", remark='" + remark + '\'' +
                ", repId=" + repId +
                ", sDrug=" + sDrug +
                '}';
    }
}
