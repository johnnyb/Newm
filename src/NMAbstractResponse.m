// Copyright 2011 Jonathan Bartlett

#import "NMAbstractResponse.h"

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
