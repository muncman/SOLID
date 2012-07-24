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
    instance = [[MUConcept alloc] initWithInitial:@"X" acronym:@"XOM" name:@"Xander Orion Munc" description:@"My son's initials"];
}

- (void)tearDown {
    instance = nil;
    [super tearDown];
}

- (void)testThatTheObjCRuntimeWorksAsExpectedForConceptModels {
    STAssertEqualObjects(@"X", instance.initial, nil);
    STAssertEqualObjects(@"XOM", instance.acronym, nil);
    STAssertEqualObjects(@"Xander Orion Munc", instance.name, nil);
    STAssertEqualObjects(@"My son's initials", instance.textDescription, nil);
}

@end

// For helping avoid CLI issues.
//#include <stdio.h>
//// Prototype declarations
//FILE *fopen$UNIX2003( const char *filename, const char *mode );
//size_t fwrite$UNIX2003( const void *a, size_t b, size_t c, FILE *d );
//
//FILE *fopen$UNIX2003( const char *filename, const char *mode ) {
//    return fopen(filename, mode);
//}
//size_t fwrite$UNIX2003( const void *a, size_t b, size_t c, FILE *d ) {
//    return fwrite(a, b, c, d);
//}
