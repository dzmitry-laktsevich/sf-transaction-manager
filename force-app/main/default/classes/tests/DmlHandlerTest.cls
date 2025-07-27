/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

@IsTest
private class DmlHandlerTest {
    @IsTest static void testIsEnabled() {
        final String HANDLER_1 = 'Handler1';
        final String HANDLER_2 = 'Handler2';

        List<String> handlerNames = new List<String>{HANDLER_1, HANDLER_2};
        Map<String, DmlHandlerStatus> handlerNameToStatus = new Map<String, DmlHandlerStatus>();
        DmlHandlerStatus status = new DmlHandlerStatus();
        status.isEnabled = true;
        status.handlerName = HANDLER_1;
        handlerNameToStatus.put(status.handlerName, status);

        status = new DmlHandlerStatus();
        status.isEnabled = false;
        status.handlerName = HANDLER_2;
        handlerNameToStatus.put(status.handlerName, status);

        Test.startTest();
        List<Boolean> results = DmlHandler.isEnabled(handlerNames, handlerNameToStatus, true);
        Test.stopTest();

        Assert.areEqual(2, results.size(), 'There should be two results.');
        Assert.isTrue(results[0], 'Handler1 should be enabled.');
        Assert.isFalse(results[1], 'Handler2 should be disabled.');
    }
}
