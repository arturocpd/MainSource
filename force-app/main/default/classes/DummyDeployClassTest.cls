@isTest
private class DummyDeployClassTest {
    @isTest
    static void testDoNothing() {
        DummyDeployClass.doNothing();
        System.assert(true, 'Test passed');
    }
}