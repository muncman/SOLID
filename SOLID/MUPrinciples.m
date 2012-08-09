//
//  MUPrinciples.m
//  SOLID
//
//  Created by Kevin Munc on 7/8/12.
//  Copyright (c) 2012 Method Up. All rights reserved.
//

/** This class demonstrates AppleDoc.
 
 A second paragraph comes after an empty line.
 
 int i=0;
 i++;
 
 And some sample code can also be in a block, but indented with a TAB.
 
 You can also add lists, but have to keep an empty line between these blocks.
 
 - One
 - Two
 - Three
 */

#import "MUPrinciples.h"
#import "MUConcept.h"

@interface MUPrinciples() {
    NSDictionary *_concepts;
    NSArray *_keysInSequence;
    NSArray *_acronymsInSequence;
}
@end

// TODO: This TODO is here so CI can find one.

@implementation MUPrinciples

- (id)init {
    if (self = [super init]) {
        MUConcept *single = [[MUConcept alloc] 
                             initWithInitial:@"S"                           
                             acronym:@"SRP"                    
                             name:NSLocalizedString(@"Single Responsibility Principle", nil) 
                             description:NSLocalizedString(@"An object should have only a single responsibility. "
                                                           "A class should have one, and only one, reason to change.", 
                                                           @"SRP description")];
        MUConcept *openClosed = [[MUConcept alloc] 
                                 initWithInitial:@"O"            
                                 acronym:@"OCP" 
                                 name:NSLocalizedString(@"Open/Closed Principle", nil) 
                                 description:NSLocalizedString(@"Software entities should be open for extension, but closed for modification. "
                                                               "You should be able to extend a classes behavior, without modifying it.",                                   
                                                               @"OCP description.")];
        MUConcept *liskov = [[MUConcept alloc] 
                             initWithInitial:@"L"            
                             acronym:@"LSP" 
                             name:NSLocalizedString(@"Liskov Substitution Principle", nil) 
                             description:NSLocalizedString(@"Objects in a program should be replaceable with instances of their subtypes "
                                                           "without altering the correctness of that program. "
                                                           "Derived classes must be substitutable for their base classes.",       
                                                           @"LSP description.")];
        MUConcept *interface = [[MUConcept alloc] 
                                initWithInitial:@"I" 
                                acronym:@"ISP" 
                                name:NSLocalizedString(@"Interface Segregation Principle", nil) 
                                description:NSLocalizedString(@"Many client specific interfaces are better than one general purpose interface. "
                                                              "Make fine grained interfaces that are client specific.",         
                                                              @"ISP description.")];
        MUConcept *dependency = [[MUConcept alloc] 
                                 initWithInitial:@"D" 
                                 acronym:@"DIP" 
                                 name:NSLocalizedString(@"Dependency Inversion Principle", nil) 
                                 description:NSLocalizedString(@"Depend on abstractions, not on concretions.", 
                                                               @"DIP description.")];
        NSArray *values = [NSArray arrayWithObjects:single, openClosed, liskov, interface, dependency, nil];
        _keysInSequence = [NSArray arrayWithObjects:@"S", @"O", @"L", @"I", @"D", nil];
        _acronymsInSequence = [NSArray arrayWithObjects:@"SRP", @"OCP", @"LSP", @"ISP", @"DIP", nil];
        // The following is for demo use for CocoaConf Columbus 2012.
//        MUConcept *cocoaconf = [[MUConcept alloc] 
//                                initWithInitial:@"C" 
//                                acronym:@"ACC" 
//                                name:NSLocalizedString(@"Attend CocoaConf", nil) 
//                                description:NSLocalizedString(@"Attend CocoaConf to learn more principles, patterns "
//                                                              "and techniques for iOS and Mac development!", 
//                                                              @"ACC description.")];
//        NSArray *values = [NSArray arrayWithObjects:single, openClosed, liskov, interface, dependency, cocoaconf, nil];
//        _keysInSequence = [NSArray arrayWithObjects:@"S", @"O", @"L", @"I", @"D", @"C", nil];
//        _acronymsInSequence = [NSArray arrayWithObjects:@"SRP", @"OCP", @"LSP", @"ISP", @"DIP", @"ACC", nil];
        _concepts = [NSDictionary dictionaryWithObjects:values forKeys:_keysInSequence];
    }
    return self;
}

- (NSArray *)initials {
    return [_keysInSequence copy];
}

- (NSArray *)acronyms {
    return [_acronymsInSequence copy];
}

/** This method looks up a concept given the initial.
 
 @param string The single first letter of the concept.
 @return The matching concept, if found; nil otherwise.
 */
- (MUConcept *)conceptForInitial:(NSString *)initial {
    return [_concepts valueForKey:initial];
}

// FIXME: This task marker is here so CI can find another one.
// TODO: If time -or eventually- integrate CPD into the CI server to find this.
- (void)unusedMethodWithDuplicatedStatementsToTriggerCPDForCI
{
    MUConcept *single = [[MUConcept alloc]
                         initWithInitial:@"S"
                         acronym:@"SRP"
                         name:NSLocalizedString(@"Single Responsibility Principle", nil)
                         description:NSLocalizedString(@"An object should have only a single responsibility. "
                                                       "A class should have one, and only one, reason to change.",
                                                       @"SRP description")];
    MUConcept *openClosed = [[MUConcept alloc]
                             initWithInitial:@"O"
                             acronym:@"OCP"
                             name:NSLocalizedString(@"Open/Closed Principle", nil)
                             description:NSLocalizedString(@"Software entities should be open for extension, but closed for modification. "
                                                           "You should be able to extend a classes behavior, without modifying it.",
                                                           @"OCP description.")];
    MUConcept *liskov = [[MUConcept alloc]
                         initWithInitial:@"L"
                         acronym:@"LSP"
                         name:NSLocalizedString(@"Liskov Substitution Principle", nil)
                         description:NSLocalizedString(@"Objects in a program should be replaceable with instances of their subtypes "
                                                       "without altering the correctness of that program. "
                                                       "Derived classes must be substitutable for their base classes.",
                                                       @"LSP description.")];
    MUConcept *interface = [[MUConcept alloc]
                            initWithInitial:@"I"
                            acronym:@"ISP"
                            name:NSLocalizedString(@"Interface Segregation Principle", nil)
                            description:NSLocalizedString(@"Many client specific interfaces are better than one general purpose interface. "
                                                          "Make fine grained interfaces that are client specific.",
                                                          @"ISP description.")];
    MUConcept *dependency = [[MUConcept alloc]
                             initWithInitial:@"D"
                             acronym:@"DIP"
                             name:NSLocalizedString(@"Dependency Inversion Principle", nil)
                             description:NSLocalizedString(@"Depend on abstractions, not on concretions.",
                                                           @"DIP description.")];
    // NOTE: Unused on purpose for CI report(s).
    NSArray *unused = [NSArray arrayWithObjects:single, openClosed, liskov, interface, dependency, nil];
    
}

@end

