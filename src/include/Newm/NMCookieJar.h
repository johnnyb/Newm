#import <Foundation/Foundation.h>
#import <Newm/NMCookie.h>
@interface NMCookieJar : NSObject {
	NSMutableDictionary *cookies;
}

+(NMCookieJar *) cookieJarForCookieHeaderValue:(NSString *)cookieString;
-(void) setCookiesUsingCookieHeaderValue:(NSString *)cookieString;

-(NMCookie *) cookieForKey:(NSString *)key;
-(NSString *) cookieValueStringForKey:(NSString *)key;
-(void) setCookieValueString:(NSString *)val forKey:(NSString *)key;
-(void) setCookie:(NMCookie *)cookie;
-(NSArray *) cookies;

@end
