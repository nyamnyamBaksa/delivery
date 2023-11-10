package com.delivery.web.home;

import lombok.Data;

@Data
public class HomeDTO {

	private String store_name, store_image, mnname, mnimg, mncatename, mncate, mndesc;
	private int sno, review_count, mnno, mnprice, mnside;
	private float average_rating;
}
