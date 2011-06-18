#import <Foundation/Foundation.h>
#import "NMRouteMap.h"

@class NMNewmApp;

@interface NMNewmApp : NSObject {
	NMRouteMap *routeMap;
}

+(NMNewmApp *) boot;

@property (retain) NMRouteMap *routeMap;

@end
