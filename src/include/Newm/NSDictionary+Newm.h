// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>

@interface NSDictionary(Newm)
+(NSMutableDictionary *) dictionaryFromURLEncodedQueryString:(NSString *)str;
-(NSString *) URLQueryString;
-(BOOL) isEmpty;
@end
