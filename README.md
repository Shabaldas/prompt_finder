### Requirements

FOR MACOS USER

  better to use rbenv
  - Ruby 3.2.2
  - Bundler - `gem install bundler`
  - Node.js 16.15.1 or higher - `brew install node@16`
  - Yarn 1.22.19 or higher - `brew install yarn` or [Install Yarn](https://yarnpkg.com/en/docs/install)
  - PostgreSQL - `brew install postgresql`
  ### Setup
  ```bash
  git clone git@github.com:Shabaldas/prompt_finder.git
  cd storm_esbuild
  ```

  #### Docker Setup
  ```
    docker-compose build
  ```
  or
  ```
    docker-compose up --build
  ```
  ### Run the servers locally
  change your username and password for postgres user in ```.env``` file
  push 
  ```bash
  bin/rails server -p 3000
  yarn build:css --watch
  yarn build --reload
  ```
  or
  ```foreman start```
  default port 3000

### RUN SEED LOCAL
  ```
  rails db:seed
  ```
