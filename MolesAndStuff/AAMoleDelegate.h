//
//  AAMoleDelegate.h
//  MolesAndStuff
//
//  Created by Kyle Oba on 3/19/14.
//  Copyright (c) 2014 AgencyAgency. All rights reserved.
//
@class AAMole;

@protocol AAMoleDelegate <NSObject>

- (void)moleTapped:(AAMole *)mole;

@end
