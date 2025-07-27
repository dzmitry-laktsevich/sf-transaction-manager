/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

/**
 * @description This class provides utility methods to check the execution status of Record-Triggered Flows.
 * It interacts with the DmlHandler to determine whether specific flows are enabled or disabled.
 */
public with sharing class FlowHandler {

    @InvocableMethod(label='Check Flow Execution Status' description='Returns whether flow execution is enabled or disabled' category='Flow Execution')
    public static List<Boolean> isEnabled(List<String> flowName) {
        return DmlHandler.isEnabled(flowName, DmlHandler.flowNameToStatus, DmlHandler.areFlowsEnabledByDefault);
    }
}
