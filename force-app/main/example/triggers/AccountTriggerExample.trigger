/*
 * Copyright (c) 2025. All rights reserved.
 * Licensed under the MIT License. See LICENSE file in the project root for details.
 */

trigger AccountTriggerExample on Account (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    AccountTriggerHandlerExample handler = new AccountTriggerHandlerExample();
    handler.handleTriggerEvents();
}
