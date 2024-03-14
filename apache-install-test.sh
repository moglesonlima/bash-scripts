#!/bin/bash

# Atualiza a lista de pacotes
sudo apt update

# Instala o servidor web Apache
sudo apt install -y apache2

# Cria o diretório para armazenar o arquivo HTML
sudo mkdir -p /var/www/html

# Cria o arquivo HTML
cat <<EOF | sudo tee /var/www/html/index.html > /dev/null
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Olá, EC2!</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
            padding: 20px;
            background-color: #ec7211;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #ffffff;
        }
        p {
            color: #ffffff;
            font-size: 18px;
        }
        a {
            color: #ffffff;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Olá, EC2!</h1>
        <p>Esta é uma página de exemplo hospedada em uma instância EC2.</p>
        <p>Sinta-se à vontade para <a href="#">explorar mais</a>.</p>
    </div>
</body>
</html>
EOF

# Reinicia o serviço do Apache para aplicar as alterações
sudo systemctl restart apache2

# Exibe mensagem de conclusão
echo "Servidor web Apache instalado e página HTML criada com sucesso!"
