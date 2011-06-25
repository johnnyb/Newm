#import <Newm/NSString+Newm.h>
#import <Newm/NSDictionary+Newm.h>
#import <Newm/NSArray+Newm.h>

//FIXME - need to define a protocol to send this message?
#define IS_EMPTY(val) ((val) == nil ? YES : \
			([(val) respondsToSelector:@selector(isEmpty)] ? [(val) isEmpty] :  \
				([(val) respondsToSelector:@selector(length)] ? ([(id)(val) length] == 0) : \
					([(val) respondsToSelector:@selector(count)] ? ([(id)(val) count] == 0) : \
						NO \
					) \
				) \
			) \
		)
#define INTSTR(val) ([NSString stringWithFormat:@"%d", (val)])

#define OBJC_ACC_ASSIGN(type, var, getter, setter) -(type) getter { return var; }\
-(void) setter:(type)val { var = val; }

#define OBJC_ACC(type, var, getter, setter) -(type) getter { return var; } \
-(void) setter:(type)val { [val retain]; [var release]; var = val; }

#define OBJC_ACC_DECL(type, getter, setter) -(type) getter; \
-(void) setter:(type)val;


#define NEWM_APP() (globalNewmApp)

/* Not sure I need these, but good to have around */
#define INITFUNC void __attribute__ ((constructor))
#define FINIFUNC void __attribute__ ((destructor))


/* Entry Point Definitions */
#define CGI_ENTRY_POINT(cls) int main() { NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init]; cls *app = [[[cls alloc] init] autorelease]; NMCgiRequest *req = [[[NMCgiRequest alloc] init] autorelease]; globalNewmApp = app; NMCgiResponse *resp = [[[NMCgiResponse alloc] init] autorelease]; [req loadEnvironmentVariables]; [app processRequest:req usingResponse:resp]; [pool drain];  return 0; }
