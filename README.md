# SF Transaction Manager

This package provides a set of Apex classes and utilities to manage the execution of Salesforce Flows and Triggers programmatically **during the transaction execution**. It is designed to help developers enable or disable specific or all Flows and Triggers within the scope of a single transaction, offering fine-grained control over DML operations.

## How to Use

1. Clone this repository and deploy the classes to your Salesforce org.
2. Use the provided methods of `TransactionManager` class in your automation scripts, tests, or custom logic to control Flows and Triggers.
3. Invoke the invocable methods within `Flow Execution`, `Trigger Execution` categories directly from Salesforce Flows to integrate these utilities into declarative automation.
4. **IMPORTANT**: modify your Trigger Handlers and Record-Triggered Flows to allow disabling them.

### Example: Configuaring a Record-Triggered Flow

- **Flow Setup**:
  - Add the `Check Flow Execution Status` Apex Action to your Flow. And set the `flowName` input parameter to the API Name of the Flow.
  - Use the output of the Apex Action in a decision element to determine whether to proceed with the Flow logic or exit.
  - The `FlowHandler Example` Flow Template can be used as a reference for setting up your Flow.


- **Trigger Handler Setup**:
  - Use the `isEnabled` method in your Apex Trigger Handler to check if `this` Trigger Handler is enabled before processing records.
  - Example:
    ```apex
    public void handleTriggerEvents() {
        if (TriggerHandler.isEnabled(this)) {
            // Handle the trigger events here
            System.debug('Enabled, processing records.');
        } else {
            System.debug('Disabled, skipping processing.');
        }
    }
    ```

5. Refer to the ApexDoc comments in the code for detailed documentation of each method and class.

## Key Features

- **Enable/Disable Specific Trigger Handlers**: Use the provided methods to enable or disable specific Apex Trigger andlers by name during a transaction.
- **Enable/Disable Specific Flows**: Programmatically control the execution of specific Record-Triggered Flows during a transaction.
- **Global Control Within a Transaction**: Enable or disable all Triggers or Flows within the scope of a single transaction.
- **Transaction Management**: Core utilities for managing transactional behavior of Flows and Triggers.
- **Flow Integration**: These utilities can be invoked directly from Salesforce Flows using invocable methods, enabling seamless integration into declarative automation.

## Classes Overview

- **TransactionManager**: Core class for managing transactional behavior of Flows and Triggers.
- **DmlHandler**: Utility class for managing the enabled status of Flows and Trigger Handlers.
- **FlowActionEnableTriggerHandler**: Enables specific Apex Trigger Handlers by name.
- **FlowActionDisableTriggerHandler**: Disables specific Apex Trigger Handlers by name.
- **FlowActionEnableFlow**: Enables specific Record-Triggered Flows by name.
- **FlowActionDisableFlow**: Disables specific Record-Triggered Flows by name.
- **FlowActionEnableAllTriggerHandlers**: Enables all Apex Trigger Handlers within a transaction.
- **FlowActionDisableAllTriggerHandlers**: Disables all Apex Trigger Handlers within a transaction.
- **FlowActionEnableAllFlows**: Enables all Record-Triggered Flows within a transaction.
- **FlowActionDisableAllFlows**: Disables all Record-Triggered Flows within a transaction.

## Documentation

Refer to the ApexDoc comments in the code for detailed usage instructions and examples. For more information about Salesforce development, see the [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm), which includes links to the Salesforce CLI Setup Guide, Command Reference, and Extensions Documentation.

### Note

Any Salesforce Flow that supports Apex Actions can leverage the functionality provided by this library. This includes Record-Triggered Flows, Auto-Launched Flows, and other Flow types that allow invoking Apex Actions.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
