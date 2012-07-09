//
//  MUConceptTest.m
//  SOLID
//
//  Created by Kevin Munc on 7/8/12.
//  Copyright (c) 2012 Method Up. All rights reserved.
//

#import "MUConceptTest.h"
#import "MUConcept.h"

@implementation MUConceptTest

- (void)setUp {
    [super setUp];
    instance = [[MUConcept alloc] initWithInitial:@"X" acronym:@"XOM" description:@"My son's initials"];
}

- (void)tearDown {
    instance = nil;
    [super tearDown];
}

- (void)testThatTheObjCRuntimeWorksAsExpectedForConceptModels {
    STAssertEqualObjects(@"X", instance.initial, nil);
    STAssertEqualObjects(@"XOM", instance.acronym, nil);
    STAssertEqualObjects(@"My son's initials", instance.textDescription, nil);
}

@end
