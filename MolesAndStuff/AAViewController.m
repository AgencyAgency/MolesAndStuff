//
//  AAViewController.m
//  MolesAndStuff
//
//  Created by Kyle Oba on 3/13/14.
//  Copyright (c) 2014 AgencyAgency. All rights reserved.
//

#import "AAViewController.h"
#import "AAMole.h"

@interface AAViewController ()
@property (strong, nonatomic) NSMutableArray *moles;
@property (strong, nonatomic) CADisplayLink *displayLink;
@end

@implementation AAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.moles = [NSMutableArray array];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self startTickerLoop];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [self.displayLink invalidate];
    self.displayLink = nil;
}

- (void)createMoleAtLocation:(CGPoint)location
{
    AAMole *mole = [[AAMole alloc] initWithFrame:CGRectMake(0.0, 0.0, 50.0, 50.0)];
    mole.center = location;
    mole.backgroundColor = [UIColor redColor];
    [self.view addSubview:mole];
    [self.moles addObject:mole];
}

- (IBAction)handleFieldTapped:(UITapGestureRecognizer *)sender
{
    CGPoint location = [sender locationInView:self.view];
    [self createMoleAtLocation:location];
}

#pragma mark - Display Link Tick-Tock

- (CADisplayLink *)displayLink{
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self
                                                   selector:@selector(tick:)];
        _displayLink.frameInterval = 1.0f/60.0f;
        [_displayLink addToRunLoop:[NSRunLoop currentRunLoop]
                           forMode:NSDefaultRunLoopMode];
        _displayLink.paused = YES;
    }
    return _displayLink;
}

- (void)startTickerLoop
{
    self.displayLink.paused = NO;
}

- (void)stopTickerLoop
{
    self.displayLink.paused = YES;
}

- (void)tick:(CADisplayLink *)sender
{
    for (AAMole *mole in self.moles) {
        [mole move];
    }
}


@end
