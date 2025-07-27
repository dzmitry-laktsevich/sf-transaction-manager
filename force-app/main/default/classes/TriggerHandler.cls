/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

 /**
 * @description This class provides utility methods to check the execution status of Apex Trigger Handlers.
 * It interacts with the DmlHandler to determine whether specific trigger handlers are enabled or disabled.
 */
public with sharing class TriggerHandler {

    @InvocableMethod(label='Check Trigger Execution Status' description='Returns whether Trigger execution is enabled or disabled' category='Trigger Execution')
    public static List<Boolean> isEnabled(List<String> triggerHandlerName) {
        return DmlHandler.isEnabled(triggerHandlerName,DmlHandler.triggerNameToStatus, DmlHandler.areTriggerHandlersEnabledByDefault);
    }

    /**
     * @description Checks if a specific Apex Trigger Handler is enabled.
     * @param triggerHandler The trigger handler object to check.
     * @return Boolean indicating whether the trigger handler is enabled.
     */
    public static Boolean isEnabled(Object triggerHandler) {
        String handlerClassFullName = String.valueOf(triggerHandler);
        System.debug('Checking if handler is enabled: ' + handlerClassFullName);

        String handlerClassName = handlerClassFullName.substringBefore(':');
        return isEnabled(new List<String>{ handlerClassName })[0];
    }
}
