#import <Foundation/Foundation.h>
#import "NMAbstractController.h"

@class NMAbstractController;

@interface NMAbstractView : NSObject {
}

+(NMAbstractView *) viewForControllerName:(NSString *)cname actionName:(NSString *)aname format:(NSString *)fmt;

-(void) reset;

-(NSData *) render:(NMAbstractController *)ctrl;

@end
