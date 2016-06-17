//
//  LISTA CONTATO VIEW CONTROLLER
//  LCVC
//  ContatosIP67
//
//  Created by ios6400 on 6/13/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "LCVC.h"
#import "FCVC.h"
#import "ContatoDAO.h"


@implementation LCVC
-(id)init{
    self = [super init];
    if(self){
        UIBarButtonItem* adiciona =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                 target:self
                                                                                 action:@selector(exibeForm)];
        self.navigationItem.rightBarButtonItem = adiciona;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        self.dao = [ContatoDAO instancia];
        self.linhaPintada = -1;
        
        UIImage* iconeContatos = [UIImage imageNamed:@"lista-contatos.png"];
        UITabBarItem* tab = [[UITabBarItem alloc] initWithTitle:@"Contatos"
                                                          image:iconeContatos
                                                            tag:0];
        self.tabBarItem = tab;
        self.navigationItem.title = @"contactos";
        [[ContatoDAO instancia] lista];
    }
    
    return self;
}

-(void)exibeForm {
    UIStoryboard* board = [UIStoryboard storyboardWithName:@"Main"
                                                    bundle:nil];
    FCVC* form = [board instantiateViewControllerWithIdentifier:@"form-contato"];
    form.delegate = self; /// sem essa linha nao delegava
    if(self.selecionado) form.contato  = _selecionado;
    [self.navigationController pushViewController:form animated:YES];
    _selecionado = nil;
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
commitEditingStyle:(UITableViewCellEditingStyle)style
 forRowAtIndexPath:(nonnull NSIndexPath *)path{
    if(style == UITableViewCellEditingStyleDelete){
        [self.dao.contatos removeObjectAtIndex:path.row];
        [table deleteRowsAtIndexPaths:@[path]
                     withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void) viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

-(void)		  tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(nonnull NSIndexPath *)path{
    _selecionado = [self.dao buscaContatoDaPosicao:path.row];
    [self exibeForm];
}

-(void)viewDidAppear:(BOOL)animated{
    if(self.linhaPintada > -1){
        NSIndexPath* path = [NSIndexPath indexPathForRow:self.linhaPintada
                                               inSection:0];
    
        [self.tableView selectRowAtIndexPath:path
                                    animated:YES
                              scrollPosition:UITableViewScrollPositionMiddle];
    }
    self.linhaPintada = -1;
}

-(void)contatoAtualizado:(Contato*)contato{
    self.linhaPintada = [self.dao buscaPosicaoDoContato:contato];
}

-(void)contatoAdicionado:(Contato*)contato{
    self.linhaPintada = [self.dao buscaPosicaoDoContato:contato];
}

-(void)viewDidLoad{
    UILongPressGestureRecognizer* cliqueLongo = [[UILongPressGestureRecognizer alloc]initWithTarget:self
                                                                                             action:@selector(abreMenuzinho:)];
    [self.tableView addGestureRecognizer:cliqueLongo]; //precisa estar aqui
}

-(void)abreMenuzinho:(UIGestureRecognizer*)gesture{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint ponto = [gesture locationInView:self.tableView];
        NSIndexPath* path = [self.tableView indexPathForRowAtPoint:ponto];
        if(path){
            self.selecionado = [self.dao buscaContatoDaPosicao:path.row];
            _gerenciador = [[GerenciadorDeAcoes alloc] initWithContato:self.selecionado];
            [            self.gerenciador acoesDoController:self];
        }
    }
}

@end