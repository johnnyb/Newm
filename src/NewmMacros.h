#define IS_EMPTY(val) ((val) == nil ? YES : ([(val) respondsToSelector:isEmpty] ? [(val) isEmpty] : NO ))
