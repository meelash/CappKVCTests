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
            myObject    testClassObject;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
}

- (void)awakeFromCib
{
    testClassObject = [[myObject alloc] init];

    //bug with operators in key path....
    console.log(@"FIRST TEST- WORKS");
    var data = [testClassObject valueForKey:@"scoreArray"];
    console.log(data);
    console.log([data valueForKeyPath:@"@sum.intValue"]);

    console.log(@"SECOND TEST- DOESN'T WORK");
    console.log([testClassObject valueForKeyPath:@"scoreArray.@sum.intValue"]);
}

@end


@implementation myObject : CPObject
{
            CPArray         scoreArray @accessors(readonly);
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