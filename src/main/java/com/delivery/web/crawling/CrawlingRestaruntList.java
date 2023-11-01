package com.delivery.web.crawling;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class CrawlingRestaruntList {
	
	public static void main(String[] args) {
		
		CrawlingRestaruntList selTest = new CrawlingRestaruntList();
		selTest.crawl();
	}
	
	private WebDriver driver;
	
	
	public static final String WebDrive_ID = "webdriver.chrome.driver";
	public static final String WebDriver_PATH = "C:\\Users\\82105\\git\\nyamnyam\\delivery\\chromedriver.exe";
	
	private String url;
	
	public CrawlingRestaruntList() {
		super();
		
		System.setProperty(WebDriver_PATH, WebDrive_ID);
		
		driver = new ChromeDriver();
		url = "https://www.siksinhot.com/search?keywords=%EA%B0%95%EB%82%A8%EC%97%AD";
		
	}
	
public void crawl() {
		
		try {
			driver.get(url);
			
			while(true) {
				List<WebElement> itemList = driver.findElements(By.cssSelector("ul.localFood_list"));
				
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