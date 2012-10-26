//
//  MUPrinciples.h
//  SOLID
//
//  Created by Kevin Munc on 7/8/12.
//  Copyright (c) 2012 Method Up. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MUConcept;

// Descriptions from Wikipedia: https://en.wikipedia.org/wiki/Solid_(object-oriented_design)
// and Uncle Bob: http://www.butunclebob.com/ArticleS.UncleBob.PrinciplesOfOod

@interface MUPrinciples : NSObject 

- (NSArray *)initials;
- (NSArray *)acronyms;
- (MUConcept *)conceptForInitial:(NSString *)initial;

@end
