/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

/**
 * @description This class provides functionality to disable all Record-Triggered Flows
 * within the current transaction. It uses the TransactionManager to leverage
 * transactional control for disabling flows.
 */
public with sharing class FlowActionDisableAllFlows {

    /**
     * @description Disables all Record-Triggered Flows within the current transaction.
     * This method ensures that all flows are deactivated for execution.
     */
    @InvocableMethod(label='Disable all Flows' description='Disables all execution of Record-Triggered Flows' category='Flow Execution')
    public static void disableAllRecordTriggeredFlows() {
        TransactionManager.disableAllFlows();
    }
}
