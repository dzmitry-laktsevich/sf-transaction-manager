/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

@IsTest
private class AccountTriggerExampleTest {
    @IsTest static void testAccountTrigger() {
        Account acc = new Account(Name = 'Test Account');

        Test.startTest();
        insert acc;
        Test.stopTest();

        Assert.isNotNull(acc.Id, 'Account should be inserted successfully');
    }
}
