/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

/**
 * @description This class provides functionality to disable specific Record-Triggered Flows by name
 * within the current transaction. It extends the TransactionManager to leverage
 * transactional control for disabling flows.
 */
public with sharing class FlowActionDisableFlow {

    /**
     * @description Disables the specific Record-Triggered Flow by name within the current transaction.
     * @param flowName List of flow names to disable. Each name should match the API name of the flow.
     */
    @InvocableMethod(label='Disable Flow by Name' description='Disables the specific Record-Triggered Flow' category='Flow Execution')
    public static void disableRecordTriggeredFlow(List<String> flowName) {
        TransactionManager.disableFlows(flowName);
    }
}
