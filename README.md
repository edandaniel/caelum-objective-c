# INTRO 😂😂😂 🙃

# Infra
MacMini

## iOS
- iPhone
- iPad
- iPad
- iWatch
- appleTV

## MacOS
- Mac

## how 2 dev
- Xcode
 -SDK

## Lang
- Objective-C / Swift

iOS          | MacOS
---
Cocoa Touch  | Cocoa (unica diferenca entre os 2)
MediaLayer   | MediaLayer
CoreServices | CoreServices
CoreOS       | ∂CoreOS

## Story Time

- Apple MacOS 9
- Steve Jobs demitido
- Cria Empresa Next
- Stepstone
— Biologia
- C com objetos
- Interface Builder
- Steve buys Stepstone, join to Next, become NextStep
- Uncle Steve goes back to Apple

# Xcode

## Storyboard | Interface Builder
- 1 arquivo
- n telas

## xib (Xcode Interface Builder)
- 1 arquivo
- 1 tela

Storyboard fala com xib
programaticamente

## iOS x Android | Simulador x Emulador
iOS: Simulador (faz de conta)
Android: Emulador (mundo real)

# Objective-C 

## .h (header)
cabecalho e definicoes
*publico*

### Comportamento de tela => UIViewController
@interface ViewController : UIViewController
":" -> extends do java (son of a...)
UIViewController é como se fosse Activity do Android

## .m (messages)
@implementation ViewController

### static / non static
- (metodo de instancia) (non static)
+ (static)

## IBAction
Interface Builder Action

## [ ] 
Objective-C trabalha com mensagens, em tempo de execucao
*[* e *]* sao usados para troca de mensagens

## NS
NextStep

## ("string exemplo %@",stringue)
Interpolacao de string

## toda classe deve ser filha de alguem 
nao existe classe sem referencia para pai

## syntax sugar

```ObjectiveC
NSString* email = [self.email text];
NSString* mail = self.mail.text; //funciona assim, mas é dangerous (get, setters e via)
```

[Contato new] => [[Contato alloc] init]
[[self nome] text]

## @property
 cria getter, setter e iVar (variavel de Instancia)

## memory
Java (Garbage colector)
iOS
- In ye olde times, controlar no dedo, contava referencias e limpava quando era 0
- nowadays, ARC controla (Automatic Reference Counting)

## Referencia : strong x weak
strong
- se tem controle do objeto, voce que instanciou e controla quando libera
- voce segura cachorro com a coleira, so foge se voce soltar
- mantem na memoria enquanto o dono esta na memoria
- ARC so remove da memoria quando o dono soltar
weak
- quando voce só usa a referencia, nao conhece quem criou e nao controla quem libera
- voce aponta ao cachorro, nao controla quando ele foge
- ARC pode remover da memoria, mesmo quando estiver sendo chamado

>"Sempre que você olha uma criança, há sempre uma figura oculta, que é um cachorro atrás, o que é algo muito importante" - Dilma Rouseff

## Arrays
Imutaveis, sempre cria objeto novo com itens anteriores + novos, precisa sempre re-referenciar

verifica classe([var isKindOfClass[NSInteger class]])

## inicializadores
a linguagem nao tem constructors (funciona diferente)
inicializadores comecam com init
classe id = NSObject* , ponteiro de object, palavra reservada
instancetype = id = NSObject*

## variaveis privadas
para acessar, precisa de _nomedaproperty 

## singleton
objective C nao aceita singleton (nao tem construtor privado), mas da pra chegar perto

# AppDelegate UI
        application:didFinishLaunchingWithOptions (assinatura)
        application:(UIApplication*)app didFinishLaunchingWithOptions:(NSDictionary*)options (nome do metodo)
            ˆ
			|		      window
iOS -> AppDelegate->(ViewController+View)

é possivel ter uma tela principal antes da app porque é chamada antes a AppDelegate, antes de criar a windows, que é criada pela junçao do view e ViewController

# funcao que recebe 2 parametros
application:(UIApplication*)app didFinishLaunchingWithOptions:(NSDictionary*)options ()

## e.g., funcao divide para calcular 10/5

JAVA

```Java
//declaracao
public int divide(int num1, int num2)
//chamada
divide(10,5)
```
quando se chama, sem documentacao e implentacao nao se sabe como é a chamada, a ordem, funcao nao tem um sentido so com o nome

ObjectiveC

```ObjectiveC
//declaracao
-(int)divide:(int)num1 por:(int)
//chamada
divide:10 por:5
//nome da funcao
divide:por:

//still works, but pls, dont do it, not standart, all of the bad practices
//declaracao
-(int)divide:(int)num1 :(int)
//chamada
divide:10:5
//nome
divide::
```
WHY?
nome do metodo fica como uma frase, cria um sentido (divide:10 por:5)
P.S.
se existir uma funcao divide:por:resto, o ObjectiveC considera uma funcao totalmente diferente, porque o nome muda
BUT, uma funcao com mesmo nome ou outros tipos, (divide:por: porem float:float) da merda, a linguagem acha que as duas sao a mesma, pls dont do it


## UIAlertController
fusao de UI AlertView e UIActionSheet

# downcast
cast automatico de classe mae pra classe filha, nao da problema

# push pop, present, dismiss
present e dismiss nao aparece botoes de navegacao
e sao fullscren

push e pop mostra botoes de navegacao, nao maximiza a tela
pop, voce perde objeto


## self (objC) vs this (java)
no java nao precisa chamar o this na propria classe
no objC é obrigatorio usar self pra referenciar a si mesmo, chamar metodos e tal

# .
só se usa com getter e setter, e.g. coisa.propriedade = 1 ou x = coisa.propriedade
pra executar metodos é troca de mensagem, se usa [ coisa chamadaAAlgo]

# try catch
@try @catch

# arrays
regra de 3 prova matematica de vetor/string java/objC
```
" " = @" "
[ ] =  x

" "x =  @" " [ ]

x = @ " " [ ] = @[ ]
    ----------
      " "
```      
c.q.d

# screen loading stuff
init -> loadView -> viewDidLoad -> viewWillAppear -> viewDidAppear -> viewWillDisappear -> viewDidDisappear -> viewDidUnload -> dealloc
- init
	- chamado 1x só
- loadView
	- chamado quando terra fez carregamento pela 1a vez, ainda nao foi apresentado
	- outlet desligados
	- chamado 1x só
- viewDidLoad
	- layout ja foi carregado
	- Outlet ligados
	- chamado 1x só
- viewWillAppear
	- daqui pra frente sao chamados varias vezes a cada criacao de tela
- viewDidAppear
	- view ja apareceu
	- chamado varias vezes
	- show/hide, push pop, etc

# properties
chama com self 

# @protocol
como se fosse interface do java / C# 
implements entre < > 

# delegate
cria interface / protocol
quem usa a informacao manda no metodo que esta definido para aquele protocolo 
é bom porque desacopla uma classe da outra 
todo argumento delegate precisa de um protocolo onde é o nome da classe + argumento 
precisa implementar protocolo 

# @selector
chamado apenas em tempo de execucao, se nao existir o metodo/chamada, compila do mesmo jeito 

# tableview
é um IBOutlet

# notification center
chamadas de uma App para uma URL sempre passam pelo notification center

# MessageUI 
nao funciona tao bem com simulador, precisa de um aparelho real pra testar 

# IBAction
igual void, porem o storyboard consegue ver o objeto

# new alloc init
[Class new] = [[Class alloc] init]

# why the hell * everywhere (C revirew)

in C
```C
struct Pessoa{
	int idade;
	char[] nome;
}
//uso com ponteiro
Pessoa* p = ... malloc (sizeof(Pessoa));


typedef ClassePessoa struct Pessoa*;
ClassePessoa p = ... malloc (sizeof(Pessoa));
```
tipos que nao tem ponteiro possuem um typedef

# DATA BASS ***
ORM (Object relational mapping)
Coredata

## ways to store data
- memory
+ custom
+ sqlite
+ binary
+ xml file

## xcdatamodel
addEntity
imagem -> transformable

------------------------------
NSManagedObjectModel
|
| NSPersistentStoreCoordinator
|
v
NSPersistentStoreType
------------------------------
para isso funcionar é necessario NSManagedObjectContext

todo objeto gerenciado pelo core data precisa ser 

# NSManager
quando mudamos NSObject para NSManagedObject nao se pode usar mais new
NSObject aceita new mas NSManagedObject é controlado pelo manager, quando se usa um new o manager perde o controle da ruim
para arrumar precisa usar o data setter 

@dynamic, usando isso getter e setters sao gerados em tempo de execucao e nao compilacao


AppDelegate		- ContatoDAO
Coredata  		- CoreDAO
				- deixa quieto
---
se der erro no sqlite, apagar app do emulador (o que apaga o banco temporario) e criar de novo



