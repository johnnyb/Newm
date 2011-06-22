#import <Foundation/Foundation.h>
#import <Newm/NMCookie.h>
@interface NMCookieJar : NSObject {
	NSMutableDictionary *cookies;
	NSString *defaultDomain;
	NSString *defaultPath;
}

+(NMCookieJar *) cookieJarForCookieHeaderValue:(NSString *)cookieString;
-(void) setCookiesUsingCookieHeaderValue:(NSString *)cookieString;

-(NMCookie *) cookieForKey:(NSString *)key;
-(NSString *) cookieValueForKey:(NSString *)key;
-(void) setCookieValue:(NSString *)val forKey:(NSString *)key;
-(void) setCookieValue:(NSString *)val forKey:(NSString *)key expires:(NSDate *)exp;
-(void) setCookie:(NMCookie *)cookie;
-(NSArray *) cookies;
-(NSDictionary *) cookieValueDictionary;
-(BOOL) isEmpty;

OBJC_ACC_DECL(NSString *, defaultDomain, setDefaultDomain)
OBJC_ACC_DECL(NSString *, defaultPath, setDefaultPath)

@end
