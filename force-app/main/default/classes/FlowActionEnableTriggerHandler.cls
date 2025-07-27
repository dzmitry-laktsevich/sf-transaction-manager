/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

/**
 * @description This class provides functionality to enable specific Apex Trigger handlers by name
 * within the current transaction. It extends the TransactionManager to leverage
 * transactional control for enabling trigger handlers.
 */
public with sharing class FlowActionEnableTriggerHandler {

    /**
     * @description Enables the specific Apex Trigger Handler by name within the current transaction.
     * @param triggerHandlerName List of trigger handler names to enable. Each name should match the API name of the trigger handler.
     */
    @InvocableMethod(label='Enable Trigger Handler by Name' description='Enables the specific Apex Trigger handler' category='Trigger Execution')
    public static void enableTriggerHandler(List<String> triggerHandlerName) {
        TransactionManager.enableTriggerHandlers(triggerHandlerName);
    }
}
