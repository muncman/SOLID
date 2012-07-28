//
//  MUConcept.m
//  SOLID
//
//  Created by Kevin Munc on 7/8/12.
//  Copyright (c) 2012 Method Up. All rights reserved.
//

#import "MUConcept.h"

@implementation MUConcept

@synthesize initial = _initial;
@synthesize acronym = _acronym;
@synthesize name = _name;
@synthesize textDescription = _textDescription;

// TODO: Do more of this for CI reports...
// NOTE: This initializer is here to get an analyzer warning in the CI output.
- (id)init
{
    if (self == [super init]) {
        _acronym = @"?";
        _name = @"Default";
        _textDescription = @"Default description";
    }
    return self;
}

- (id)initWithInitial:(NSString *)theInitial acronym:(NSString *)theAcronym name:(NSString *)theName description:(NSString *)theDescription {
    if (self = [super init]) {
        _initial = theInitial;
        _acronym = theAcronym;
        _name = theName;
        _textDescription = theDescription;
    }
    return self;
}

#pragma mark - Description from Accessorizer

- (NSArray *)keyPaths
{
    NSArray *result = [NSArray arrayWithObjects:
                       @"initial",
                       @"acronym",
                       @"name",
                       @"textDescription",
                       nil];
    return result;
}

- (NSString *)descriptionForKeyPaths 
{
    NSMutableString *desc = [NSMutableString string];
    [desc appendFormat:@"\nClass name: %@\n", NSStringFromClass([self class])];
    NSArray *keyPathsArray = [self keyPaths];
    for (NSString *keyPath in keyPathsArray) {
        [desc appendFormat:@"\t%@: %@\n", keyPath, [self valueForKey:keyPath]];
    }
    [desc appendString:@"\n"];
    return [NSString stringWithString:desc];
}

- (NSString *)description 
{
    return [self descriptionForKeyPaths]; 
}

@end
