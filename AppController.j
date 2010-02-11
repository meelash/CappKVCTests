/*
 * AppController.j
 * Cappuccino-KVC-tests
 *
 * Created by You on February 10, 2010.
 * Copyright 2010, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
    @outlet CPWindow    theWindow; //this "outlet" is connected automatically by the Cib
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
}

- (void)awakeFromCib
{
    console.log(@"FIRST TEST- WORKS");
    theObject = [[myObject alloc] init];
    var data = [theObject valueForKey:@"scoreArray"];
    console.log(data);
    console.log([data valueForKeyPath:@"@sum.intValue"]);

    console.log(@"SECOND TEST- DOESN'T WORK");
    theObject = [[myObject alloc] init];
    console.log([theObject valueForKeyPath:@"scoreArray.@sum.intValue"]);
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things. 
}

@end


@implementation myObject : CPObject
{
            CPArray     scoreArray @accessors(readonly);
}
- (void)init
{
    if (self = [super init])
    {
        scoreArray = [1, 1, 1, 1, 1, 1, 1, 1, 1];
    }
    return self;
}

@end