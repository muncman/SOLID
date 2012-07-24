// From https://groups.google.com/forum/?fromgroups#!topic/cocoaheadsau/uJsj9uSociI
#import <Foundation/Foundation.h>

/**
 * This fixes a problem related to an Apple implementation of a core unix api.
 */
@interface CoverageFix : NSObject


FILE* fopen$UNIX2003(const char* filename, const char* mode);

size_t fwrite$UNIX2003(const void* ptr, size_t size, size_t nitems, FILE* stream);

@end
