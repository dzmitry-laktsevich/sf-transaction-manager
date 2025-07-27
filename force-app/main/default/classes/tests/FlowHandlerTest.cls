/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

@IsTest
private class FlowHandlerTest {
    @IsTest static void testIsEnabled() {
        String flowName = 'TestFlow';

        Test.startTest();
        Boolean isEnabled = FlowHandler.isEnabled(new List<String>{flowName})[0];
        Test.stopTest();

        Assert.isTrue(isEnabled, 'Flow should be enabled by default');
    }

    @IsTest static void testIsEnabledWhenDisabled() {
        String flowName = 'TestFlow';
        DmlHandlerStatus status = new DmlHandlerStatus();
        status.isEnabled = false;
        status.handlerName = flowName;
        DmlHandler.flowNameToStatus.put(flowName, status);

        Test.startTest();
        Boolean isEnabled = FlowHandler.isEnabled(new List<String>{flowName})[0];
        Test.stopTest();

        Assert.isFalse(isEnabled, 'Flow should be disabled');
    }
}
