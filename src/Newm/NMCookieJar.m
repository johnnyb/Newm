#import <Foundation/Foundation.h>
#import <Newm/NMCookieJar.h>
#import <Newm/NewmMacros.h>
#import <Newm/NSString+Newm.h>

@implementation NMCookieJar

-(id) init {
	self = [super init];
	cookies = [NSMutableDictionary dictionaryWithCapacity:20];
	return self;
}

+(NMCookieJar *) cookieJarForCookieHeaderValue:(NSString *)cookieString {
	NMCookieJar *jar = [[[NMCookieJar alloc] init] autorelease];
	[jar setCookiesUsingCookieHeaderValue:cookieString];

	return jar;
}

-(void) setCookiesUsingCookieHeaderValue:(NSString *)cookieString {
	NSArray *ary = [cookieString componentsSeparatedByString:@";"];
	NSEnumerator *e = [ary objectEnumerator];
	NSString *cookieline;
	while((cookieline = [e nextObject])) {
		cookieline = [cookieline stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
		if(!IS_EMPTY(cookieline)) {
			NSArray *keyval = [cookieline componentsSeparatedByString:@"="];
			NSString *key = [[keyval objectAtIndex:0] URLDecode];
			NSString *val = [[keyval objectAtIndex:1] URLDecode];
			[self setCookieValueString:val forKey:key];
		}
	}
}

-(NMCookie *) cookieForKey:(NSString *)key {
	return [cookies objectForKey:key];
}

-(NSString *) cookieValueStringForKey:(NSString *)key {
	NMCookie *c = [cookies objectForKey:key];
	if(c == nil) {
		return nil;
	} else {
		return [c stringValue];
	}
}

-(void) setCookieValueString:(NSString *)val forKey:(NSString *)key {
	NMCookie *c = [[[NMCookie alloc] initWithKey:key valueString:val] autorelease];
	[cookies setObject:c forKey:key];
}

-(void) setCookie:(NMCookie *)cookie {
	[cookies setObject:cookie forKey:[cookie key]];
}

-(NSArray *) cookies {
	return [cookies allValues];
}

-(void) dealloc {
	[cookies release];
	[super dealloc];
}

@end
