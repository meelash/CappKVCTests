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
// Also doesn't work:
//  console.log([testClassObject valueForKeyPath:@"@sum.scoreArray"]);
}

@end


@implementation myObject : CPObject
{
            CPArray         scoreArray @accessors(readonly);

            CPString        JSONString;
            CPArray         workingArray;
}
- (void)init
{
    if (self = [super init])
    {
        scoreArray = [1, 1, 1, 1, 1, 1, 1, 1, 1];

        JSONString = '[{"classID":5,"className":"test","requireInstructorApproval":1},{"classID":6,"className":"test1","requireInstructorApproval":1},{"classID":7,"className":"test2","requireInstructorApproval":1},{"classID":8,"className":"test3","requireInstructorApproval":0}]';
        var objectRepresentation = [JSONString objectFromJSON];
/* Doesn't work:
        var testDictionary = [CPDictionary dictionaryWithJSObject:objectRepresentation recursively:YES];
        alert([testDictionary valueForKeyPath:@"classID"]);
*/
        workingArray = [[CPArray alloc] init];
        for (i=0; i<objectRepresentation.length; i++)
        {
            var testDictionary = [CPDictionary dictionaryWithJSObject:objectRepresentation[i] recursively:YES];
            alert([testDictionary valueForKeyPath:@"classID"]);
            [workingArray addObject:testDictionary];
        }
            alert([workingArray valueForKeyPath:@"@avg.classID"]); //works!
    }
    return self;
}

@end