/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

/**
 * @description This class provides methods to enable or disable Record-Triggered Flows and Apex Trigger Handlers
 * in a Salesforce org. It allows for bulk enabling or disabling by handler name or for all
 * handlers of a specific type. All operations are scoped to the current transaction.
 * This class relies on the DmlHandler utility for managing handler statuses.
 */
public with sharing class TransactionManager {

    /**
     * @description Disables all Record-Triggered Flows that have a decision element to skip their logic.
     * This operation affects all flows within the current transaction.
     */
    public static void disableAllFlows() {
        DmlHandler.areFlowsEnabledByDefault = false;
    }

    /**
     * @description Enables all Record-Triggered Flows that have a decision element to skip their logic.
     * This operation affects all flows within the current transaction.
     */
    public static void enableAllFlows() {
        DmlHandler.areFlowsEnabledByDefault = true;
    }

    /**
     * @description Disables all Apex Trigger Handlers that include an if statement to skip their logic.
     * This operation affects all trigger handlers within the current transaction.
     */
    public static void disableAllTriggerHandlers() {
        DmlHandler.areTriggerHandlersEnabledByDefault = false;
    }

    /**
     * @description Enables all Apex Trigger Handlers that include an if statement to skip their logic.
     * This operation affects all trigger handlers within the current transaction.
     */
    public static void enableAllTriggerHandlers() {
        DmlHandler.areTriggerHandlersEnabledByDefault = true;
    }

    /**
     * @description Disables specific Record-Triggered Flows that have a decision element to skip their logic.
     * @param flowNames List of flow names to disable. Each name should match the API name of the flow.
     * This operation is scoped to the current transaction.
     */
    public static void disableFlows(List<String> flowNames) {
        List<DmlHandlerStatus> handlerStatuses = toggleHandlerStatus(flowNames, false);
        setStatusesForHandlers(handlerStatuses, DmlHandler.flowNameToStatus);
    }

    /**
     * @description Enables specific Record-Triggered Flows that have a decision element to skip their logic.
     * @param flowNames List of flow names to enable. Each name should match the API name of the flow.
     * This operation is scoped to the current transaction.
     */
    public static void enableFlows(List<String> flowNames) {
        List<DmlHandlerStatus> handlerStatuses = toggleHandlerStatus(flowNames, true);
        setStatusesForHandlers(handlerStatuses, DmlHandler.flowNameToStatus);
    }

    /**
     * @description Disables specific Apex Trigger Handlers that include an if statement to skip their logic.
     * @param triggerHandlerNames List of trigger handler names to disable. Each name should match the API name of the trigger handler.
     * This operation is scoped to the current transaction.
     */
    public static void disableTriggerHandlers(List<String> triggerHandlerNames) {
        List<DmlHandlerStatus> handlerStatuses = toggleHandlerStatus(triggerHandlerNames, false);
        setStatusesForHandlers(handlerStatuses, DmlHandler.triggerNameToStatus);
    }

    /**
     * @description Enables specific Apex Trigger Handlers that include an if statement to skip their logic.
     * @param triggerHandlerNames List of trigger handler names to enable. Each name should match the API name of the trigger handler.
     * This operation is scoped to the current transaction.
     */
    public static void enableTriggerHandlers(List<String> triggerHandlerNames) {
        List<DmlHandlerStatus> handlerStatuses = toggleHandlerStatus(triggerHandlerNames, true);
        setStatusesForHandlers(handlerStatuses, DmlHandler.triggerNameToStatus);
    }

    private static List<DmlHandlerStatus> toggleHandlerStatus(List<String> handlerNames, Boolean isEnabled) {
        List<DmlHandlerStatus> statuses = new List<DmlHandlerStatus>();
        for (String handlerName : handlerNames) {
            DmlHandlerStatus handlerStatus = new DmlHandlerStatus();
            handlerStatus.handlerName = handlerName;
            handlerStatus.isEnabled = isEnabled;
            statuses.add(handlerStatus);
        }
        return statuses;
    }

    private static void setStatusesForHandlers(List<DmlHandlerStatus> handlerStatuses, Map<String, DmlHandlerStatus> handlerNameToStatus) {
        for (DmlHandlerStatus handlerStatus : handlerStatuses) {
            if (String.isNotBlank(handlerStatus.handlerName)) {
                handlerNameToStatus.put(handlerStatus.handlerName, handlerStatus);
            }
        }
    }
}
