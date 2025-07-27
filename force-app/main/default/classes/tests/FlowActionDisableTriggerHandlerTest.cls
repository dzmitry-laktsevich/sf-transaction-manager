/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

@IsTest
private class FlowActionDisableTriggerHandlerTest {

    @IsTest static void testDisableTriggerHandler() {
        final String TRIGGER_HANDLER_NAME = 'Trigger1';
        List<String> triggerHandlerNames = new List<String>{TRIGGER_HANDLER_NAME};

        Test.startTest();
        FlowActionDisableTriggerHandler.disableTriggerHandler(triggerHandlerNames);
        Test.stopTest();

        Assert.isFalse(
            TriggerHandler.isEnabled(triggerHandlerNames)[0],
            'Trigger1 should be disabled after the action.'
        );
    }
}
