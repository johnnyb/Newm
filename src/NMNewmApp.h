#import <Foundation/Foundation.h>
#import "NMRouteMap.h"

@class NMNewmApp;

@interface NMNewmApp : NSObject {
	NMRouteMap *routeMap;
}

+(NMNewmApp *) boot;

-(void) processRequest:(NMAbstractRequest *)req;

@property (retain) NMRouteMap *routeMap;

@end
