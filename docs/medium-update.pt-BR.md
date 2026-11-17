# Atualização do tutorial no Medium

- Artigo original: https://medium.com/@kleberandrade/criando-um-jogo-da-velha-em-flutter-50347537c926
- URL canônica preservada: https://medium.com/flutter-comunidade-br/criando-um-jogo-da-velha-em-flutter-50347537c926
- Em 17/11/2026, o artigo completo foi aberto/lido no Chrome e o editor da conta Kleber Andrade estava disponível. A atualização foi salva/publicada e conferida no artigo público, cujo retorno incluiu `postPublishedType=repub`.
- Foi incluída uma seção inicial em português com Flutter 3.41.9 / Dart 3.11.5, dependências reais, comandos de clone/instalação/teste/build, exemplo do domínio e nova estrutura de arquivos.
- A seção explica índices 0–8 versus teclas 1–9, rejeição de jogadas, término e placar, reinício, bot determinístico e o erro original `nextInt(list.length - 1)`. Explica também a troca de RaisedButton/FlatButton e os limites de validação Web/telefone/leitor de tela.
- Imagens, explicações e links da edição de 2020 foram preservados e identificados como material histórico. As recomendações antigas `custom_splash` e `share` não são apresentadas como dependências atuais. Links de terceiros não foram editados.
- O editor converteu hífens de comandos em travessões no primeiro paste; foram corrigidos com formatação de código e verificados no texto publicado: `flutter pub get --enforce-lockfile`, `flutter analyze --fatal-infos`, `flutter test --coverage` e `nextInt(list.length - 1)`.
- Nenhuma newsletter, e-mail ou mensagem para seguidores foi enviada. Não houve bloqueio editorial, paywall ou CAPTCHA nesta operação.

## Revisão completa solicitada pelo autor

A nova versão foi reescrita integralmente no editor, com seis etapas didáticas, modelo completo, entrada/tema, adaptador de jogadas, teste executado e oito blocos de código com linguagens configuradas corretamente. Termina com exatamente cinco exercícios: escolha de quem começa, desfazer, Minimax, persistência e acessibilidade com marcas próprias. As versões Flutter 3.50.0, Dart 3.14.0, material_ui 1.11.1, flutter_lints 6.0.0 e transitivos relevantes aparecem no texto; as duas restrições do SDK estão explícitas.

A capa nova é uma ilustração por IA identificada como tal. As duas capturas foram refeitas no build com os pacotes atuais. Fonte, ativos e auditoria completa estão em `docs/medium/`. O rascunho está salvo no Medium, mas a publicação integral aguarda concluir o envio das imagens: a extensão informou falta de acesso a arquivos locais; o autor autorizou habilitar, porém a política do navegador bloqueou `chrome://extensions`. Foi solicitado habilitar manualmente; nenhuma alteração de permissão foi feita pelo agente. Não confundir a seção inicial publicada na primeira rodada com a revisão integral ainda em rascunho.
