/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

/**
 * @description This class provides functionality to enable all Apex Trigger handlers
 * within the current transaction. It extends the TransactionManager to leverage
 * transactional control for enabling trigger handlers.
 */
public with sharing class FlowActionEnableAllTriggerHandlers {

    /**
     * @description Enables all Apex Trigger Handlers within the current transaction.
     * This method ensures that all triggers are activated for execution.
     */
    @InvocableMethod(label='Enable all Trigger Handlers' description='Enables all execution of Apex Trigger handlers' category='Trigger Execution')
    public static void enableAll() {
        TransactionManager.enableAllTriggerHandlers();
    }
}
