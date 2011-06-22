#import <Newm/NMCookie.h>
#import <Newm/NewmMacros.h>

static NSString *kCookieDateFormat = @"ccc, e-LLL-yyyy H:m:s v";

@implementation NMCookie

-(id) initWithHeaderString:(NSString *)headerString {
	NSArray *components = [headerString componentsSeparatedByString:@";"];
	int i;
	int sz = [components count];
	for(i = 0; i < sz; i++) {
		NSString *str = [components objectAtIndex:i];
		NSArray *keyval = [str componentsSeparatedByString:@"="];
	
		NSString *k;
		NSString *v;
		if([keyval count] == 2) {
			k = [keyval objectAtIndex:0];
			v = [keyval objectAtIndex:1];
			k = [k stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
			v = [v stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		} else if([keyval count] == 1) {
			k = [keyval objectAtIndex:0];
			v = nil;
		} else {
			k = nil;
			v = nil;
		}
		
		if(i == 0) {
			// This is the actual key/val pair
			[k retain];
			key = k;
			[v retain];
			value = v;
		} else {
			// This is the cookie metadata

			// convert to lowercase
			k = [k lowercaseString];


			if([k isEqualToString: @"httponly"]) {
				[self setHttpOnly: YES];
			} else if([k isEqualToString:@"expires"]) {
				//FIXME - parse expires
				if(!IS_EMPTY(v)) {
					// Formatter information - http://www.stepcase.com/blog/2008/12/02/format-string-for-the-iphone-nsdateformatter/
					NSDateFormatter *df = [[[NSDateFormatter alloc] initWithDateFormat:kCookieDateFormat allowNaturalLanguage:NO] autorelease];
					NSDate *d = [df dateFromString:v];
					[self setExpires:d];
				}
			} else if([k isEqualToString:@"path"]) {
				[self setPath: v];
			} else if([k isEqualToString:@"domain"]) {
				[self setDomain: v];
			}
		}
	}

	return self;
}

-(id) initWithKey:(NSString *)k value:(NSString *)v {
	self = [super init];

	key = [k retain];
	value = [v retain];

	return self;
}

-(NSString *) key { return key; }
-(NSString *) value { return value; }

OBJC_ACC(NSDate *, expires, expires, setExpires)
OBJC_ACC(NSString *, path, path, setPath)
OBJC_ACC(NSString *, domain, domain, setDomain)
OBJC_ACC_ASSIGN(BOOL, secure, secure, setSecure)
OBJC_ACC_ASSIGN(BOOL, httpOnly, httpOnly, setHttpOnly)

-(NSString *) headerStringForSetCookie {
	NSMutableString *hstr = [NSMutableString stringWithCapacity:100];
	if(path != nil) {
		[hstr appendFormat:@"; path=%@", path];
	}
	if(domain != nil) {
		[hstr appendFormat:@"; domain=%@", domain];
	}
	if(expires != nil) {
		NSDateFormatter *df = [[[NSDateFormatter alloc] initWithDateFormat:kCookieDateFormat allowNaturalLanguage:NO] autorelease];
		[hstr appendFormat:@"; expires=%@", [df stringFromDate:expires]];
	}
	if(secure) {
		[hstr appendString:@"; secure"];
	}
	if(httpOnly) {
		[hstr appendString:@"; httponly"];
	}
	[hstr insertString:[NSString stringWithFormat:@"%@=%@", [key URLEncode], [value URLEncode]] atIndex:0];

	return hstr;
}

-(void) dealloc {
	[key release];
	[value release];
	[expires release];
	[path release];
	[domain release];

	[super dealloc];
}

@end
