/**
 * @description Unit tests for TransactionIntegrityValidator covering positive,
 * negative, and bulk validation scenarios.
 */
@isTest
private class TransactionIntegrityValidatorTest {

    @isTest
    static void testValidateTransactions_PositiveScenario() {
        Account acc = new Account(Name = 'Test Integrity Account');
        insert acc;

        Test.startTest();
        List<TransactionIntegrityValidator.ValidationResult> results =
            TransactionIntegrityValidator.validateTransactions(new List<SObject>{ acc });
        Test.stopTest();

        System.assertEquals(1, results.size(), 'Expected exactly one validation result.');
        System.assertEquals(true, results[0].isValid, 'Record with a valid Id should pass validation.');
        System.assertEquals('Passed', results[0].status, 'Status should be Passed.');
    }

    @isTest
    static void testValidateTransactions_NegativeScenario() {
        Account acc = new Account(Name = 'Unsaved Account');

        Test.startTest();
        List<TransactionIntegrityValidator.ValidationResult> results =
            TransactionIntegrityValidator.validateTransactions(new List<SObject>{ acc });
        Test.stopTest();

        System.assertEquals(1, results.size(), 'Expected exactly one validation result.');
        System.assertEquals(false, results[0].isValid, 'Record without an Id should fail validation.');
        System.assertEquals('Failed', results[0].status, 'Status should be Failed.');
    }

    @isTest
    static void testValidateTransactions_BulkScenario() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 200; i++) {
            accounts.add(new Account(Name = 'Bulk Account ' + i));
        }
        insert accounts;

        Test.startTest();
        List<TransactionIntegrityValidator.ValidationResult> results =
            TransactionIntegrityValidator.validateTransactions(accounts);
        Test.stopTest();

        System.assertEquals(200, results.size(), 'Expected a validation result for each bulk record.');
        for (TransactionIntegrityValidator.ValidationResult result : results) {
            System.assertEquals(true, result.isValid, 'All bulk-inserted records should pass validation.');
        }
    }

    @isTest
    static void testValidateTransactions_EmptyList() {
        Test.startTest();
        List<TransactionIntegrityValidator.ValidationResult> results =
            TransactionIntegrityValidator.validateTransactions(new List<SObject>());
        Test.stopTest();

        System.assertEquals(0, results.size(), 'Empty input should return an empty result list.');
    }
}