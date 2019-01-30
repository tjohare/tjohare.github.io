Generally speaking, tests should not be dependent on running in a specific order.   Test should be able to be run in a stand-alone fashion or in conjunction with others.   However, under some conditions, a test execution order may be necessary

There are 2 methods that can control an order of execution for test methods.  

- FixMethodOrder
- SuiteClasses

### FixMethodOrder
Test execution order can be defined by the @FixMethodOrder keyword value within the test suite.  By invoking the keyword along with a method sorter variable, tests will be executed that fashion.  

For example, this will run tests in alphabetical ascending name order
```sh
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.rules.TestName;
import org.junit.runners.MethodSorters;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ShareAPITests {
...
}
```

### Suite Classes
Another method for controlling the test execution order is by suite classes.    Within the test suite, you define your suite class as follows:
```sh
@RunWith(Suite.class)
@Suite.SuiteClasses({Test1.class,
                    Test2.class,
                    Test3.class,
                    Test4.class,
                    Test5.class
})
public class TestSuite {
...
}
```
