#import <Foundation/Foundation.h>
#import "NMAbstractController.h"

@class NMAbstractController;

@interface NMAbstractView : NSObject {
	NMAbstractController *controller;
}

+(NMAbstractView *) viewForControllerName:(NSString *)cname actionName:(NSString *)aname format:(NSString *)fmt;

-(void) reset;

-(NSData *) render;

@property (retain) NMAbstractController *controller;

@end
