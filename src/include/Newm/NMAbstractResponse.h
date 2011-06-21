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

-(NSMutableDictionary *) headers;
-(void)setHeaders:(NSMutableDictionary *)val;

-(NSMutableData *) content;
-(void)setContent:(NSMutableData *)val;

-(BOOL) contentNeeded;

@end
