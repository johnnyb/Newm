#import <Foundation/Foundation.h>
#import <Newm/NMCookieJar.h>
#import <Newm/NewmMacros.h>
#import <Newm/NSString+Newm.h>
#import <Newm/NSDictionary+Newm.h>

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
	//NSLog(@"Loading %d cookies", [ary count]);
	while((cookieline = [e nextObject])) {
		cookieline = [cookieline stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
		if(!IS_EMPTY(cookieline)) {
			NSArray *keyval = [cookieline componentsSeparatedByString:@"="];
			//NSLog(@"Keyval: %@    Keyvalparsed: %@", cookieline, keyval);
			NSString *key = [[keyval objectAtIndex:0] URLDecode];
			NSString *val = [[keyval objectAtIndex:1] URLDecode];
			//NSLog(@"Setting cookie: %@ with val: %@", key, val);
			[self setCookieValue:val forKey:key];
		}
	}
}

-(NMCookie *) cookieForKey:(NSString *)key {
	return [cookies objectForKey:key];
}

-(NSString *) cookieValueForKey:(NSString *)key {
	NMCookie *c = [cookies objectForKey:key];
	return [c value];
}

-(void) setCookieValue:(NSString *)val forKey:(NSString *)key {
	[self setCookieValue:val forKey:key expires:nil];
}
-(void) setCookieValue:(NSString *)val forKey:(NSString *)key expires:(NSDate *)exp {
	NMCookie *c = [[[NMCookie alloc] initWithKey:key value:val] autorelease];
	[c setExpires:exp];
	if(defaultDomain != nil) {
		[c setDomain:defaultDomain];
	}
	if(defaultPath != nil) {
		[c setPath:defaultPath];
	}
	[cookies setObject:c forKey:key];
}

-(void) setCookie:(NMCookie *)cookie {
	[cookies setObject:cookie forKey:[cookie key]];
}

-(NSArray *) cookies {
	return [cookies allValues];
}

-(NSDictionary *) cookieValueDictionary {
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:[cookies count]];
	NSEnumerator *e = [cookies objectEnumerator];
	NMCookie *c;
	while((c = [e nextObject])) {
		[dict setObject:[c value] forKey:[c key]];
	}

	return dict;
}

OBJC_ACC(NSString *, defaultDomain, defaultDomain, setDefaultDomain)
OBJC_ACC(NSString *, defaultPath, defaultPath, setDefaultPath)

-(BOOL) isEmpty {
	return IS_EMPTY(cookies);
}

-(void) dealloc {
	[cookies release];
	[super dealloc];
}

@end
