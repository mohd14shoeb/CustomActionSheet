

#CustomActionSheet
[![CI Status](http://img.shields.io/travis/yaoqi/ViewFrame.svg?style=flat)](https://travis-ci.org/yaoqi/ViewFrame)
[![Version](https://img.shields.io/cocoapods/v/ViewFrame.svg?style=flat)](http://cocoapods.org/pods/ViewFrame)
[![License](https://img.shields.io/cocoapods/l/ViewFrame.svg?style=flat)](http://cocoapods.org/pods/ViewFrame)
[![Platform](https://img.shields.io/cocoapods/p/ViewFrame.svg?style=flat)](http://cocoapods.org/pods/ViewFrame)

##	 Documtent

自定义弹出框视图.

## Usage

	- (IBAction)actionSheetButtonClicked:(id)sender {
    	[[SHActionSheetView sh_actionSheet] sh_addSureButtonTitle:@"自定义弹出框！自定义弹出框！自定义弹出框！" addSureButtonTitle:@"确定" addCancelButtonTitle:@"取消" sureHandler:^{
        	NSLog(@"确定");
    	} cancelHandler:^{
        	NSLog(@"取消");
    	}];
	}


## Show Results

![github](https://github.com/yaoqi-github/CustomAlertView/blob/master/CustomActionSheet.gif)