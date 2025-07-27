/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

@IsTest
private class TriggerHandlerTest {
    @IsTest static void testIsEnabled() {
        String triggerHandlerName = 'TestTrigger';

        Test.startTest();
        Boolean isEnabled = TriggerHandler.isEnabled(new List<String>{triggerHandlerName})[0];
        Test.stopTest();

        Assert.isTrue(isEnabled, 'Trigger handler should be enabled by default');
    }

    @IsTest static void testIsEnabledObject() {
        TriggerHandler mockHandler = new TriggerHandler();

        Test.startTest();
        Boolean isEnabled = TriggerHandler.isEnabled(mockHandler);
        Test.stopTest();

        Assert.isTrue(isEnabled, 'Trigger handler should be enabled by default');
    }

    @IsTest static void testIsEnabledObjectWhenDisabled() {
        TriggerHandler mockHandler = new TriggerHandler();
        
        Test.startTest();
        TransactionManager.disableTriggerHandlers(new List<String>{'TriggerHandler'});
        Boolean isEnabled = TriggerHandler.isEnabled(mockHandler);
        Test.stopTest();

        Assert.isFalse(isEnabled, 'Trigger handler should be disabled');
    }

    @IsTest static void testIsEnabledObjectWhenAllDisabled() {
        TriggerHandler mockHandler = new TriggerHandler();
        
        Test.startTest();
        TransactionManager.disableAllTriggerHandlers();
        Boolean isEnabled = TriggerHandler.isEnabled(mockHandler);
        Test.stopTest();

        Assert.isFalse(isEnabled, 'Trigger handler should be disabled when all trigger handlers are disabled');
    }
}
