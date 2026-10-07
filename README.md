# flutter_mvvm_supabase_auth_flow

[MVVM + Riverpod + Supabase + Internacionalização] Sistema flutter de login e cadastro com persistência de sessão.

#### Observação

As decisões técnicas e desenvolvimento do código-fonte deste projeto foram realizadas pelo autor, sem modelos de IA generativa.


## Descrição

Fluxo completo de autenticação de usuários com **MVVM**, **Riverpod** para gerenciamento de estado e dependências, **Supabase** para persistência de dados e validações de login e **Flutter Localizations** para internacionalização (seleção dinâmica de idiomas de acordo com o sistema operacional).

### Funcionalidades:


* **Autenticação:** Criação de contas com validação de email único (um email para uma conta) e validação de acesso de usuários existentes.
* **Persistência de Sessão:** O usuário continua conectado mesmo após fechar o aplicativo.
* **Gerência de Estado:** Controle de estado das páginas (carregamento, sucesso e erro) para operações do sistema.


## Fluxo geral de dependências

O diagrama abaixo mostra a comunicação dos componentes do sistema, de cima para baixo:

```
[ View / main ]
      | Dispara ações (ex: botão pressionado, inicialização do app, etc.)
      | 
[ ViewModel (Riverpod Provider) ]
      | Solicita ação do repositório
      | Altera estado de acordo com o estágio da execução das operações
      |
[ Repository ] 
      | Requisita e orquestra operações do datasource
      | Faz validações técnicas e de negócio
      | 
[ Datasource ] 
      | Tem contato direto com o banco de dados
      | Realiza operações de persistência e carregamento
      |
(Retorno atualiza o estado e interface para o usuário)
```


## Configuração e Execução

### 1. Configuração do Supabase (.env)

Crie um arquivo chamado `.env` na raiz do projeto e adicione as suas credenciais do Supabase. Em caso de dúvidas, siga o exemplo disponível no arquivo `env_example`.

```
SUPABASE_URL=sua_url_aqui
SUPABASE_PUBLISHABLE_KEY=sua_chave_aqui
```

### 2. Instalação de dependências
Execute o comando para baixar os pacotes do projeto:

```bash
flutter pub get
```

### 3. Iniciar o aplicativo

Adicione a flag `--dart-define-from-file=.env` aos argumentos adicionais de execução na sua IDE ou execute o comando abaixo:

```bash
flutter run --dart-define-from-file=.env
```