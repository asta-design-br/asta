<h1>SETTING UP</h1>

First, if you don't have the Docker installed, you can do it clicking [here](https://www.docker.com/products/docker-desktop/) - to open in a new tab, press CMD(Mac) or CTRL(Win) and click - download and install it. We'll need it to go further.

While you wait the download, let's create some aliases to help you with most repetitive commands
```bash
asta() {
    docker compose exec -it web sh -c "$*"
}
rasta() {
    docker compose exec -it web sh -c "rails $*"
}
alias ownership='sudo chown -R $USER:$USER .' # run it if you see a permission denied error
alias app-init='sh init.sh' # run to create the enviroment
alias app-start='sh start.sh' #  run every time you want to start the app.
                              # It will run migrations and gem or packege instalations
```

To run commands inside your container, you can run `asta`, and the command at the end.

Exemples:
```bash
asta bundle install
```
```bash
asta yarn build --watch
```

To run rails commands, you can run `rasta` and then the rails command. Just like this:
```
rasta db:drop db:create db:migrate db:seed
``` 
```
rasta c
```

If you are running Docker on Linux, the files `rails new` created are owned by
root. This happens because the container runs as the root user. If this is the
case, after adding it to your zshrc, you can use this alias to change the ownership of the new files.

```bash
ownership
```

## INITIALIZATION (Only first run)

Go to the directory you want to clone the project and run

```bash
git clone git@github.com:asta-design-br/asta.git
```

Navigate into the new directory

```bash
cd asta
```

Paste in the terminal all at once and press enter:

```bash
touch .env && \
echo "DATABASE_NAME=asta_development" > .env && \
echo "DATABASE_USER=postgres" >> .env && \
echo "DATABASE_PASSWORD=docker" >> .env && \
echo "DATABASE_HOST=db" >> .env && \
echo "REDIS_HOST=redis" >> .env
```

If the docker is installed, you can build the enviroment and create the development database by running
```bash
app-init
```

## STARTING THE APP

Now, you can just run the app and start working :)
```bash
app-start
```
