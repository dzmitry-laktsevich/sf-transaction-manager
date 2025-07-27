/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

@IsTest
private class FlowActionEnableAllTriggerHandlersTest {
    @IsTest static void testEnableAllTriggerHandlers() {
        Test.startTest();
        FlowActionEnableAllTriggerHandlers.enableAll();
        Test.stopTest();

        Assert.isTrue(DmlHandler.areTriggerHandlersEnabledByDefault, 'All trigger handlers should be enabled');
    }
}
