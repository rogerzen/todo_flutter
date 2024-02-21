# todo_flutter

Utilizando o distribuidor de estados Provider;
Projeto desenvolvido para fixar aprendizado em flutter como:
- Gerenciamneto de estados;
- Gerenciamento de dependencias;
- Clean architecture; 
- Widget;
- Tratamento de erros;
- LocalStorage;
- Encapsulamento do packge;
- Estrutura de Pastas;
- injeção de dependências;
---
Lista de Tarefas em Flutter

Este projeto foi desenvolvido como uma aplicação de lista de tarefas em Flutter, com o objetivo de solidificar os conceitos aprendidos em diversas áreas, tais como gerenciamento de estados, dependências, arquitetura limpa, widgets, tratamento de erros, armazenamento local, encapsulamento de pacotes, estrutura de pastas e injeção de dependências. Abaixo estão detalhadas algumas características e aspectos importantes do projeto:

Tecnologias Utilizadas:
Flutter
Provider (para gerenciamento de estados)
LocalStorage (para armazenamento local)
Injeção de Dependências (para organização e modularidade do código)
Funcionalidades Implementadas:
Adição de tarefas
Remoção de tarefas
Marcação de tarefas como concluídas
Persistência de dados localmente
Estrutura de Pastas:
A estrutura de pastas foi organizada seguindo os princípios da arquitetura limpa, separando as camadas da aplicação de forma clara e modular. As principais pastas são:

lib/
data/: Contém as classes responsáveis pela manipulação de dados, como o acesso ao armazenamento local.
domain/: Define as entidades e regras de negócio da aplicação.
presentation/: Responsável pela interface do usuário e pela lógica de apresentação, incluindo os widgets e o gerenciamento de estados.
Arquitetura:
O projeto segue uma abordagem de arquitetura limpa (Clean Architecture), separando claramente as responsabilidades em diferentes camadas. Isso promove a coesão, facilita a manutenção e permite a substituição de componentes com mais facilidade.

Gerenciamento de Estados:
O gerenciamento de estados foi feito utilizando o Provider, que é uma solução simples e eficaz para esse propósito em aplicações Flutter. Ele oferece uma maneira fácil de compartilhar e atualizar dados entre os diferentes widgets da aplicação de forma reativa.

Tratamento de Erros:
Foram implementadas estratégias de tratamento de erros para lidar com situações inesperadas, garantindo uma experiência mais robusta e amigável para o usuário.

Encapsulamento do Pacote:
Para manter o código modular e facilitar a reutilização, partes do código foram encapsuladas em pacotes, permitindo uma melhor organização e separação de responsabilidades.

Como Executar o Projeto:
Para executar o projeto, certifique-se de ter o Flutter instalado em seu ambiente de desenvolvimento. Clone o repositório e execute o comando flutter run no diretório raiz do projeto.

Contribuições:
Contribuições são bem-vindas! Sinta-se à vontade para abrir problemas (issues) ou enviar solicitações de pull (pull requests) para melhorar este projeto.

Autores:
Este projeto foi desenvolvido por [Seu Nome].