In Objective-C, a common yet subtle error arises when dealing with `NSManagedObjectContext` and its interaction with threads.  Specifically, attempting to save changes to the context from a thread other than the one on which it was created can lead to unexpected crashes or data corruption.  This is because the context isn't thread-safe. Here's an example illustrating the problem:

```objectivec
// Incorrect: Saving the context from a background thread
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{ 
    [managedObjectContext save:&error]; //Potential Crash or Data Corruption
});
```