// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import <Newm/NewmMacros.h>

@interface NMAbstractResponse : NSObject {
	NSMutableDictionary *headers;
	NSMutableData *content;
}

-(void) writeContentData:(NSData *)data;
-(void) writeContentString:(NSString *)str;
-(void) sendHeaders;
-(void) sendContent;

OBJC_ACC_DECL(NSMutableDictionary *, headers, setHeaders)
OBJC_ACC_DECL(NSMutableData *, content, setContent)

-(void) addHeaderValue:(NSString *)val forField:(NSString *)fld;
-(void) setHeaderValue:(NSString *)val forField:(NSString *)fld;

-(BOOL) contentNeeded;

@end
