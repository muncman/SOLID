//
//  MUConcept.h
//  SOLID
//
//  Created by Kevin Munc on 7/8/12.
//  Copyright (c) 2012 Method Up. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MUConcept : NSObject

@property (nonatomic, strong, readonly) NSString *initial;
@property (nonatomic, strong, readonly) NSString *acronym;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *textDescription;

// Designated Initializer
- (id)initWithInitial:(NSString *)theInitial acronym:(NSString *)theAcronym name:(NSString *)theName description:(NSString *)theDescription;

@end
