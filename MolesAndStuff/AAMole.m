//
//  AAMole.m
//  MolesAndStuff
//
//  Created by Kyle Oba on 3/13/14.
//  Copyright (c) 2014 AgencyAgency. All rights reserved.
//

#import "AAMole.h"

@interface AAMole ()
@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;
@end

@implementation AAMole

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addGestureRecognizer:self.tapGesture];
    }
    return self;
}

- (UITapGestureRecognizer *)tapGesture
{
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    }
    return _tapGesture;
}

- (void)handleTapGesture:(UITapGestureRecognizer *)tapGesture
{
    NSLog(@"tap mole!");

}

- (void)move
{
    CGPoint newLoc = self.center;
    newLoc.y -= 5.0f;
    self.center = newLoc;
}

@end
