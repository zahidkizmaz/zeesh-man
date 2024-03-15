FROM zshusers/zsh:latest

# Install dependencies
RUN apt update && apt upgrade -y
RUN apt install -y git

COPY ./bootstrap.zshrc root/.zshrc

ENTRYPOINT [ "zsh" ]
