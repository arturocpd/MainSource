@isTest
public class TestClass1 {
    @isTest
    static void testMethod1() {
        Integer result = ClassToBeTested.addNumbers(2, 3);
        System.assertEquals(5, result);
    }
}