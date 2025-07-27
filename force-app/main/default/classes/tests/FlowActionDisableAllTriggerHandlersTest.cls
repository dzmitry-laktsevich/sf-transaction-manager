/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

@IsTest
private class FlowActionDisableAllTriggerHandlersTest {
    @IsTest static void testDisableAllTriggerHandlers() {
        Test.startTest();
        FlowActionDisableAllTriggerHandlers.disableAll();
        Test.stopTest();

        Assert.isFalse(DmlHandler.areTriggerHandlersEnabledByDefault, 'All trigger handlers should be disabled');
    }
}
