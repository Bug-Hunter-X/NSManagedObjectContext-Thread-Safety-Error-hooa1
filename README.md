# Objective-C NSManagedObjectContext Thread Safety Bug

This repository demonstrates a common error in Objective-C related to thread safety when using `NSManagedObjectContext`.  Attempting to save changes to the context from a background thread without proper synchronization can result in unexpected crashes or data corruption. The solution involves using performBlockAndWait or performBlock on the context's main thread.

## Bug Description
The `bug.m` file contains code that attempts to save the context from a background thread. This is incorrect and can lead to instability.

## Solution
The `bugSolution.m` file presents the corrected code, demonstrating how to safely interact with the `NSManagedObjectContext` across threads by using the appropriate methods to perform actions on the main thread.