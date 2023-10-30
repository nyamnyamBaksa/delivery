package com.delivery.web.crawling;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class CrawlingRestaruntReview {

	public static void main(String[] args) {

		CrawlingRestaruntReview selTest = new CrawlingRestaruntReview();
		selTest.crawl();
	}

	private WebDriver driver;

	public static final String WebDrive_ID = "webdriver.chrome.driver";
	public static final String WebDriver_PATH = "C:\\Users\\82105\\git\\nyamnyam\\delivery\\chromedriver.exe";

	private String url;

	public CrawlingRestaruntReview() {
		super();
		
		System.setProperty(WebDriver_PATH, WebDrive_ID);
		
		driver = new ChromeDriver();
		url = "https://www.siksinhot.com/P/56310";
		
	}

	public void crawl() {
		
		try {
			driver.get(url);
			
			while(true) {
				List<WebElement> itemList = driver.findElements(By.cssSelector("div.store_review"));
				
				for (WebElement item : itemList) {
					System.out.println(item.getText());
				}
				
				WebElement moreButton = driver.findElement(By.cssSelector("a.more_list"));
				if (moreButton.isDisplayed()) {
					moreButton.click();
					Thread.sleep(2000);
				}else {
					break;
				}
					
			}
		
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			driver.close();
		}
		
	} 
		 
	
}