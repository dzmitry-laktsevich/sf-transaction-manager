/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

@IsTest
private class FlowActionEnableAllFlowsTest {
    @IsTest static void testEnableAllFlows() {
        Test.startTest();
        FlowActionEnableAllFlows.enableAllRecordTriggeredFlows();
        Test.stopTest();

        Assert.isTrue(DmlHandler.areFlowsEnabledByDefault, 'All flows should be enabled');
    }
}
