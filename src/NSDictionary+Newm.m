// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import "NSDictionary+Newm.h"
#import "NSString+Newm.h"

@implementation NSDictionary(Newm)
+(NSMutableDictionary *) dictionaryFromURLEncodedQueryString:(NSString *)str {
	NSArray *comps = [str componentsSeparatedByString:@"&"];
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:comps.count];
	int i;

	for(i = 0; i < comps.count; i++) {
		// FIXME - need to do the embedded setting like Rails does - i.e. name[subname]=val or name[]=val
		NSString *comp = [comps objectAtIndex:i];
		NSArray *keyval = [comp componentsSeparatedByString:@"="];
		NSString *key = [[keyval objectAtIndex:0] URLDecode];
		NSString *val = @"";
		if(keyval.count > 1) {
			val = [[keyval objectAtIndex:1] URLDecode];
		}
		[dict setObject:val forKey:key];
	}

	return dict;
}

@end
