#import <Foundation/Foundation.h>
#import <Newm/NewmMacros.h>

@interface NMCookie : NSObject {
	NSString *key;
	NSString *value;
	NSDate *expires;
	BOOL secure;
	BOOL httpOnly;
	NSString *path;
	NSString *domain;
}

-(id) initWithHeaderString:(NSString *)headerString;
-(id) initWithKey:(NSString *)key value:(NSString *)value;

-(NSString *) key;
-(NSString *) value;

OBJC_ACC_DECL(NSDate *, expires, setExpires)
OBJC_ACC_DECL(NSString *, path, setPath)
OBJC_ACC_DECL(NSString *, domain, setDomain)
OBJC_ACC_DECL(BOOL, secure, setSecure)
OBJC_ACC_DECL(BOOL, httpOnly, setHttpOnly)

-(NSString *) headerStringForSetCookie;

@end
