package com.board.mvc.web.common.paging;

import lombok.Getter;
import lombok.ToString;

@Getter @ToString
public class SearchCriteria extends Criteria{

    private String type;
    private String keyword;

    public SearchCriteria(String type, String keyword) {
        this.type = type;
        this.keyword = keyword;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

}