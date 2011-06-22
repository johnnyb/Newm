#import <Foundation/Foundation.h>

@interface NMCookie : NSObject {
	NSString *key;
	NSData *value;
	NSDate *expires;
	BOOL secure;
	BOOL httpOnly;
	NSString *path;
	NSString *domain;
	NSString *signingKey;
}

-(id) initWithHeaderString:(NSString *)headerString signedWithKey:(NSString *)signingKey;
-(id) initWithHeaderString:(NSString *)headerString;
-(id) initWithKey:(NSString *)key valueString:(NSString *)value;
-(id) initWithKey:(NSString *)key value:(NSData *)value;

-(NSString *) key;
-(NSData *) value;
-(NSString *) stringValue;

-(NSDate *) expires;
-(void) setExpires:(NSDate *)val;
-(NSString *) path;
-(void) setPath:(NSString *)val;
-(NSString *) domain;
-(void) setDomain:(NSString *)val;
-(BOOL) secure;
-(void) setSecure:(BOOL)val;
-(BOOL) httpOnly;
-(void) setHttpOnly:(BOOL)val;

-(NSString *)signingKey;
-(void) setSigningKey:(NSString *)key;

-(NSString *) setCookieHeaderString;

@end
