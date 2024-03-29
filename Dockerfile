FROM zshusers/zsh:latest

# Install dependencies
RUN apt update && apt upgrade -y
RUN apt install -y git

COPY . /root/.local/share/zeesh/zeesh-man
WORKDIR /root/.local/share/zeesh/zeesh-man
RUN cp ./tests/basic.zshrc /root/.zshrc

ENTRYPOINT [ "zsh" ]
