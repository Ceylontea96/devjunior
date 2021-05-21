package com.board.mvc.web.common.paging;

import lombok.Getter;
import lombok.ToString;

@Getter @ToString
public class Criteria {

    private int page;
    private int amount;

    public Criteria(){
        this(1,10);
    }

    public Criteria(int page, int amount){
        this.page = page;
        this.amount = amount;
    }

    public void setPage(int page){
        if(page <= 0){
            this.page = 1;
            return;
        }
        this.page = page;
    }

    public void setAmount(int amount){
        if(amount <= 0 || amount > 100){
            this.amount = 10;
            return;
        }
        this.amount = amount;
    }
}
