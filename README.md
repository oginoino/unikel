# Unikel

🚀 **Template Flutter Profissional** - Um projeto base completo para acelerar o desenvolvimento de aplicações Flutter com arquitetura sólida e decisões técnicas bem fundamentadas.

## 🎯 Por que usar este template?

Este projeto foi estruturado para facilitar decisões arquiteturais cruciais no desenvolvimento Flutter, oferecendo:

- ✅ **Estrutura padronizada** e escalável
- ✅ **Roteamento robusto** com Go Router
- ✅ **Gerenciamento de estado** eficiente com Provider
- ✅ **Sistema de temas** flexível e customizável
- ✅ **Organização de código** clara e maintível

## 🍕 Implementações de Referência

Veja exemplos práticos de como este template pode ser usado em projetos reais:

### **Reelex - App de Delivery**
🔗 **Repositório**: [https://github.com/GinoCodeSpace/reelex](https://github.com/GinoCodeSpace/reelex)

O **Reelex** é uma implementação completa do template Unikel, demonstrando como construir um aplicativo de delivery de comida com todas as funcionalidades essenciais:

**Funcionalidades Implementadas:**
- 🏪 **Catálogo de Restaurantes**: Navegação por restaurantes e cardápios
- 🛒 **Carrinho de Compras**: Adição/remoção de itens com cálculo automático
- 📋 **Gestão de Pedidos**: Acompanhamento de pedidos ativos e histórico
- 🎨 **Temas Claro/Escuro**: Interface adaptável com mudança dinâmica
- 🌍 **Suporte a Idiomas**: Localização para múltiplos idiomas
- 📱 **Design Responsivo**: Interface otimizada para diferentes telas

**Recursos Técnicos Aplicados:**
- 🔄 **Provider**: Gerenciamento de estado para carrinho, pedidos e configurações
- 🧭 **Go Router**: Navegação type-safe entre páginas
- 🎨 **UI Constants**: Sistema de design consistente
- 📱 **Responsive Design**: Adaptação automática para diferentes dispositivos
- 🌙 **Theme Switching**: Alternância dinâmica entre temas

> 💡 **Use como referência**: O Reelex demonstra na prática como aplicar os padrões arquiteturais do Unikel em um projeto real e completo.

## 📁 Estrutura do Projeto

```
assets/                 # 📁 Recursos estáticos da aplicação
├── fonts/              # 🔤 Fontes personalizadas
│   └── sf-pro-text-regular/
│       └── SF-Pro-Text-Regular.otf
└── .env               # 🔧 Variáveis de ambiente (opcional)

lib/
├── app/                 # 🏗️ Configuração principal da aplicação
│   └── unikel_app.dart
├── config/             # ⚙️ Configurações centralizadas
│   ├── bootstrap.dart   # Inicialização da app
│   ├── di.dart         # Injeção de dependência
│   ├── environment.dart # Variáveis de ambiente
│   └── locale_config.dart # Configuração de idiomas
├── main.dart
├── model/              # 📊 Modelos de dados
│   └── locale_data.dart
├── providers/          # 🔄 Gerenciamento de estado
│   ├── locale_provider.dart
│   ├── register_provider.dart
│   └── theme_provider.dart
├── route/              # 🧭 Sistema de roteamento
│   ├── app_route.dart  # Definição de rotas
│   ├── handlers/       # Manipuladores de rota
│   │   └── handler_redirect.dart
│   ├── router.dart     # Configuração do Go Router
│   └── routes.dart     # Constantes de rotas
├── services/           # 🌐 Serviços e APIs
├── utils/              # 🛠️ Utilitários e helpers
│   ├── constants/      # Constantes da aplicação
│   │   ├── app_constants.dart
│   │   ├── locale_constants.dart
│   │   ├── string_constants.dart
│   │   └── ui_constants.dart
│   └── imports/        # Imports comuns
│       └── common_libs.dart
└── view/               # 🎨 Interface do usuário
    ├── component/      # Componentes reutilizáveis
    ├── page/          # Páginas da aplicação
    └── theme/         # Sistema de temas
```

## 🏗️ Decisões Arquiteturais

### **Estrutura Padrão**
Organização modular que separa claramente responsabilidades:
- **Separação de concerns**: Cada pasta tem uma responsabilidade específica
- **Escalabilidade**: Estrutura que cresce naturalmente com o projeto
- **Manutenibilidade**: Código fácil de localizar e modificar

### **Gerenciamento de Rotas - Go Router**
```dart
// Roteamento declarativo e type-safe
// Suporte a deep linking nativo
// Navegação programática simplificada
// Guards de rota para autenticação
```

**Vantagens do Go Router:**
- 🔗 Deep linking automático
- 📱 Suporte nativo para web e mobile
- 🛡️ Type safety nas rotas
- 🔄 Redirecionamentos condicionais

### **Gerenciamento de Estado - Provider**
```dart
// Estado reativo e performático
// Injeção de dependência simples
// Rebuild otimizado de widgets
// Fácil testabilidade
```

**Por que Provider:**
- ⚡ Performance otimizada
- 🧪 Fácil de testar
- 📚 Curva de aprendizado suave
- 🔧 Flexibilidade para diferentes padrões

### **Sistema de Temas e Tipografia**
- **Temas centralizados**: Cores, tipografia e espaçamentos consistentes
- **Dark/Light mode**: Suporte nativo a múltiplos temas
- **Responsividade**: Adaptação automática a diferentes telas
- **Fonte personalizada**: San Francisco Pro Text integrada (⚠️ **Licença necessária**)
- **Customização**: Fácil personalização da identidade visual

#### 🎨 **Sistema de Temas Claro/Escuro**
```dart
// lib/providers/theme_provider.dart
// Gerencia alternância entre temas claro e escuro
// Persiste preferência do usuário
// Detecta tema do sistema automaticamente
```

**Implementação:**
- 🌞 **Tema Claro**: Cores otimizadas para ambientes bem iluminados
- 🌙 **Tema Escuro**: Reduz fadiga ocular em ambientes com pouca luz
- 🔄 **Alternância Dinâmica**: Mudança instantânea sem restart
- 💾 **Persistência**: Lembra da preferência do usuário
- 📱 **Detecção Automática**: Segue configuração do sistema operacional

#### 🌍 **Sistema de Localização (i18n)**
```dart
// lib/config/locale_config.dart
// Configuração de idiomas suportados
// lib/providers/locale_provider.dart
// Gerenciamento de mudança de idioma
```

**Recursos de Localização:**
- 🗣️ **Múltiplos Idiomas**: Suporte extensível para diferentes idiomas
- 🔄 **Mudança Dinâmica**: Troca de idioma sem reiniciar o app
- 📱 **Detecção Automática**: Usa idioma do dispositivo como padrão
- 💾 **Persistência**: Mantém idioma escolhido pelo usuário
- 🎯 **Fallback Inteligente**: Volta para idioma padrão se necessário

### **Utils e Constants**
- **Helpers reutilizáveis**: Funções utilitárias comuns
- **Constantes tipadas**: Valores fixos organizados e type-safe
- **Extensões**: Métodos de extensão para tipos nativos
- **Validadores**: Funções de validação padronizadas

### **Configs**
- **Environment**: Configurações por ambiente (dev/prod)
- **Bootstrap**: Inicialização controlada da aplicação
- **DI Container**: Injeção de dependência centralizada
- **Locale**: Configuração de internacionalização

#### ⚙️ **Configurações Detalhadas**

**Environment (environment.dart)**
```dart
// Variáveis por ambiente (desenvolvimento, produção)
// URLs de API diferentes por ambiente
// Configurações de debug e logging
// Chaves de API e secrets por ambiente
```

**Bootstrap (bootstrap.dart)**
```dart
// Inicialização de serviços essenciais
// Configuração de providers globais
// Setup de dependências antes do app iniciar
// Tratamento de erros na inicialização
```

**Locale Config (locale_config.dart)**
```dart
// Lista de idiomas suportados
// Configuração de delegates de localização
// Definição de idioma padrão
// Formatação de data, número e moeda por região
```

## 🚀 Como Usar Este Template

### **Início Rápido**
```bash
# 1. Clone ou use como template
git clone <repository-url>
cd unikel

# 2. Instale as dependências
flutter pub get

# 3. Execute a aplicação
flutter run
```

### **Customização para Seu Projeto**

1. **Renomeie o projeto**:
   - Altere o nome em `pubspec.yaml`
   - Atualize imports e referências no código

2. **Configure seu tema**:
   - Em `lib/view/theme/`
   - Personalize cores, tipografia e espaçamentos

3. **Defina suas rotas**:
   - Em `lib/route/routes.dart`
   - Adicione as rotas do seu app

4. **Configure ambientes**:
   - Em `lib/config/environment.dart`
   - Defina variáveis por ambiente

## 📦 Dependências Principais

- **go_router**: Roteamento declarativo e type-safe
- **provider**: Gerenciamento de estado reativo
- **flutter_localizations**: Internacionalização nativa
- **get_it**: Injeção de dependência
- **google_fonts**: Fontes do Google
- **cupertino_icons**: Ícones do iOS

### **Recursos Inclusos**
- **Fonte San Francisco Pro**: Tipografia premium da Apple (⚠️ **Requer licença de uso**)
- **Estrutura modular**: Organização escalável de código
- **Configuração de ambiente**: Setup para diferentes ambientes

## 📁 Pasta Assets e Configuração

### **Estrutura da Pasta Assets**
A pasta `assets/` centraliza todos os recursos estáticos da aplicação:

```
assets/
├── fonts/              # Fontes personalizadas
│   └── sf-pro-text-regular/
│       └── SF-Pro-Text-Regular.otf
├── images/             # Imagens da aplicação (adicione conforme necessário)
│   ├── icons/          # Ícones personalizados
│   └── illustrations/  # Ilustrações e gráficos
└── .env               # Variáveis de ambiente (opcional)
```

### **Relação com pubspec.yaml**
Todos os assets devem ser declarados no `pubspec.yaml` para serem incluídos no build:

```yaml
flutter:
  # Fontes personalizadas
  fonts:
    - family: SanFranciscoPro
      fonts:
        - asset: assets/fonts/sf-pro-text-regular/SF-Pro-Text-Regular.otf
  
  # Assets gerais (descomente e configure conforme necessário)
  # assets:
  #   - assets/images/
  #   - assets/icons/
  #   - assets/.env
```

### **Como Usar Assets**

**Fontes:**
```dart
// Usando a fonte San Francisco Pro configurada
// ⚠️ IMPORTANTE: Certifique-se de ter licença para uso da fonte
Text(
  'Texto com fonte personalizada',
  style: TextStyle(
    fontFamily: 'SanFranciscoPro',
    fontSize: 16,
  ),
)
```

**Imagens (quando adicionadas):**
```dart
// Referenciando imagens da pasta assets
Image.asset('assets/images/logo.png')
Icon(AssetImage('assets/icons/custom_icon.png'))
```

**Variáveis de Ambiente:**
```dart
// Carregando arquivo .env (se configurado)
// Útil para URLs de API, chaves, etc.
const String apiUrl = String.fromEnvironment('API_URL');
```

### **Boas Práticas para Assets**
- 📝 **Sempre declare** novos assets no `pubspec.yaml`
- 🗂️ **Organize por tipo**: fontes, imagens, ícones em subpastas
- 🔒 **Não commite** arquivos `.env` com dados sensíveis
- 📱 **Use múltiplas resoluções** para imagens (1x, 2x, 3x)
- ⚡ **Otimize tamanhos** de imagens para melhor performance
- ⚖️ **Verifique licenças**: Certifique-se de ter direitos de uso para fontes e recursos

### **⚠️ Aviso Importante sobre Licenciamento**
A fonte **San Francisco Pro** incluída neste template é propriedade da Apple Inc. e está sujeita aos termos de licenciamento da Apple. Antes de usar esta fonte em seu projeto:

- ✅ **Para desenvolvimento iOS/macOS**: Geralmente permitido sob os termos de desenvolvedor Apple
- ⚠️ **Para outros usos**: Verifique os termos de licenciamento da Apple
- 🔄 **Alternativa recomendada**: Considere usar fontes do Google Fonts ou outras fontes com licenças abertas
- 📋 **Responsabilidade**: É sua responsabilidade garantir conformidade com os termos de licenciamento

**Fontes alternativas sugeridas:**
- **Inter**: Fonte moderna e versátil (Google Fonts)
- **Roboto**: Fonte padrão do Material Design (Google Fonts)
- **Open Sans**: Fonte legível e profissional (Google Fonts)

## 🎨 Benefícios para Novos Projetos

### **Produtividade**
- ⏱️ **Setup instantâneo**: Comece a desenvolver features imediatamente
- 🔄 **Padrões estabelecidos**: Sem perda de tempo decidindo arquitetura
- 📋 **Boilerplate reduzido**: Código repetitivo já implementado

### **Qualidade**
- 🏗️ **Arquitetura sólida**: Baseada em best practices
- 🧪 **Testabilidade**: Estrutura preparada para testes
- 📈 **Escalabilidade**: Cresce com seu projeto

### **Manutenibilidade**
- 📁 **Organização clara**: Fácil localização de código
- 🔧 **Baixo acoplamento**: Módulos independentes
- 📚 **Documentação**: Código auto-explicativo

## 🛠️ Próximos Passos

1. **Explore a estrutura**: Navegue pelos arquivos para entender a organização
2. **Customize o tema**: Adapte as cores e estilos para sua marca
3. **Adicione suas páginas**: Use os exemplos como base
4. **Configure APIs**: Implemente seus serviços na pasta `services/`
5. **Teste e itere**: Use a base sólida para experimentar

## 📚 Recursos Úteis

- [Documentação Go Router](https://pub.dev/packages/go_router)
- [Provider Pattern](https://pub.dev/packages/provider)
- [Flutter Architecture](https://docs.flutter.dev/development/data-and-backend/state-mgmt)
- [Material Design 3](https://m3.material.io/)

---

## 📄 Licença

Este projeto está licenciado sob a **MIT License** - veja o arquivo <mcfile name="LICENSE" path="c:\Users\ginal\projects\unikel\LICENSE"></mcfile> para detalhes.

### **O que isso significa?**
- ✅ **Uso comercial**: Pode usar em projetos comerciais
- ✅ **Modificação**: Pode modificar o código livremente
- ✅ **Distribuição**: Pode distribuir o código
- ✅ **Uso privado**: Pode usar para projetos privados
- ⚠️ **Sem garantia**: Software fornecido "como está"
- 📋 **Atribuição**: Deve manter o aviso de copyright

---

💡 **Dica**: Este template é um ponto de partida. Adapte-o às necessidades específicas do seu projeto mantendo os princípios arquiteturais fundamentais.
