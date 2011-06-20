#define IS_EMPTY(val) ((val) == nil ? YES : ([(val) respondsToSelector:isEmpty] ? [(val) isEmpty] : NO ))
#define INTSTR(val) ([NSString stringWithFormat:@"%d", (val)])

#define NEWM_APP (globalNewmApp)

/* Entry Point Definitions */
#define CGI_ENTRY_POINT(cls) int main() { NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init]; cls *app = [[[cls alloc] init] autorelease]; NMCgiRequest *req = [[[NMCgiRequest alloc] init] autorelease]; globalNewmApp = app; NMCgiResponse *resp = [[[NMCgiResponse alloc] init] autorelease]; [req loadEnvironmentVariables]; [app processRequest:req usingResponse:resp]; [pool drain];  return 0; }
