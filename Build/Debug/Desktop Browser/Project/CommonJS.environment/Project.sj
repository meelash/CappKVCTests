@STATIC;1.0;p;15;AppController.jI;21;Foundation/CPObject.jc;3120;
{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("theWindow"), new objj_ivar("testClassObject")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("theWindow"), function $AppController__theWindow(self, _cmd)
{ with(self)
{
return theWindow;
}
},["id"]),
new objj_method(sel_getUid("setTheWindow:"), function $AppController__setTheWindow_(self, _cmd, newValue)
{ with(self)
{
theWindow = newValue;
}
},["void","id"]), new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{ with(self)
{
}
},["void","CPNotification"]), new objj_method(sel_getUid("awakeFromCib"), function $AppController__awakeFromCib(self, _cmd)
{ with(self)
{
    testClassObject = objj_msgSend(objj_msgSend(myObject, "alloc"), "init");
    console.log("FIRST TEST- WORKS");
    var data = objj_msgSend(testClassObject, "valueForKey:", "scoreArray");
    console.log(data);
    console.log(objj_msgSend(data, "valueForKeyPath:", "@sum.intValue"));
    console.log("SECOND TEST- DOESN'T WORK");
    console.log(objj_msgSend(testClassObject, "valueForKeyPath:", "scoreArray.@sum.intValue"));
    alert(objj_msgSend(testClassObject, "valueForKeyPath:", "workingArray.@avg.classID"));
}
},["void"])]);
}
{var the_class = objj_allocateClassPair(CPObject, "myObject"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("scoreArray"), new objj_ivar("JSONString"), new objj_ivar("workingArray")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("scoreArray"), function $myObject__scoreArray(self, _cmd)
{ with(self)
{
return scoreArray;
}
},["id"]), new objj_method(sel_getUid("init"), function $myObject__init(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init"))
    {
        scoreArray = [1, 1, 1, 1, 1, 1, 1, 1, 1];
        JSONString = '[{"classID":5,"className":"test","requireInstructorApproval":1},{"classID":6,"className":"test1","requireInstructorApproval":1},{"classID":7,"className":"test2","requireInstructorApproval":1},{"classID":8,"className":"test3","requireInstructorApproval":0}]';
        var objectRepresentation = objj_msgSend(JSONString, "objectFromJSON");
        workingArray = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
        for (i=0; i<objectRepresentation.length; i++)
        {
            var testDictionary = objj_msgSend(CPDictionary, "dictionaryWithJSObject:recursively:", objectRepresentation[i], YES);
            alert(objj_msgSend(testDictionary, "valueForKeyPath:", "classID"));
            objj_msgSend(workingArray, "addObject:", testDictionary);
        }
        alert(objj_msgSend(workingArray, "valueForKeyPath:", "@avg.classID"));
    }
    return self;
}
},["void"])]);
}

p;6;main.jI;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jc;78;
main= function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}

e;