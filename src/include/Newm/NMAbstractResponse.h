// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import <Newm/NMCookieJar.h>
#import <Newm/NewmMacros.h>

typedef id<NSCoding,NSObject> idSessionType;

@interface NMAbstractResponse : NSObject {
	NSMutableDictionary *headers;
	NSMutableData *content;
	NMCookieJar *cookieJar;	
	idSessionType session;
}

-(void) writeContentData:(NSData *)data;
-(void) writeContentString:(NSString *)str;
-(void) prepareSendHeaders;
-(void) sendHeaders;
-(void) sendContent;

OBJC_ACC_DECL(NSMutableDictionary *, headers, setHeaders)
OBJC_ACC_DECL(NSMutableData *, content, setContent)
OBJC_ACC_DECL(NMCookieJar *, cookieJar, setCookieJar)
OBJC_ACC_DECL(idSessionType, session, setSession)

-(void) addHeaderValue:(NSString *)val forField:(NSString *)fld;
-(void) setHeaderValue:(NSString *)val forField:(NSString *)fld;

-(BOOL) contentNeeded;

@end
