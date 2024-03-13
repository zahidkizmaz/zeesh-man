FROM zshusers/zsh:latest

# Install dependencies
RUN apt update && apt upgrade -y
RUN apt install -y git

COPY . /zeesh
WORKDIR /zeesh

ENTRYPOINT [ "zsh" ]
