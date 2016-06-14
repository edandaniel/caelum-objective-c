//
//  ContactListViewController.m
//  ContatosIP67
//
//  Created by ios6400 on 6/13/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "ContactListViewController.h"
#import "ContactFormViewController.h"
#import "ContatoDAO.h"


@implementation ContactListViewController
-(id)init{
    self = [super init];
    if(self){
        UIBarButtonItem* adiciona =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                 target:self
                                                                                 action:@selector(abreForm)];
        self.navigationItem.rightBarButtonItem = adiciona;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        self.dao = [ContatoDAO instancia];
    }
    return self;
}

-(void)abreForm {
    NSLog(@"AbriuForm");
    
    UIStoryboard* board = [UIStoryboard storyboardWithName:@"Main"
                                                    bundle:nil];
    ContactFormViewController* form =[board instantiateViewControllerWithIdentifier:@"form-contato"];
    [self.navigationController pushViewController:form animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    
    return [self.dao.contatos count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell*) tableView:(UITableView *) tableView
        cellForRowAtIndexPath:(NSIndexPath *) indexPath {
    
    UITableViewCell* linha = [tableView dequeueReusableCellWithIdentifier:@"linha"];
    if(!linha) {
        linha = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"linha"];
    }
    Contato* contato = [self.dao buscaContatoDaPosicao: indexPath.row];
    linha.textLabel.text = contato.nome;
    
    return linha;
}

-(void)  tableView:(UITableView *)table
commitEditingStyle:(UITableViewCellEditingStyle) style
 forRowAtIndexPath:(nonnull NSIndexPath *)path{
    NSLog(@"asdasd");
    if(style == UITableViewCellEditingStyleDelete){
        [self.dao.contatos removeObjectAtIndex:path.row];
        [table deleteRowsAtIndexPaths:@[path]
                     withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void) viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

@end
