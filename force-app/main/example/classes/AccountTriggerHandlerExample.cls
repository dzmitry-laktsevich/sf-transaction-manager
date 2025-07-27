/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

/**
 * Example Apex Trigger Handler for Account Trigger
 */
public with sharing class AccountTriggerHandlerExample {

    public void handleTriggerEvents() {
        if (TriggerHandler.isEnabled(this)) {
            // Handle the trigger events here
            System.debug('Enabled, processing records.');

            // Example logic for disabling Flows (which includes the skip logic)
            TransactionManager.disableAllFlows();
        } else {
            System.debug('Disabled, skipping processing.');
        }
    }
}
