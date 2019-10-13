#import "SettingsVC.h"

@implementation SettingsVC {
    Avatar *Aang;
}


#define SwitchCell @"SwitchCell"
#define TextCell @"TextCell"
#define kThemeSwitchTag 69
#define ButtonCell @"ButtonCell"
- (void) loadView {
    [super loadView];
    Aang = [Avatar shared];
    self.title = @"More";
    ((UITableView*)self.view).separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = Aang.currentTheme == XPThemeDark ? Black : White;
    [self navBarMagic];
    // UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] 
    //     initWithBarButtonSystemItem:UIBarButtonSystemItemDone
    //     target:self 
    //     action:@selector(dismissMe)];
    // self.navigationItem.leftBarButtonItem = doneButton;
}
// - (void) dismissMe {
    // [self dismissViewControllerAnimated:true completion:nil];
// }
- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)navBarMagic {
	
	//self.navigationController.navigationBar.barTintColor = kMelroseColor;
	//self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
	
	self.navigationController.navigationBar.translucent = NO;
	
	[[UINavigationBar appearance] setTitleTextAttributes: @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
	
	self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
	
	[[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];

	[[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
	
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static   NSString *cellID = SwitchCell;
	
    if (indexPath.section == 0) { 
        cellID = SwitchCell;
    }else if (indexPath.section == 2) {
        cellID = ButtonCell;
    }else {
        cellID = TextCell;
    }
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];

        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            cell.textLabel.numberOfLines = 0;
            cell.contentView.backgroundColor = [UIColor clearColor];
            cell.backgroundColor = [UIColor clearColor];
            cell.layer.borderColor = kMelroseColor.CGColor;
            cell.layer.borderWidth = 1;
            cell.layer.cornerRadius = 7;
            cell.clipsToBounds = true;
            
        }
   
    if (indexPath.section == 0){
        UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
        cell.accessoryView = switchview;
        switchview.tag = kThemeSwitchTag;
        [switchview addTarget:self action:@selector(updateSwitchAtIndexPath:) forControlEvents:UIControlEventTouchUpInside];
    }
    if (indexPath.section == 2) {
        cell.textLabel.text = @"Licenses";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
	return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath { 
	
	cell.textLabel.textColor = Aang.currentTheme == XPThemeDark ? White : Black;
    
    switch (indexPath.section) {
        case 0: {
            switch (indexPath.row) {
                case 0: {
                    cell.textLabel.text = @"Dark mode";
                } break;
            
                default: {
                } break;
            }                        
        } break;
        case 1: {
                switch (indexPath.row) {
                    case 0: {
                        cell.textLabel.text = @"XPatcher\nA GUI frontend for Flips, libppf and XDelta\nCopyright © 2017-2019 Wh0ba. All Rights Reserved.";
                        cell.textLabel.textAlignment = NSTextAlignmentCenter;
                    } break;
                
                    default: {
                    } break;
                }
        }break;
        case 2: {
            switch (indexPath.row) {
                case 0: {
                    
                } break;
            
                default: {
                } break;
            }
        }break;
        default: {
        } break;
    }
    
}

- (void) buttonClicked:(UIButton*)butt {

}


- (void)updateSwitchAtIndexPath:(UISwitch*)aswitch{
	
    if (aswitch.tag == 69) {
            
        [Aang alertWithTitle:@"Dark mode" message:[NSString stringWithFormat:@"%@", aswitch.isOn ? @"ON" : @"OFF"]];
    }

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 30;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    return view;
}

@end