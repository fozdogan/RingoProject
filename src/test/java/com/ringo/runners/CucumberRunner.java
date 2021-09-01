package com.ringo.runners;


import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        plugin = {"json:cucumber.json",
                  "html:target/cucumber",
                "rerun:target/rerun.txt",
                "de.monochromata.cucumber.report.PrettyReports:target/cucumber"},


        features = "src/test/resources/features",
        glue = "com.ringo.steps",
        dryRun = false,
        tags = "@register"
)
public class CucumberRunner {
}
