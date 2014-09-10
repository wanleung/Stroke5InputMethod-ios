//
//  Stroke5Database.m
//  Stroke5InputMethod
//
//  Created by Wan Leung Wong on 1/7/14.
//  Copyright (c) 2014 Wan Leung Wong. All rights reserved.
//

#import "Stroke5Database.h"

#import <sqlite3.h>

@interface Stroke5Database ()
@property (nonatomic, assign) sqlite3 *database;
@end

static Stroke5Database *stroke5Database;

@implementation Stroke5Database

+ (Stroke5Database*)database {
    if (stroke5Database == nil) {
        stroke5Database = [[Stroke5Database alloc] init];
    }
    return stroke5Database;
}

- (id)init {
    if ((self = [super init])) {
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"stroke5"
                                                             ofType:@"sqlite3"];
        
        if (sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK) {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}

- (NSArray *)stroke5Char:(NSString *)code {
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT chchar from chars where code GLOB ? GROUP BY chchar ORDER BY _id";
    sqlite3_stmt *statement;
    
    int rc;
    
    rc = sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil);
    
    if(rc != SQLITE_OK) {
        NSLog(@"SQL ERROR");
        return nil;
    }
    
    rc = sqlite3_bind_text( statement, 1, [code UTF8String], -1, 0);
    
    if (rc == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            char *outc = (char *) sqlite3_column_text(statement, 0);
            NSString *outChar = [[NSString alloc] initWithUTF8String:outc];
            [retval addObject:outChar];
        }
        sqlite3_finalize(statement);
    }
    return retval;
}

- (NSArray *)phase:(NSString *)stroke5Char {
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT phase from phases where chchar = ? ORDER BY _id";
    sqlite3_stmt *statement;
    
    int rc;
    
    rc = sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil);
    
    if(rc != SQLITE_OK) {
        NSLog(@"SQL ERROR");
        return nil;
    }
    
    rc = sqlite3_bind_text( statement, 1, [stroke5Char UTF8String], -1, 0);
    
    if (rc == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            char *outc = (char *) sqlite3_column_text(statement, 0);
            NSString *outChar = [[NSString alloc] initWithUTF8String:outc];
            [retval addObject:outChar];
        }
        sqlite3_finalize(statement);
    }
    return retval;
}

@end
