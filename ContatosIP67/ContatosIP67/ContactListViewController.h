//
//  ContactListViewController.h
//  ContatosIP67
//
//  Created by ios6400 on 6/13/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDAO.h"

@interface ContactListViewController : UITableViewController
@property ContatoDAO* dao;
@property Contato* selecionado;
@end
