package com.delivery.web.store;

import java.util.List;

import lombok.Data;

@Data
public class StoreDTO {

	private String store_name, store_image, mnimg, mnname, sname, sdesc, saddr, stime, sphone, mid;
	private int sno, review_count, wno, mno;
	private float average_rating;
	private List<MenuDTO> menuList;
	
}
