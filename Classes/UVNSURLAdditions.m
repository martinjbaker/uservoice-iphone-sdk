//
//  NSURLAdditions.m
//  UserVoice
//
//  Created by Mirko Froehlich on 1/12/10.
//  Copyright 2010 UserVoice Inc. All rights reserved.
//

#import "UVNSURLAdditions.h"

@implementation NSURL (ParseCategory)

- (NSString *)urlDecodeString:(NSString *)string {
	return [[string stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"+" withString:@" "];
}

- (NSDictionary *)queryDictionary {
    // Explode based on outter glue
    NSArray *firstExplode = [self.query componentsSeparatedByString:@"&"];
    NSArray *secondExplode;
	
    // Explode based on inner glue
    NSInteger count = [firstExplode count];
    NSMutableDictionary *returnDictionary = [NSMutableDictionary dictionaryWithCapacity:count];
    for (NSInteger i = 0; i < count; i++) {
        secondExplode = [(NSString *)[firstExplode objectAtIndex:i] componentsSeparatedByString:@"="];
        if ([secondExplode count] == 2) {
			[returnDictionary setObject:[self urlDecodeString:[secondExplode objectAtIndex:1]] forKey:[secondExplode objectAtIndex:0]];
        }
    }
	
    return returnDictionary;
}

@end