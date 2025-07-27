/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

@IsTest
private class FlowActionEnableFlowTest {
    @IsTest static void testEnableFlow() {
        String flowName = 'TestFlow';
        List<String> flowNames = new List<String>{flowName};
        
        DmlHandlerStatus status = new DmlHandlerStatus();
        status.isEnabled = false;
        status.handlerName = flowName;
        DmlHandler.flowNameToStatus.put(flowName, status);

        Test.startTest();
        FlowActionEnableFlow.enableRecordTriggeredFlow(flowNames);
        Test.stopTest();

        Assert.isTrue(FlowHandler.isEnabled(flowNames)[0], 'Flow should be enabled');
    }
}
