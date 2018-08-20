package com.movie.www.bean;

import java.util.List;

/**
 * bootstrap-table专用分页bean
 * @param <T>
 */
public class BootPageBean<T> {
    private List<T> rows;//rows(分页集合)
    private int total;//总记录数

    public BootPageBean() {
    }

    public BootPageBean(List<T> rows, int total) {
        this.rows = rows;
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
