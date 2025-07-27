/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

@IsTest
private class FlowActionEnableTriggerHandlerTest {

    @IsTest static void testEnableTriggerHandler() {
        final String TRIGGER_HANDLER_NAME = 'Trigger1';
        List<String> triggerHandlerNames = new List<String>{TRIGGER_HANDLER_NAME};

        Test.startTest();
        FlowActionEnableTriggerHandler.enableTriggerHandler(triggerHandlerNames);
        Test.stopTest();

        Assert.isTrue(
            TriggerHandler.isEnabled(triggerHandlerNames)[0],
            'Trigger1 should be enabled after the action.'
        );
    }
}
