//
//  AAMole.h
//  MolesAndStuff
//
//  Created by Kyle Oba on 3/13/14.
//  Copyright (c) 2014 AgencyAgency. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AAMoleDelegate.h"

@interface AAMole : UIView
@property (nonatomic, weak) id<AAMoleDelegate> delegate;
- (void)move;
@end
