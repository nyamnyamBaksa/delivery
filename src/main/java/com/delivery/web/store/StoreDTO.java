package com.delivery.web.store;

import lombok.Data;

@Data
public class StoreDTO {

	private String store_name, store_image, mnname, mnimg;
	private int sno, review_count, mnprice;
	private float average_rating;
	
	
	
}
