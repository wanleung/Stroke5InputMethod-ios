//
//  Stroke5Database.h
//  Stroke5InputMethod
//
//  Created by Wan Leung Wong on 1/7/14.
//  Copyright (c) 2014 Wan Leung Wong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stroke5Database : NSObject
+ (Stroke5Database *)database;

- (NSArray *)stroke5Char:(NSString *)code;
- (NSArray *)phase:(NSString *)stroke5Char;

@end
