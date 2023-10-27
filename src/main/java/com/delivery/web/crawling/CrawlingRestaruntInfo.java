package com.delivery.web.crawling;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class CrawlingRestaruntInfo {

	public static void main(String[] args) {

		CrawlingRestaruntInfo selTest = new CrawlingRestaruntInfo();
		selTest.crawl();
	}

	private WebDriver driver;

	public static final String WebDrive_ID = "webdriver.chrome.driver";
	public static final String WebDriver_PATH = "C:\\Users\\82105\\git\\1027\\delivery\\chromedriver.exe";

	private String url;

	public CrawlingRestaruntInfo() {
		super();
		
		System.setProperty(WebDriver_PATH, WebDrive_ID);
		
		driver = new ChromeDriver();
		url = "https://www.siksinhot.com/P/56310";
		
	}

	public void crawl() {
		
		try {
			driver.get(url);
			
			WebElement element = driver.findElement(By.cssSelector("div.info_text"));
            String extractedText = element.getText();
            System.out.println("Extracted Text: " + extractedText);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.close();
        }
    }
		 
	
}