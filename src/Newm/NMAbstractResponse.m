// Copyright 2011 Jonathan Bartlett

#import <Newm/NMAbstractResponse.h>

@implementation NMAbstractResponse

@synthesize headers;
@synthesize content;

-(id) init {
	self = [super init];

	self.headers = [NSMutableDictionary dictionaryWithCapacity:10];
	[headers setObject:@"text/html" forKey:@"Content-Type"];

	self.content = [NSMutableData dataWithCapacity:200000];

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
