package com.hao.vo;

public class OfDetail {
    private int id;// int primary key auto_increment,-- 明细ID
    private int reperId;// int, -- 库存ID
    private int count;// int,-- 数量
    private float amount;// float,-- 合计金额
    private String remark;// varchar(136),-- 备注
    private int oformId;// int-- 出货申请单ID

    private Repertory rep;

    public OfDetail() {
    }

    public OfDetail(int id, int reperId, int count, float amount, String remark, int oformId, Repertory rep) {
        this.id = id;
        this.reperId = reperId;
        this.count = count;
        this.amount = amount;
        this.remark = remark;
        this.oformId = oformId;
        this.rep = rep;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getReperId() {
        return reperId;
    }

    public void setReperId(int reperId) {
        this.reperId = reperId;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
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

    public int getOformId() {
        return oformId;
    }

    public void setOformId(int oformId) {
        this.oformId = oformId;
    }

    public Repertory getRep() {
        return rep;
    }

    public void setRep(Repertory rep) {
        this.rep = rep;
    }

    @Override
    public String toString() {
        return "OfDetail{" +
                "id=" + id +
                ", reperId=" + reperId +
                ", count=" + count +
                ", amount=" + amount +
                ", remark='" + remark + '\'' +
                ", oformId=" + oformId +
                ", rep=" + rep +
                '}';
    }
}
