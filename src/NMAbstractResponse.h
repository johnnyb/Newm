// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>

@interface NMAbstractResponse : NSObject {
	NSMutableDictionary *headers;
	NSMutableData *content;
}

-(void) writeContentData:(NSData *)data;
-(void) writeContentString:(NSString *)str;
-(void) sendHeaders;
-(void) sendContent;

@property (retain) NSMutableDictionary *headers;
@property (retain) NSMutableData *content;
@property (readonly) BOOL contentNeeded;

@end
