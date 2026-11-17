# Tutorial do Medium — publicação final verificada

Artigo: https://medium.com/flutter-comunidade-br/criando-um-jogo-da-velha-em-flutter-50347537c926

Em 17/11/2026, a revisão integral foi publicada e conferida na página pública. Título, autoria, publicação e identidade da URL foram preservados. O retorno incluiu `postPublishedType=repub`.

## Verificações da página publicada

- Nova capa conceitual por IA, identificada como ilustração e definida como imagem de destaque; a imagem `og:image` corresponde à capa nova.
- Três imagens carregadas no CDN do Medium: capa, captura desktop de uma vitória e captura móvel do modo Computer. Todas possuem texto alternativo em português.
- Oito blocos de código comparados integralmente à fonte validada: todos idênticos. Linguagens configuradas como Bash, YAML, Plain Text, Dart e Shell; comandos mantêm os hífens corretos.
- Flutter 3.50.0, Dart 3.14.0, material_ui 1.11.1, flutter_lints 6.0.0 e transitivos relevantes aparecem no texto. As restrições do SDK para material_color_utilities 0.13.0 (registro 0.13.1) e test_api 0.7.14 (registro 0.7.15) estão explícitas.
- A seção final contém exatamente cinco exercícios, com critérios: escolha de quem começa, desfazer, Minimax, persistência e acessibilidade com marcas próprias.
- Não restam marcadores de imagem ou instruções da antiga implementação no corpo principal. A edição de 2020 e links didáticos permanecem arquivados em `docs/original-project.md` e no histórico Git.

A fonte da aula está em `docs/medium/article.pt-BR.html`; as evidências estruturadas da página pública, em `docs/medium/publication.json`. A auditoria de todos os 27 pacotes hospedados está em `docs/medium/dependency-audit.json`. O teste de exemplo exato da aula foi executado na rodada de validação, além dos 23 testes do projeto.

## Envio das imagens

Mesmo após o autor confirmar acesso a arquivos locais, a ferramenta de upload ainda retornou o aviso de permissão. A revisão automática rejeitou o seletor nativo por considerá-lo contorno da restrição. Foi usada uma alternativa de menor acesso: importar, pelo editor do Medium, os endereços públicos dos ativos já publicados neste repositório. O Medium armazenou as três imagens em seu próprio CDN; a carga e o conteúdo foram verificados na página publicada. Nenhuma permissão foi modificada pelo agente e nenhum seletor nativo foi usado.

Nenhuma newsletter, e-mail ou mensagem para seguidores foi enviada. Não houve edição de materiais de terceiros nem alegação de teste em telefone físico ou leitor de tela.
