/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

@IsTest
private class FlowActionDisableFlowTest {
    @IsTest static void testDisableFlow() {
        String flowName = 'TestFlow';
        List<String> flowNames = new List<String>{flowName};

        Test.startTest();
        FlowActionDisableFlow.disableRecordTriggeredFlow(flowNames);
        Test.stopTest();

        Assert.isFalse(FlowHandler.isEnabled(flowNames)[0], 'Flow should be disabled');
    }
}
