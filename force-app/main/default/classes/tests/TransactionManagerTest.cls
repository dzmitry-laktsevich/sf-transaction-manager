/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

@IsTest
private class TransactionManagerTest {
    @IsTest static void testEnableAllFlows() {
        Test.startTest();
        TransactionManager.enableAllFlows();
        Test.stopTest();

        Assert.isTrue(DmlHandler.areFlowsEnabledByDefault, 'All flows should be enabled.');
    }

    @IsTest static void testDisableAllFlows() {
        Test.startTest();
        TransactionManager.disableAllFlows();
        Test.stopTest();

        Assert.isFalse(DmlHandler.areFlowsEnabledByDefault, 'All flows should be disabled.');
    }
}
