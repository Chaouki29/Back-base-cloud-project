package BBC_project;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.junit.Assert;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class StepDiff {
    WebDriver driver;

    @Given("User on login page")
    public void user_on_log_in_page() {
        WebDriverManager.chromedriver().setup();
        driver = new ChromeDriver();
        driver.get("https://qa-task.backbasecloud.com/");
    }

    @Given("the user {string} logs in with password {string}")
    public void the_user_logs_in_with_password(String email, String password) {
        driver.findElement(By.id("email_locator")).sendKeys(email);
        driver.findElement(By.id("password_locator")).sendKeys(password);
        driver.findElement(By.id("sign_btn_locator")).click();
    }

    @And("the user goes/navigate to {string} profile/page")
    public void theUserGoesToPage(String pageName) {
        pageName = pageName.toLowerCase();
        switch (pageName) {
            case "new post":
                driver.findElement(By.id("new_post_locator")).click();
                break;
        }
    }

    @And("the user fills {string} with {string}")
    public void theUserFillsWith(String text_filed, String value) {
        text_filed = text_filed.toLowerCase();
        switch (text_filed) {
            case "article title":
                driver.findElement(By.id("new_post_locator")).sendKeys(value);
                break;
            case "what is article about":
                driver.findElement(By.id("what_is_article_about_locator")).sendKeys(value);
                break;
            case "write your article":
                driver.findElement(By.id("write_your_article_locator")).sendKeys(value);
                break;
            case "enter tags":
                driver.findElement(By.id("enter_tags_locator")).sendKeys(value);
                break;
        }
    }

    @And("the user clicks on {string} button/link/tab")
    public void theUserClicksOnButton(String btn_name) {
        btn_name = btn_name.toLowerCase();
        switch (btn_name) {
            case "publish article":
                driver.findElement(By.id("publish_article_locator")).click();
                break;
            case "edit article":
                driver.findElement(By.id("edit_article_locator")).click();
                break;
            case "favorited articles":
                driver.findElement(By.id("Favorited_Articles_locator")).click();
                break;
            case "delete article":
                driver.findElement(By.id("Delete_Article_locator")).click();
                break;
            case "global feed":
                driver.findElement(By.id("Global_Feed_locator")).click();
                break;
        }
    }

    @And("the user navigate to {string} article")
    public void theUserNavigateToArticle(String name) {
        driver.findElement(By.xpath("//*[.='" + name + "']_locator")).click();
    }

    @Then("the user should/(should not) (be on)/see {string} button/page/tab/article/profile")
    public void theUserShouldSeeButton(String text) {
        Assert.assertEquals(text, driver.findElement(By.xpath("//*[.='" + text + "']_locator")).getText());
    }
}