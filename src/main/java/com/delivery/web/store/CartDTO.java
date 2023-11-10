package com.delivery.web.store;

import lombok.Data;

@Data
public class CartDTO {

	private String mnname;
	private int cno, mno, mnno, mnprice, camount, ctotal; 
}
