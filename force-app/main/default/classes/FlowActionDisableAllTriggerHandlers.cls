/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

/**
 * @description This class provides functionality to disable all Apex Trigger handlers
 * within the current transaction. It extends the TransactionManager to leverage
 * transactional control for disabling trigger handlers.
 */
public with sharing class FlowActionDisableAllTriggerHandlers {

    /**
     * @description Disables all Apex Trigger handlers within the current transaction.
     * This method ensures that all trigger handlers are deactivated for execution.
     */
    @InvocableMethod(label='Disable all Trigger Handlers' description='Disables all execution of Apex Trigger handlers' category='Trigger Execution')
    public static void disableAll() {
        TransactionManager.disableAllTriggerHandlers();
    }
}
