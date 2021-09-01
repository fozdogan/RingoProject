package com.ringo.steps;

import com.ringo.pages.RegisterPage;
import com.ringo.utilities.BrowserUtils;
import com.ringo.utilities.ConfigurationReader;
import com.ringo.utilities.Driver;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;

public class StepDefinitions {
    RegisterPage registerPage = new RegisterPage();

    @Given("Customer is on the register page")
    public void customerIsOnTheRegisterPage() {
        Driver.get().get(ConfigurationReader.get("url"));
    }

    @When("^Customer enters (.*), (.*) and (.*)$")
    public void customerEntersAnd(String mobileNumber, String email, String password) {
        registerPage.phoneInput.sendKeys(mobileNumber);
        registerPage.emailInput.sendKeys(email);
        registerPage.passwordInput.sendKeys(password);
    }

    @Then("Customer click to updates buttons and Terms & Conditions")
    public void customerClickToUpdatesButtonsAndTermsConditions() {
        BrowserUtils.clickWithJS(registerPage.updates1);

        registerPage.updates2.click();
        registerPage.terms.click();
        registerPage.nextBtn.click();
    }

    @Then("^Customer should see (.*) messages$")
    public void customerShouldSeeMessages(String expectedText) {
        if (expectedText.contains("email")) {
            BrowserUtils.scrollToElement(registerPage.emailText);
            String actualText = registerPage.emailText.getText();
            assertThat(expectedText, is(actualText));

        } else if (expectedText.contains("number")) {

            BrowserUtils.scrollToElement(registerPage.phoneText);
            String actualText = registerPage.phoneText.getText();
            assertThat(expectedText, is(actualText));


        } else if (expectedText.contains("password")) {
            BrowserUtils.scrollToElement(registerPage.passwordText);
            String actualText = registerPage.passwordText.getText();
            assertThat(expectedText, is(actualText));

        }

    }

    @Then("Customer should see login page")
    public void customerShouldSeeLoginPage() {
    }
}
