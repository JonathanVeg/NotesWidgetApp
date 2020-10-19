//
//  WidgetHelper.m
//  NotesWidgetApp
//
//  Created by Jonathan Silva on 16/10/20.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(WidgetHelper, NSObject)
RCT_EXTERN_METHOD(UpdateNote: (NSString *)note)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
