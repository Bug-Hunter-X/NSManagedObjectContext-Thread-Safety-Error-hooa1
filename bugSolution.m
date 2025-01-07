The solution involves performing the save operation on the main thread using `performBlockAndWait:` or `performBlock:`:

```objectivec
// Correct: Use performBlockAndWait to ensure the save operation happens on the main thread
[managedObjectContext performBlockAndWait:^{ 
    NSError *error = nil;
    BOOL success = [managedObjectContext save:&error];
    if (!success) {
        NSLog("Error saving context: %@
", error);
        //Handle the error appropriately
    }
}];

//Alternative - performBlock (asynchronous):
[managedObjectContext performBlock:^{ 
    NSError *error = nil;
    BOOL success = [managedObjectContext save:&error];
    if (!success) {
        dispatch_async(dispatch_get_main_queue(), ^{ //handle error on main thread
            NSLog("Error saving context: %@
", error);
        });
    }
}];
```
This ensures that the context's internal state is managed correctly, preventing crashes and data corruption.