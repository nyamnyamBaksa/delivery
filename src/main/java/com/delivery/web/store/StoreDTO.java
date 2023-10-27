package com.delivery.web.store;

import lombok.Data;

@Data
public class StoreDTO {

	private String store_name, store_image;
	private int sno, review_count;
	private float average_rating;
}
