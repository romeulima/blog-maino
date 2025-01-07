![Logo of the project](https://i0.wp.com/maino.com.br/wp-content/uploads/2021/11/Logo-Oficial.webp?fit=300%2C129&ssl=1)

# Mainô Blog

Desenvolvi um blog como parte de um desafio técnico para a Mainô, uma empresa focada em soluções tecnológicas para comércio exterior. Esse projeto tem como objetivo demonstrar habilidades em desenvolvimento backend utilizando Ruby on Rails. Isso inclui funcionalidades especificadas pela própria empresa. Esse projeto também reflete a capacidade de criar soluções de backend sólidas, otimizadas e adaptáveis, seguindo as boas práticas e padrões esperados no setor.

## Instalação / Primeiros passos

Para instalar e executar esse aplicativo, você precisará do Docker instalado em seu computador. Se você ainda não tem o Docker, siga as instruções no link abaixo para instalar o Docker:

```shell
https://docs.docker.com/get-started/get-docker/
```

Depois que o Docker estiver instalado, verifique a instalação com o seguinte comando:
```sh
$ docker run hello-world
```

### Configuração inicial

Inicialmente, você precisará de dois arquivos:
```shell
.env
config/master.key
```
> .env é usado para definir algumas variáveis de ambiente, como variáveis de banco de dados e variáveis de aplicativo

> master.key é usado para descriptografar o arquivo config/credentials.yml.enc, que contém credenciais confidenciais para o seu aplicativo.

### Etapas para gerar a master.key

Execute este comando:
```shell
rails secret
```
```shell
bin/rails credentials:edit
```
Depois que você tiver a master.key, o comando bin/rails credentials:edit poderá ser usado para editar as credenciais em config/credentials.yml.enc. Quando você executa esse comando, ele usa a chave para descriptografar o arquivo credentials.yml.enc para edição.

Adicione as credenciais do Gmail no arquivo
```yaml
smtp:
  user-name: 'email@gmail.com'
  password: 'senha'
```
A senha é a senha do gmail. Se você tiver o 2Fa, gere uma senha de aplicativo e use-a em vez disso. Para gerar a senha, vá para [https://support.google.com/accounts/answer/185833?hl=pt-br]

#### Se você não tiver ruby, poderá fazer isso:
```shell
docker pull ruby
docker run -it --rm ruby bash
gem install rails
rails secret
exit
```

Copie o segredo gerado para config/master.key

## Desenvolvimento

Clone esse repositório em seu computador:

```shell
git clone git@github.com:romeulima/blog-maino.git
cd blog-maino/
```

Certifique-se de que você já incluiu o .env na raiz do projeto e config/master.key

### Building

```sh
$ docker-compose build

$ docker-compose run web bundle exec rails db:create

$ docker-compose run web bundle exec rails db:migrate

$ docker-compose up
```
Agora você pode acessar o localhost <strong>sem porta</strong>

## Features

### Área pública (deslogada)
* Ver as postagens publicadas por todos os usuários, ordenadas da mais nova para a mais antiga.
* As postagens devem ser paginadas após 3 postagens, o que significa que a 4ª postagem será movida para a página 2 e assim por diante, com cada página contendo até 3 postagens.
* Publicar comentários anônimos.
* Registrar um novo usuário.
* Fazer login com um usuário existente.
* Recuperar a senha do usuário.

### Área logada
* Escrever e publicar uma postagem.
* Editar e excluir postagens publicadas anteriormente pelo usuário conectado.
* Comentar com um login de usuário identificado.
* Editar o perfil do usuário.
* Alterar a senha do usuário conectado.

### Features opcionais
* Escrever testes automatizados simples
* Implementar a internacionalização
* Adicionar tags aos posts e fornecer filtros para usar as tags registradas. As tags devem ser implementadas como uma nova tabela no modelo, associada aos posts.

### Super diferencial
* Ative o upload de arquivos TXT para criar um ou mais posts ou criar várias tags, usando o Sidekiq para processamento assíncrono (se possível).
```
  Post Title
  Post content
  tag1, tag2, tag3
  
  Post Title
  Post content
  ```

Este aplicação contém tudo isso e muito mais

## Features adicionais
* Projete um ambiente Docker para o aplicativo a fim de facilitar a implantação e simplificar a execução do aplicativo localmente em qualquer máquina.
* Implementar a funcionalidade de envio de e-mail.
* Criar uma página para exibir postagens para cada usuário individual.
* Criatividade

## Tasks futuras
- Adicionar pipeline de CI/CD
- Exibir para mostrar postagens de um usuário específico
- Excluir comentário
- Responder ao comentário
- Altere a pesquisa para filtrar tags semelhantes e não apenas as mesmas

## Links
- Repositório: https://github.com/romeulima/blog-maino/
- LinkedIn: https://linkedin.com/in/sromeulima/
- Aplicação: http://165.227.27.64/

## Licença
“O código deste projeto está licenciado sob a licença MIT.”
