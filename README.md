# Finance App

App financeiro com dashboard e detalhes de transação. **O objetivo deste app é demonstrar o uso da biblioteca de Design System [Ruan Design System](https://github.com/ruanr/Ruan-Design-System)** — mostrando na prática como a lib facilita o desenvolvimento com componentes e tokens reutilizáveis.

---

## Uso do Ruan Design System

Este app utiliza a **Ruan Design System** como dependência local. A integração do DS no app mostra como:

- **Componentes** (`RuanText`, `RuanCard`, `RuanButton`) padronizam a interface e reduzem código repetitivo.
- **Tokens** (`PrimaryTokens`, `SecondaryTokens`) garantem espaçamento, tipografia e cores consistentes em todas as telas.
- **Tema** (`RuanTheme.light`) aplica o visual do DS em todo o app de uma vez.

Com isso, o desenvolvimento fica mais rápido e consistente: em vez de definir estilos e layouts manualmente, o app consome o DS e foca na lógica e no fluxo das telas. **O foco do projeto é justamente ilustrar essa integração e os benefícios do design system no dia a dia.**

### Integração no app

- **Tema:** `MaterialApp` usa `RuanTheme.light` em `main.dart`.
- **Tokens:** espaçamentos (`PrimaryTokens.spacingMd`, `spacingXs`, etc.), cores (`PrimaryTokens.primary600`, `SecondaryTokens.success`) e tipografia (`RuanTextStyle.displayMedium`, `bodySmall`, etc.) vêm do DS.
- **Componentes:** textos com `RuanText`, cards com `RuanCard`, botões com `RuanButton` em dashboard e tela de detalhes da transação.

Exemplo de uso no código:

```dart
import 'package:ruan_design_system/ruan_design_system.dart';

// Tema no app
MaterialApp(theme: RuanTheme.light, ...);

// Tokens e componentes
RuanCard(
  elevation: RuanCardElevation.medium,
  child: Column(
    children: [
      RuanText('Saldo na conta', style: RuanTextStyle.label),
      RuanText(valor, style: RuanTextStyle.displayLarge, color: PrimaryTokens.primary600),
    ],
  ),
);
```

---

## Estrutura do app

- **Dashboard:** card com saldo e rendimentos, carrossel de ações rápidas (Pix, Investimentos, Cartões, CDB, Tesouro), lista de últimas transações.
- **Detalhes da transação:** aberta ao tocar em um item; exibe valor, tipo, data e descrição.

Todas as telas foram construídas usando componentes e tokens do Ruan Design System.

---

## Pré-requisito

O repositório do **Ruan Design System** deve estar na pasta irmã desta:

```
Flutter/
  Ruan-Design-System/   (lib do DS)
  finance_app/          (este app)
```

Se estiver em outro caminho, altere o `path` em `pubspec.yaml`:

```yaml
dependencies:
  ruan_design_system:
    path: ../caminho/para/Ruan-Design-System
```

---

## Executar

```bash
flutter pub get
flutter run
```

Android: `flutter run -d <device_id>` (ex.: `emulator-5554`). Use `flutter devices` para listar.

---

## Plataformas

Projeto configurado para Android. Para adicionar iOS, na pasta do app:

```bash
flutter create . --platforms=ios
```

---

## Demonstração

Vídeo da tela do app em uso (arquivo `demo.webm` na raiz do repositório):

<video src="https://github.com/romulorq20/finance-app/demo.webm" controls width="320" style="max-width: 100%;"></video>
