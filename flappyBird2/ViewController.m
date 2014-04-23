//
//  ViewController.m
//  flappyBird2
//
//  Created by Malcolm Geldmacher on 2/26/14.
//  Copyright (c) 2014 Malcolm Geldmacher. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _background1.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _ground1.frame = CGRectMake(0, self.view.frame.size.height - _ground1.frame.size.height, _ground1.frame.size.width, _ground1.frame.size.height);
    _birdPicture.frame = CGRectMake(_birdPicture.frame.origin.x, _birdPicture.frame.origin.y, 34, 24);
    birdPics = [[NSMutableArray alloc]init];
    [birdPics addObject:@"hands1 copy.png"];
    [birdPics addObject:@"hands2 copy.png"];
    [birdPics addObject:@"hands3 copy.png"];
    [birdPics addObject:@"hands4 copy.png"];
    [birdPics addObject:@"hands5 copy.png"];
    [birdPics addObject:@"hands6 copy.png"];
    [birdPics addObject:@"hands7 copy.png"];
    [birdPics addObject:@"hands8 copy.png"];
    birdPicNum = 0;
    timerCount = 0;
    gameLoopTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
    birdAccel = 0;
    gravityConstant = 0.22;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [gravityTimer invalidate];
    [gameLoopTimer invalidate];
}

-(void)updateFlaps
{
    [UIView animateWithDuration:0.1
            animations:^(void)
            {
                _birdPicture.image = [UIImage imageNamed:birdPics[birdPicNum]];
            }
            completion:^(BOOL finished){}];
    if(birdPicNum == [birdPics count] - 1)
    {
        birdPicNum = 0;
    }
    birdPicNum += 1;
}

-(void)updateGravity
{
    [UIView animateWithDuration:0.01
            animations:^(void)
            {
                _titlePicture.frame = CGRectMake(_titlePicture.frame.origin.x, _titlePicture.frame.origin.y - birdAccel, _titlePicture.frame.size.width, _titlePicture.frame.size.height);
            }
            completion:^(BOOL finished){}];
    NSLog(@"%f", birdAccel);
    NSLog(@"%f", _titlePicture.frame.origin.y);
    float temp =(self.view.frame.size.height);
    NSLog(@"%f", temp);
    if(_titlePicture.frame.origin.y < self.view.frame.size.height)
    {
        birdAccel -= gravityConstant;
    }
    else
    {
        birdAccel = (birdAccel * -1) - (birdAccel * -0.5);
    }
    
}

-(void)gameLoop
{
    [self updateGravity];
    if(timerCount == 13)
    {
        [self updateFlaps];
        timerCount = 0;
    }
    timerCount += 1;
}

- (IBAction)easyMode:(id)sender {
    gameMode=3;
}

- (IBAction)mediumMode:(id)sender {
    gameMode=2;
}

- (IBAction)hardMode:(id)sender {
    gameMode=1;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
@end
