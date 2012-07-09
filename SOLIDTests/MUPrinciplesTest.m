//
//  MUPrinciplesTest.m
//  SOLID
//
//  Created by Kevin Munc on 7/8/12.
//  Copyright (c) 2012 Method Up. All rights reserved.
//

#import "MUPrinciplesTest.h"
#import "MUPrinciples.h"
#import "MUConcept.h"

@implementation MUPrinciplesTest

- (void)setUp {
    [super setUp];
    instance = [[MUPrinciples alloc] init];
}

- (void)tearDown {
    instance = nil;
    [super tearDown];
}

- (void)testInitialsSequenceWhichCannotPossibleFailAnyway {
    NSArray *keys = instance.initials;
    STAssertEqualObjects(@"S", [keys objectAtIndex:0], nil);
    STAssertEqualObjects(@"O", [keys objectAtIndex:1], nil);
    STAssertEqualObjects(@"L", [keys objectAtIndex:2], nil);
    STAssertEqualObjects(@"I", [keys objectAtIndex:3], nil);
    STAssertEqualObjects(@"D", [keys objectAtIndex:4], nil);
}

- (void)testAcronymsAreReturnedInSequence {
    NSArray *acros = instance.acronyms;
    STAssertEqualObjects(@"SRP", [acros objectAtIndex:0], nil);
    STAssertEqualObjects(@"OCP", [acros objectAtIndex:1], nil);
    STAssertEqualObjects(@"LSP", [acros objectAtIndex:2], nil);
    STAssertEqualObjects(@"ISP", [acros objectAtIndex:3], nil);
    STAssertEqualObjects(@"DIP", [acros objectAtIndex:4], nil);
}

- (void)testThatTheNumberOfInitialsMatchesTheNumberOfAcronyms {
    int numOfInitials = [instance.initials count];
    int numOfAcronyms = [instance.acronyms count];
    STAssertEquals(numOfInitials, numOfAcronyms, nil);
}

- (void)testADescription {
    NSString *expected = @"Depend on abstractions, not on concretions.";
    NSString *actual = [instance conceptForInitial:@"D"].textDescription;
    STAssertEqualObjects(expected, actual, nil);
}

@end
