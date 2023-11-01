package com.delivery.web.store;

import java.util.List;

import lombok.Data;

@Data
public class StoreDTO {

	private String store_name, store_image, mnname, sname, sdesc, saddr, stime, sphone;
	private int sno, review_count;
	private float average_rating;
	private List<MenuDTO> menuList;
	
}
