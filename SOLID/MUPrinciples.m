//
//  MUPrinciples.m
//  SOLID
//
//  Created by Kevin Munc on 7/8/12.
//  Copyright (c) 2012 Method Up. All rights reserved.
//

#import "MUPrinciples.h"
#import "MUConcept.h"

@interface MUPrinciples() {
    __strong NSDictionary *_concepts;
    __strong NSArray *_keysInSequence;
    __strong NSArray *_acronymsInSequence;
}
@end

@implementation MUPrinciples

- (id)init {
    if (self == [super init]) {
        _keysInSequence = [NSArray arrayWithObjects:@"S", @"O", @"L", @"I", @"D", nil];
        _acronymsInSequence = [NSArray arrayWithObjects:@"SRP", @"OCP", @"LSP", @"ISP", @"DIP", nil];
        MUConcept *single = [[MUConcept alloc] initWithInitial:@"S" 
                                                       acronym:@"SRP" 
                                                   description:@"An object should have only a single responsibility. "
                                                                "A class should have one, and only one, reason to change."];
        MUConcept *openClosed = [[MUConcept alloc] initWithInitial:@"O" 
                                                           acronym:@"OCP" 
                                                       description:@"Software entities should be open for extension, but closed for modification. "
                                                                    "You should be able to extend a classes behavior, without modifying it."];
        MUConcept *liskov = [[MUConcept alloc] initWithInitial:@"L" 
                                                       acronym:@"LSP" 
                                                   description:@"Objects in a program should be replaceable with instances of their subtypes "
                                                                "without altering the correctness of that program. "
                                                                "Derived classes must be substitutable for their base classes."];
        MUConcept *interface = [[MUConcept alloc] initWithInitial:@"I" 
                                                          acronym:@"ISP" 
                                                      description:@"Many client specific interfaces are better than one general purpose interface. "
                                                                   "Make fine grained interfaces that are client specific."];
        MUConcept *dependency = [[MUConcept alloc] initWithInitial:@"D" 
                                                           acronym:@"DIP" 
                                                       description:@"Depend on abstractions, not on concretions."];
        NSArray *values = [NSArray arrayWithObjects:single, openClosed, liskov, interface, dependency, nil];
        _concepts = [NSDictionary dictionaryWithObjects:values forKeys:_keysInSequence];
    }
    return self;
}

- (NSArray *)initials {
    return [_keysInSequence copy];
}

- (NSArray *)acronyms {
//    NSMutableArray *abbrevs = [NSMutableArray array];
//    NSArray *values = [_concepts allValues];
//    for (MUConcept *concept in values) {
//        [abbrevs addObject:concept.acronym];
//    }
//    return abbrevs;
    return [_acronymsInSequence copy];
}

- (MUConcept *)conceptForInitial:(NSString *)initial {
    return [_concepts valueForKey:initial];
}

@end
