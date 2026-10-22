/**
 * @description Centralized Apex service class that performs integrity validation
 * on critical business transaction records before they are committed to the database.
 * This is a foundational implementation intended to be extended by future iterations
 * with richer business rules. Designed to be bulk-safe and stateless so it can be
 * invoked consistently from Flows, Triggers, and other Apex classes.
 *
 * @author Copado AI
 */
public with sharing class TransactionIntegrityValidator {

    /**
     * @description Wrapper class representing the outcome of a single record validation.
     */
    public class ValidationResult {
        public Id recordId;
        public Boolean isValid;
        public String status;
        public String message;

        public ValidationResult(Id recordId, Boolean isValid, String message) {
            this.recordId = recordId;
            this.isValid = isValid;
            this.status = isValid ? 'Passed' : 'Failed';
            this.message = message;
        }
    }

    /**
     * @description Validates a bulk collection of sObject records for basic integrity
     * conditions. This is a placeholder implementation: it confirms each record has an
     * assigned Id. Future iterations will extend this with real business validation rules.
     *
     * @param records List of sObject records to validate.
     * @return List of ValidationResult, one per input record, in the same order.
     */
    public static List<ValidationResult> validateTransactions(List<SObject> records) {
        List<ValidationResult> results = new List<ValidationResult>();

        if (records == null || records.isEmpty()) {
            return results;
        }

        for (SObject record : records) {
            try {
                Id recordId = record.Id;
                if (recordId == null) {
                    results.add(new ValidationResult(null, false, 'Record is missing a valid Id.'));
                } else {
                    results.add(new ValidationResult(recordId, true, 'Record passed integrity validation.'));
                }
            } catch (Exception ex) {
                results.add(new ValidationResult(null, false, 'Unexpected error during validation: ' + ex.getMessage()));
            }
        }

        return results;
    }
}