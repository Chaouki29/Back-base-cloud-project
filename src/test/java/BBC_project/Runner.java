package BBC_project;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(strict = true,
        plugin = {"json:target/Cucumber.json"},

        features = "src/test/resources",
        glue = "BBC_project",
        dryRun = false,
        tags = "@bbc"
)
public class Runner {
}
