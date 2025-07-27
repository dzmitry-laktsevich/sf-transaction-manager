/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

/**
 * @description This class provides functionality to enable specific Record-Triggered Flows by name
 * within the current transaction. It uses the TransactionManager to leverage
 * transactional control for enabling flows.
 */
public with sharing class FlowActionEnableFlow {

    /**
     * @description Enables the specific Record-Triggered Flow by name within the current transaction.
     * @param flowName List of flow names to enable. Each name should match the API name of the flow.
     */
    @InvocableMethod(label='Enable Flow by Name' description='Enables the specific Record-Triggered Flow' category='Flow Execution')
    public static void enableRecordTriggeredFlow(List<String> flowName) {
        TransactionManager.enableFlows(flowName);
    }
}
