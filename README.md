# Safetide

Safetide 

O Safetide é um aplicativo móvel inovador desenvolvido em Flutter que oferece suporte rápido e inteligente em situações de enchentes, com foco na proteção da vida e na resposta emergencial coordenada em diversas cidades do Brasil. Ele se destaca por ser uma ferramenta rápida, eficaz e intuitiva, com funcionalidades desenhadas pensando no usuário.

O aplicativo centraliza informações dispersas e democratiza o acesso a dados cruciais em situações de emergência. Permite que os usuários recebam alertas em tempo real da Defesa Civil, localizem abrigos seguros, visualizem áreas de risco no mapa e, em casos de extrema necessidade, acionem um botão SOS que envia sua localização para as autoridades e contatos de emergência. Além disso, a funcionalidade de relato de ocorrências empodera o cidadão para contribuir ativamente com a rede de informações, fornecendo dados importantes que podem auxiliar as equipes de resgate e gestão.

Tecnologias utilizadas
O projeto Safetide foi desenvolvido utilizando um conjunto robusto de tecnologias e ferramentas, visando eficiência, escalabilidade e uma experiência de usuário de alta qualidade:

Linguagem de Programação:

Dart: Linguagem principal para o desenvolvimento do aplicativo mobile.
Frameworks:

Flutter: Framework UI da Google para desenvolvimento multiplataforma (iOS e Android).

Ferramentas de Desenvolvimento:

VS Code
GitHub: Para controle de versão e colaboração.
Figma: Para design de interface e prototipagem

Instruções básicas de execução
Para executar o projeto Safetide localmente, siga os passos abaixo:

Pré-requisitos
Certifique-se de ter as seguintes ferramentas instaladas em sua máquina:

Flutter SDK: Instale o Flutter
Android Studio (com emulador configurado) ou Xcode (para iOS)
Node.js (se for utilizar Firebase Functions localmente ou backend customizado)
Conta Firebase: Crie um projeto no Firebase e configure-o para o seu aplicativo.
Configuração do Projeto
Clone o repositório:

Bash

git clone [LINK_DO_SEU_REPOSITORIO_GITHUB]
cd safetide
Instale as dependências do Flutter:

Bash

flutter pub get
Configuração do Firebase:

Siga as instruções para adicionar o Firebase ao seu projeto Flutter: Adicionar Firebase ao seu projeto Flutter
Baixe os arquivos de configuração do Firebase (google-services.json para Android e GoogleService-Info.plist para iOS) e coloque-os nas pastas corretas do seu projeto (android/app/ e ios/Runner/, respectivamente).
Configuração de APIs (Google Maps e OpenWeather):

Obtenha as chaves de API para Google Maps e OpenWeather.
Adicione suas chaves de API aos locais apropriados no código, geralmente em android/app/src/main/AndroidManifest.xml (para Google Maps Android) e ios/Runner/AppDelegate.swift ou ios/Runner/Info.plist (para Google Maps iOS), e em variáveis de ambiente ou arquivos de configuração seguros para OpenWeather.
Execução do Aplicativo
Inicie um emulador Android/iOS ou conecte um dispositivo físico.
Execute o aplicativo:
Bash

flutter run
Se você encontrar problemas, execute flutter doctor para verificar as configurações do seu ambiente.
Execução das Firebase Functions (Opcional - para desenvolvimento local)
Se você estiver desenvolvendo ou testando as Firebase Functions localmente:

Navegue até a pasta das functions:
Bash

cd firebase/functions # ou a pasta onde suas functions estão
Instale as dependências:
Bash

npm install
Inicie o emulador do Firebase:
Bash

firebase emulators:start
Certifique-se de configurar seu aplicativo Flutter para se conectar ao emulador do Firebase durante o desenvolvimento local.

