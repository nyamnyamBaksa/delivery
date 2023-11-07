package com.delivery.web.home;

import lombok.Data;

@Data
public class HomeDTO {

	private String store_name, store_image;
	private int sno, review_count;
	private float average_rating;
}
