/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

/**
 * @description This class provides functionality to disable specific Apex Trigger handlers by name
 * within the current transaction. It extends the TransactionManager to leverage
 * transactional control for disabling trigger handlers.
 */
public with sharing class FlowActionDisableTriggerHandler {

    /**
     * @description Disables the specific Apex Trigger Handler by name within the current transaction.
     * @param triggerHandlerName List of trigger handler names to disable. Each name should match the API name of the trigger.
     */
    @InvocableMethod(label='Disable Trigger Handler by Name' description='Disables the specific Apex Trigger handler' category='Trigger Execution')
    public static void disableTriggerHandler(List<String> triggerHandlerName) {
       TransactionManager.disableTriggerHandlers(triggerHandlerName);
    }
}
