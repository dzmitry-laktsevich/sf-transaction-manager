/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

@IsTest
private class FlowActionDisableAllFlowsTest {
    @IsTest static void testDisableAllFlows() {
        Test.startTest();
        FlowActionDisableAllFlows.disableAllRecordTriggeredFlows();
        Test.stopTest();

        Assert.isFalse(DmlHandler.areFlowsEnabledByDefault, 'All flows should be disabled');
    }
}
