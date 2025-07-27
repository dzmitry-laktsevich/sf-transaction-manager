/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

/**
 * @description This class provides functionality to enable all Record-Triggered Flows
 * within the current transaction. It extends the TransactionManager to leverage
 * transactional control for enabling flows.
 */
public with sharing class FlowActionEnableAllFlows {

    /**
     * @description Enables all Record-Triggered Flows within the current transaction.
     * This method ensures that all flows are activated for execution.
     */
    @InvocableMethod(label='Enable all Flows' description='Enables all execution of Record-Triggered Flows' category='Flow Execution')
    public static void enableAllRecordTriggeredFlows() {
        TransactionManager.enableAllFlows();
    }
}
