// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import <Newm/NSDictionary+Newm.h>
#import <Newm/NSString+Newm.h>

@implementation NSDictionary(Newm)
+(NSMutableDictionary *) dictionaryFromURLEncodedQueryString:(NSString *)str {
	NSArray *comps = [str componentsSeparatedByString:@"&"];
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:[comps count]];
	int i;

	for(i = 0; i < [comps count]; i++) {
		// FIXME - need to do the embedded setting like Rails does - i.e. name[subname]=val or name[]=val
		NSString *comp = [comps objectAtIndex:i];
		NSArray *keyval = [comp componentsSeparatedByString:@"="];
		NSString *key = [[keyval objectAtIndex:0] URLDecode];
		if([key length] != 0) {
			NSString *val = @"";
			if([keyval count] > 1) {
				val = [[keyval objectAtIndex:1] URLDecode];
			}
			[dict setObject:val forKey:key];
		}
	}

	return dict;
}

-(NSString *) URLQueryString {
	NSMutableArray *params = [NSMutableArray arrayWithCapacity:[self count]];
	id key;
	NSEnumerator *enumerator = [self keyEnumerator];
	while((key = [enumerator nextObject])) {
		id val = [self objectForKey:key];
		[params addObject:[NSString stringWithFormat:@"%@=%@", [key URLEncode], [val URLEncode]]];
	}
	return [params componentsJoinedByString:@"&"];
}

-(BOOL) isEmpty {
	return [self count] == 0;
}

@end
