/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

/**
 * @description This abstract class provides utility methods and data structures for managing the enabled status of trigger handlers and flows.
 */
public abstract with sharing class DmlHandler {
    public static Map<String, DmlHandlerStatus> triggerNameToStatus = new Map<String, DmlHandlerStatus>();
    public static Boolean areTriggerHandlersEnabledByDefault = true;
    public static Map<String, DmlHandlerStatus> flowNameToStatus = new Map<String, DmlHandlerStatus>();
    public static Boolean areFlowsEnabledByDefault = true;

    /**
     * @description Determines the enabled status for a list of handlers.
     * @param handlerNames List of handler names to check.
     * @param handlerNameToStatus Map of handler names to their statuses.
     * @param areHandlersEnabledByDefault Default enabled status for handlers.
     * @return List of boolean values indicating whether each handler is enabled.
     */
    public static List<Boolean> isEnabled(List<String> handlerNames, Map<String, DmlHandlerStatus> handlerNameToStatus, Boolean areHandlersEnabledByDefault) {
        List<Boolean> results = new List<Boolean>();
        for (String handlerName : handlerNames) {
            Boolean enabledStatus = handlerNameToStatus.containsKey(handlerName)
                ? handlerNameToStatus.get(handlerName).isEnabled
                : areHandlersEnabledByDefault;

            results.add(enabledStatus);
        }

        return results;
    }
}