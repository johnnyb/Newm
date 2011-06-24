// Copyright 2011 Jonathan Bartlett

#import <Newm/NMAbstractResponse.h>

@implementation NMAbstractResponse

OBJC_ACC(NSMutableDictionary *, headers, headers, setHeaders)
OBJC_ACC(NSMutableData *, content, content, setContent)

-(id) init {
	self = [super init];

	[self setHeaders: [NSMutableDictionary dictionaryWithCapacity:10]];
	[self addHeaderValue:@"text/html" forField:@"Content-Type"];

	[self setContent: [NSMutableData dataWithCapacity:200000]];

	return self;
}

-(void) writeContentData:(NSData *)data {
	[content appendData:data];
}

-(void) writeContentString:(NSString *)str {
	[self writeContentData:[str dataUsingEncoding:NSUTF8StringEncoding]];
}

// This tells us if we need to run a view
-(BOOL) contentNeeded {
	// FIXME - check to see the status, the method (whether HEAD or not), and the content, to see if we still need content
	if([content length] == 0) {
		return YES;
	} else {
		return NO;
	}
}

-(void) addHeaderValue:(NSString *)val forField:(NSString *)fld {
	NSMutableArray *ary = [headers objectForKey:fld];
	if(ary == nil) {
		ary = [NSMutableArray arrayWithCapacity:5];
		[headers setObject:ary forKey:fld];
	}
	[ary addObject:val];
}

-(void) setHeaderValue:(NSString *)val forField:(NSString *)fld {
	[headers removeObjectForKey:fld];
	[self addHeaderValue:val forField:fld];
}

-(void) sendHeaders {
	//Must override in subclass
}

-(void) sendContent {
	//Must override in subclass
}

-(void) dealloc {
	[headers release];
	[content release];

	[super dealloc];
}


@end
