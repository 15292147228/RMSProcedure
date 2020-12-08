package com.hao.vo;

public class WareHouse {
    private int id;// int primary key auto_increment,-- 仓库ID
    private String wareName;// varchar(66),-- 仓库名
    private String wareAddress;// varchar(168),-- 仓库地址
    private int saveState;// int -- 最大存量状态(0可存 or 1已满）

    public WareHouse() {
    }

    public WareHouse(int id, String wareName, String wareAddress, int saveState) {
        this.id = id;
        this.wareName = wareName;
        this.wareAddress = wareAddress;
        this.saveState = saveState;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getWareName() {
        return wareName;
    }

    public void setWareName(String wareName) {
        this.wareName = wareName;
    }

    public String getWareAddress() {
        return wareAddress;
    }

    public void setWareAddress(String wareAddress) {
        this.wareAddress = wareAddress;
    }

    public int getSaveState() {
        return saveState;
    }

    public void setSaveState(int saveState) {
        this.saveState = saveState;
    }

    @Override
    public String toString() {
        return "WareHouse{" +
                "id=" + id +
                ", wareName='" + wareName + '\'' +
                ", wareAddress='" + wareAddress + '\'' +
                ", saveState=" + saveState +
                '}';
    }
}
